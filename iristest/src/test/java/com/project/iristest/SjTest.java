package com.project.iristest;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;

import org.junit.jupiter.api.Test;


public class SjTest {
	
	@Test
	public void test() throws NoSuchAlgorithmException {
		// 비밀번호 평문
		String raw = "password1234";
		String hex = "";
		
		// "SHA1PRNG"은 알고리즘 이름
		SecureRandom random = SecureRandom.getInstance("SHA1PRNG");
		byte[] bytes = new byte[16];
		random.nextBytes(bytes);
		// SALT 생성
		String salt = new String(Base64.getEncoder().encode(bytes));
		String rawAndSalt = raw+salt;
		
		System.out.println("raw : "+raw);
		System.out.println("salt : "+salt);
		
		MessageDigest md = MessageDigest.getInstance("SHA-256");
		// 평문 암호화
		md.update(raw.getBytes());
		hex = String.format("%064x", new BigInteger(1, md.digest()));
		System.out.println("raw의 해시값 : "+hex);
		
		// 평문+salt 암호화
		md.update(rawAndSalt.getBytes());
		hex = String.format("%064x", new BigInteger(1, md.digest()));
		System.out.println("raw+salt의 해시값 : "+hex);
	}
}
