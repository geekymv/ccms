package com.ccms.util;
import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;


/**
* @desc: 生成验证码
* @author: bingye@iflytek.com
* @createTime: 2014-10-24 上午10:42:31
* @history:
* @version: v1.0
*/
@Service
public class RandomValidateCode {

//	/**
//	 * 将图片的以字节形式写到客户端
//	 * @param request
//	 * @param response
//	 * @throws Exception
//	 */
//	public void getRandcode(HttpServletRequest request, HttpServletResponse response) throws Exception {
//		// 获取随机字符串
//		String str = createRandomString();
//		BufferedImage image = this.createImage(str);
//		// 将产生的字符串写入session，供校验时使用
//		HttpSession session = request.getSession();
//
//		session.removeAttribute("random");
//		session.setAttribute("random", str);
//		
//		ImageIO.write(image, "JPEG", response.getOutputStream());
//	}
	
	

	/**
	 * 产生四个0~9的随机数，放在一个字符串里
	 * @return
	 */
	public static String createRandomString() {
		String str = "";
		for (int i = 0; i < 4; i++) {
			str += Integer
					.toString((new Double(Math.random() * 10)).intValue());
		}
		return str;
	}

	/**
	 * 随机产生一个颜色
	 * @return
	 */
	public static Color createsRandomColor() {
		int r = (new Double(Math.random() * 256)).intValue();
		int g = (new Double(Math.random() * 256)).intValue();
		int b = (new Double(Math.random() * 256)).intValue();
		return new Color(r, g, b);
	}

	/**
	 * 生成一个内存图片，将四个随机数写在图片上
	 * @param str
	 * @return
	 */
	public static BufferedImage createImage(String str) {
		int width = 60;
		int height = 25;
		BufferedImage image = new BufferedImage(width, height,
				BufferedImage.TYPE_INT_RGB);
		// 获取图形上下文
		Graphics g = image.getGraphics();
		// 设定背景色
		g.setColor(Color.WHITE);
		g.fillRect(0, 0, width, height);
		// 画边框
		g.setColor(Color.black);
		g.drawRect(0, 0, width - 1, height - 1);
		// 将认证码显示到图象中
		g.setFont(new Font("Atlantic Inline", Font.PLAIN, 18));
		// 使用随机颜色
		g.setColor(createsRandomColor());
		// 将随机字符串的每个数字分别写到图片上
		g.drawString(Character.toString(str.charAt(0)), 8, 17);
		g.drawString(Character.toString(str.charAt(1)), 20, 17);
		g.drawString(Character.toString(str.charAt(2)), 33, 17);
		g.drawString(Character.toString(str.charAt(3)), 45, 17);
		// 图象生效
		g.dispose();
		return image;
	}
	
}
