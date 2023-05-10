package com.project.iristest.component;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;

import org.springframework.stereotype.Component;

@Component
public class SHA256Encrypt {

    //pw+salt 암호화값
    public String getEncrypt(String pw, String salt) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");

            md.update((pw + salt).getBytes());
            byte[] pwSalt = md.digest();

            StringBuffer sb = new StringBuffer();
            for(byte b : pwSalt) {
                sb.append(String.format("%02x", b));
            }
            result = sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return result;
    }
    
    
}
