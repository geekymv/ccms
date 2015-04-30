package com.ccms.util;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

public class EncryptUtil {
	/**
	 * 对密码进行md5加密
	 * 
	 * @param s
	 * @return
	 */
	public static String md5Encrypt(String s) {
		if ("".equals(s) || s == null) {
			return "";
		}
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] bys = md.digest(s.getBytes());
			return Base64Encrypt(bys);
		} catch (Exception e) {
			e.printStackTrace();
			return "";
		}
	}
	
	/**
	 * 验证密码是否正确
	 * @param md5Pwd 加密后的密码
	 * @param pwd 待验证的密码
	 * @return
	 */
	public static boolean checkePassword(String md5Pwd, String pwd){
		pwd = EncryptUtil.md5Encrypt(pwd);
		return md5Pwd.equals(pwd);
	}

	/**
	 * md5密码加密文件
	 * 
	 * @param str
	 * @return
	 * @throws NoSuchAlgorithmException
	 */
	public static String md5(String str) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("md5");
		if (str != null) {
			md.update(str.getBytes());
			byte b[] = md.digest();
			int i;
			StringBuffer buf = new StringBuffer("");
			for (int offset = 0; offset < b.length; offset++) {
				i = b[offset];
				if (i < 0)
					i += 256;
				if (i < 16)
					buf.append("0");
				buf.append(Integer.toHexString(i));
			}
			return buf.toString();
		}
		return null;
	}

	/**
	 * 基于64个元字符将字节信息形成字符串
	 * 
	 * @param bys
	 * @return
	 */
	public static String Base64Encrypt(byte[] bys) {
		BASE64Encoder base = new BASE64Encoder();
		String s = base.encode(bys);
		return s;
	}

	public static byte[] Base64Decrypt(String s) throws IOException {
		BASE64Decoder base = new BASE64Decoder();
		byte[] bys = base.decodeBuffer(s);
		return bys;
	}

	public static void main(String[] args) {
		String s = EncryptUtil.md5Encrypt("111111");
		System.out.println(s);
		
//		String c = EncryptUtil.md5Encrypt("abc");
//		System.out.println(c);
	}
}
