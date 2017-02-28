package org.tool.excel;

import java.lang.reflect.Field;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

/**
 * Excel资料导出工具类
 * @author: Nothing
 * @email: 761328790@qq.com
 * @company: Sichuan Agricultural University
 * @date 2015年5月24日
 */
public class ExcelDaoChu 
{
	/**
	 * 导出Excel方法
	 * @param sheetName 工作单名称
	 * @param fileName 生成Excel的文件名称
	 * @param titles 标题行(第一行)
	 * @param beans 导出数据
	 * @param response 响应
	 * @param request 请求
	 */
	public static void exportExcel(String sheetName, 
								   String fileName, 
								   String[] titles, List<?> beans,
								   HttpServletResponse response, 
								   HttpServletRequest request) throws Exception
    {
		// 创建工作簿
		HSSFWorkbook wb = new HSSFWorkbook();
		// 创建工作单
		HSSFSheet sheet = wb.createSheet(sheetName);
		// 创建第一行，把第一行当作标题行
		HSSFRow row = sheet.createRow(0);
		// 创建第一行中所有单元格
		for (int i = 0; i < titles.length; i++)
		{
			// 单元格
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(titles[i]);
		}
		// 下面所有的信息行
		for (int i = 0; i < beans.size(); i++)
		{
			 row = sheet.createRow(i + 1);
			 // 获取一个对象
			 Object obj = beans.get(i);
			 // 利用反映获取这个对象的所有属性
			 Field[] fields = obj.getClass().getDeclaredFields();
			 for (int j = 0; j < fields.length; j++)
			 {
				// 单元格
				 HSSFCell cell = row.createCell(j);
				 Field field =  fields[j];
				 String fieldName = field.getName(); // 获取Field的名字
				 // 获取属性get方法名
				 String getMethodName = "get" + StringUtils.capitalize(fieldName); // 这个方法可以让首字母大写
				 // 获取该方法名对应的方法
				 Object result =  obj.getClass().getDeclaredMethod(getMethodName).invoke(obj);
				 //格式化日期
				 if (result instanceof Date)
				 {
					 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					 cell.setCellValue(sdf.format((Date)result));
				 }
				 else
				 {
					 cell.setCellValue(result == null ? "" : result.toString());
				 }
			 }
		}
		// 设置输出的文件名
		// 判断浏览器的类型
		String agent = request.getHeader("user-agent");
		if (agent.toLowerCase().indexOf("firefox") != -1)
		{
			fileName = new String(fileName.getBytes("utf-8"), "iso8859-1");
		}
		else
		{
			fileName = URLEncoder.encode(fileName, "utf-8");
		}
		
		response.setHeader("content-disposition", "attachment;filename=" + fileName + ".xls");
		wb.write(response.getOutputStream());
	}
}
