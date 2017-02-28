package org.tool.verify;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.tool.consts.WebConstant;


/**
 * 图形验证码
 * @author jxjy
 *
 */
public class VerifyAction
{
	/** 定义生成验证码图片的宽度 */
	private static final int IMG_WIDTH = 55;
	/** 定义生成验证码图片的高度 */
	private static final int IMG_HEIGHT = 22;
	/** 定义一个Random对象 */
	private static final Random random = new Random();

	public void execute() throws Exception 
	{
		HttpServletResponse response = ServletActionContext.getResponse();
		// 设置响应内容类型
		response.setContentType("image/jpeg");
		// 创建图片缓冲流对象
		BufferedImage image = new BufferedImage(IMG_WIDTH, IMG_HEIGHT, BufferedImage.TYPE_INT_RGB);
		// 获取画笔
		Graphics g = image.getGraphics();
		// 填充一个矩形
		g.fillRect(0, 0, IMG_WIDTH, IMG_HEIGHT);
		// 绘制矩形
		g.setColor(Color.BLACK); // 设置画笔颜色为黑色
		g.drawRect(0, 0, IMG_WIDTH - 1, IMG_HEIGHT - 1);
		
		// 绘制干扰线
		for (int i = 0; i < 100; i++)
		{
			g.setColor(getRandomColor(100)); // 设置画笔颜色
			int x1 = random.nextInt(IMG_WIDTH - 12) + 2;
			int y1 = random.nextInt(IMG_HEIGHT - 10) + 2;
			int x2 = x1 + random.nextInt(10); // 不能超过55 大于x1
			int y2 = y1 + random.nextInt(8); // 不能超过22 大于y1
			g.drawLine(x1, y1, x2, y2);
		}
		
		// 创建字体
		Font font = new Font("微软雅黑", Font.PLAIN, 19);
		// 设置字体
		g.setFont(font);
		String result = "";
		for (int i = 0; i < 4; i++)
		{
			String temp = getRandomStr();
			result += temp;
			g.setColor(new Color(10 + random.nextInt(80), 
						10 + random.nextInt(120),
						10 + random.nextInt(80)));
			g.drawString(temp, 13 * i + 2, 17);
		}
		
		/**
		 * 放进session
		 */
		ServletActionContext.getRequest().getSession().setAttribute(WebConstant.VERIFY_CODE, result);
		
		ImageIO.write(image, "JPEG", response.getOutputStream());
	}
	/**
	 * 生成一个(小写字母、大写字母、数字)
	 * @return
	 */
	private String getRandomStr()
	{
		// 随机生成0-2之间随机数
		int witch = (int)Math.round(Math.random() * 2);
		long temp = 0;
		switch (witch)
		{
			case 0: // 大写字母 65 + 25
				temp = Math.round(Math.random() * 9);
				 return String.valueOf(temp);
			case 1: // 小写字母 97 + 25
				temp = Math.round(Math.random() * 9);
				return String.valueOf(temp);
			default: // 生成数字 0-9
				temp = Math.round(Math.random() * 9);
				return String.valueOf(temp);
		}
	}
	/**
	 * 随机生成一种颜色
	 * @param base
	 * @return
	 */
	private Color getRandomColor(int base){
		int r = base + random.nextInt(255 - base); // 155
		int g = base + random.nextInt(255 - base);
		int b = base + random.nextInt(255 - base);
		return new Color(r, g, b);
	}
}