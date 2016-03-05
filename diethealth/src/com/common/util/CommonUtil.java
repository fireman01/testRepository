package com.common.util;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.ResourceBundle;
import java.util.Set;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.jxls.exception.ParsePropertyException;
import net.sf.jxls.transformer.XLSTransformer;

import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;

import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateException;

/**
 * @author 林军雄    2014-11-13 
 * @version 1.0
 */
public class CommonUtil {

	private static CommonUtil instance;

	private HashMap map;

	private Configuration configuration = null;

	public CommonUtil() {
		configuration = new Configuration();
		configuration.setDefaultEncoding("utf-8");
	}

	public static CommonUtil getInstance() {
		if (instance == null) {
			instance = new CommonUtil();
		}
		return instance;
	}
	

	/**
	 * <p>Discription:[转化map中需要转码的字段]</p>
	 * Created on 2014-11-13
	 * @author: 林军雄   2014-11-13
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public List<Map<String, Object>> transcodeListMap(HttpServletRequest request, List<Map<String, Object>> listmap) {
		ServletContext context = request.getSession().getServletContext();
		HashMap<String, Map<String, Object>> transcodeMap = (HashMap) context.getAttribute("transcodeMap");
		List<Map<String, Object>> newlistMap = new ArrayList<Map<String, Object>>();
		for (int i = 0; i < listmap.size(); i++) {
			Map<String, Object> map = listmap.get(i);
			Map<String, Object> newmap = new HashMap<String, Object>(map);
			Set keys = map.keySet();
			if (keys != null) {
				Iterator iterator = keys.iterator();
				while (iterator.hasNext()) {
					String key = (String) iterator.next();
					if (key.length() > 10) {
						if ("CODELIST_".equals(key.substring(0, 9))) {
							String value = (String) map.get(key);
							newmap.put(key.substring(9) + "_NAME", transcodeMap.get(value).get(
									map.get(key.substring(9))));
						}
					}
				}
			}
			newlistMap.add(newmap);
		}
		return newlistMap;
	}

	/**
	 * <p>Discription:[通过codekind取得代码表]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public List<Map<String, Object>> getCodelistByCodekind(HttpServletRequest request, String codekind) {
		ServletContext context = request.getSession().getServletContext();
		HashMap<String, Map<String, Object>> codelistMap = (HashMap) context.getAttribute("codelistMap");
		return (List<Map<String, Object>>) codelistMap.get(codekind);
	}
	
	/**
	 * <p>Discription:[根据用户id和菜单id，取得用户在改菜单的权限]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄    2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getPermByUserIdAndMenuId(HttpServletRequest request, String menu_id) {
		String rtu = "";
		ServletContext context = request.getSession().getServletContext();
		String user_id = request.getSession().getAttribute("user_id").toString();
		HashMap<String, Map<String, Object>> permMap = (HashMap) context.getAttribute("permMap");
		if(permMap.get(user_id)!=null&&!"".equals(permMap.get(user_id))){
			if(permMap.get(user_id).get(menu_id)!=null&&!"".equals(permMap.get(user_id).get(menu_id))){
				rtu = (String) permMap.get(user_id).get(menu_id);
			}
		}
		return rtu;
	}

	/**
	* <p>Discription:[字符串转换成utf-8编码]</p>
	* Created on 2014-11-14
	* @author: 林军雄  2014-11-14
	* @update: [日期YYYY-MM-DD] [更改人姓名]
	*/
	public static String toUtf8String(String s) {
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < s.length(); i++) {
			char c = s.charAt(i);
			if (c >= 0 && c <= 255) {
				sb.append(c);
			} else {
				byte[] b;
				try {
					b = Character.toString(c).getBytes("utf-8");
				} catch (Exception ex) {
					System.out.println(ex);
					b = new byte[0];
				}
				for (int j = 0; j < b.length; j++) {
					int k = b[j];
					if (k < 0)
						k += 256;
					sb.append("%" + Integer.toHexString(k).toUpperCase());
				}
			}
		}
		return sb.toString();
	}

	/**
	 * <p>Discription:[导出word]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @throws IOException 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public void ExportWord(String exportFileName, String templateName, Map<String, Object> dataMap,
			HttpServletResponse response, HttpServletRequest request) {
		// 设置模本装置方法和路径,FreeMarker支持多种模板装载方法。可以重servlet，classpath，数据库装载，
		// 这里我们的模板是放在com.havenliu.document.template包下面
		configuration.setClassForTemplateLoading(this.getClass(), "/template");
		Template t = null;
		try {
			// test.ftl为要装载的模板
			t = configuration.getTemplate(templateName);
			t.setEncoding("utf-8");
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 输出文档路径及名称
		String path = this.getWebPath();
		String generatorFileName = path + "file/export/word/" + this.getUUID() + ".doc";
		File outFile = new File(generatorFileName);
		Writer out = null;
		try {
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "utf-8"));
			t.process(dataMap, out);
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			BufferedInputStream bis = null;
			BufferedOutputStream bos = null;
			response.setContentType("application/octet-stream");
			response.addHeader("Content-Disposition", "attachment; filename=" + CommonUtil.toUtf8String(exportFileName));
			bis = new BufferedInputStream(new FileInputStream(generatorFileName));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[2048];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			out.close();
			bis.close();
			bos.close();
			deleteFile(generatorFileName);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (TemplateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * <p>Discription:[导出Excel]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public void ExportExcel(String exportFileName, String templateName, Map<String, Object> dataMap,
			HttpServletResponse response, HttpServletRequest request) {
		// 输出文档路径及名称
		XLSTransformer transformer = new XLSTransformer();
		String path = this.getWebPath();
		String tempUrl = this.getResourceProperty("exportExcelUrl");
		String templateFileName = tempUrl + templateName;
		String generatorFileName = path + "file/export/excel/" + this.getUUID() + ".xls";
		BufferedInputStream bis;
		BufferedOutputStream bos;
		bis = null;
		bos = null;
		try {
			transformer.registerCellProcessor(new MultPropertyCellProcessor(new String[] { "l.CODEKIND","l.KINDNAME" }));
			transformer.transformXLS(templateFileName, dataMap, generatorFileName);
			response.setContentType("text/html;charset=UTF-8");
			request.setCharacterEncoding("UTF-8");
			response.setContentType("application/msexcel");
			response.addHeader("Content-Disposition", "attachment; filename="+new String(exportFileName.getBytes("gbk"),"iso-8859-1"));
			bis = new BufferedInputStream(new FileInputStream(generatorFileName));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[20480];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			bos.flush();
			bis.close();
			bos.close();
//			InputStream in = new FileInputStream(generatorFileName);
//			OutputStream out = response.getOutputStream();
//			int val = in.read();
//			while(val!=-1) {
//				out.write(val);
//				in.read();
//			}
//			out.close();
//			in.close();
			deleteFile(generatorFileName);
		} catch (ParsePropertyException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * <p>Discription:[导出Excel包含图片]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public void ExportExcelPic(String exportFileName, String templateName, Map<String, Object> dataMap,
			String[] picColumn, HttpServletResponse response, HttpServletRequest request) throws IOException {
		// 输出文档路径及名称
		XLSTransformer transformer = new XLSTransformer();
		String path = this.getWebPath();
		String templateFileName = path.substring(0, path.length() - 8) + "src/template/" + templateName;
		String generatorFileName = path + "file/export/excel/" + this.getUUID() + ".xls";
		InputStream is = new FileInputStream(templateFileName);// 模板文件流
		try {
			HSSFWorkbook workBook = (HSSFWorkbook) transformer.transformXLS(is, dataMap);
			HSSFSheet sheet = workBook.getSheetAt(0);
			HSSFPatriarch patriarch = sheet.createDrawingPatriarch();// 创建绘图工具对象放循环外可正确显示
			List<Map<String, Object>> list = (List<Map<String, Object>>) dataMap.get("dataMap");
			for(int j=0;j<picColumn.length;j++){
				for (int i = 0; i < list.size(); i++) {
					// 将图片以字节流的方式输入输出
					String picture = path + list.get(i).get(picColumn[j]);
					ByteArrayOutputStream bos = new ByteArrayOutputStream();
					BufferedImage BufferImg = ImageIO.read(new File(picture));
					ImageIO.write(BufferImg, "JPEG", bos);
					/**
					 * dx1 第1个单元格中x轴的偏移量
					 * dy1 第1个单元格中y轴的偏移量
					 * dx2 第2个单元格中x轴的偏移量
					 * dy2 第2个单元格中y轴的偏移量 
					 * col1 第1个单元格的列号
					 * row1 第1个单元格的行号
					 * col2 第2个单元格的列号
					 * row2 第2个单元格的行号
					 */
					HSSFClientAnchor anchor = new HSSFClientAnchor(5, 0, 0, 0, (short) 6, i * 7, (short) 7, i * 7 + 1);
					patriarch.createPicture(anchor, workBook.addPicture(bos.toByteArray(), workBook.PICTURE_TYPE_JPEG));
					OutputStream os = new FileOutputStream(generatorFileName); // 导出文件流
					workBook.write(os); // 写导出文件
				}
			}
			OutputStream os = new FileOutputStream(generatorFileName);
			workBook.write(os);
			is.close();
			os.flush();
			os.close();
		} catch (ParsePropertyException e) {
			e.printStackTrace();
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		BufferedInputStream bis = null;
		BufferedOutputStream bos = null;
		response.setContentType("application/msexcel");
		response.addHeader("Content-Disposition", "attachment; filename=" + CommonUtil.toUtf8String(exportFileName));
		bis = new BufferedInputStream(new FileInputStream(generatorFileName));
		bos = new BufferedOutputStream(response.getOutputStream());
		byte[] buff = new byte[2048];
		int bytesRead;
		while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
			bos.write(buff, 0, bytesRead);
		}
		bis.close();
		bos.close();
		deleteFile(generatorFileName);
	}

	/**
	 * <p>Discription:[取得uuid]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄    2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public static String getUUID() {
		String s = UUID.randomUUID().toString();
		// 去掉"-"符号
		return s.substring(0, 8) + s.substring(9, 13) + s.substring(14, 18) + s.substring(19, 23) + s.substring(24);
	}


	/**
	 * <p>Discription:[获取项目路径]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄  2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getWebPath() {
		String path = this.getClass().getClassLoader().getResource("").toString();
		return path = path.substring(6, path.length() - 16);
	}
	
	
	/**
	 * <p>Discription:[删除单个文件]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public void deleteFile(String sPath) {  
	    File file = new File(sPath);  
	    // 路径为文件且不为空则进行删除  
	    if (file.isFile() && file.exists()) {  
	        file.delete();  
	    }  
	} 
	
	 
	/**
	 * <p>Discription:[删除文件夹]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public void deleteDirectory(String sPath) {  
	    //如果sPath不以文件分隔符结尾，自动添加文件分隔符  
	    if (!sPath.endsWith(File.separator)) {  
	        sPath = sPath + File.separator;  
	    }  
	    File dirFile = new File(sPath);  
	    //如果dir对应的文件不存在，或者不是一个目录，则退出  
	    if (!dirFile.exists() || !dirFile.isDirectory()) {  
	        return;  
	    }  
	    //删除文件夹下的所有文件(包括子目录)  
	    File[] files = dirFile.listFiles();  
	    for (int i = 0; i < files.length; i++) {  
	        //删除子文件  
	        if (files[i].isFile()) {  
	            deleteFile(files[i].getAbsolutePath());  
	        } //删除子目录  
	        else {  
	            deleteDirectory(files[i].getAbsolutePath());  
	        }  
	    }  
	    //删除当前目录  
	    dirFile.delete();
	}
	
	/**
	 * <p>Discription:[根据名次获取属性值]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getResourceProperty(String name){
		ResourceBundle bundle = ResourceBundle.getBundle("jdbc");
		return bundle.getString(name);
	}
	
	/**
	 * <p>Discription:[将]</p>
	 * Created on 2014-11-14
	 * @author: 林军雄   2014-11-14
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String codelistToJson(List<Map<String, Object>> list){
		String json = "";
		if(null!= list && list.size()>0){
			json = "[";
			for(int i=0;i<list.size();i++){
				json += "[\""+list.get(i).get("CODEVALUE")+"\",\""+list.get(i).get("CODENAME")+"\"],";
			}
			json = json.substring(0, json.length()-1);
			json += "]";
		}
		return json;
	}
	public void download(String exportFileName,String url,HttpServletResponse response,String flag){
		BufferedInputStream bis;
		BufferedOutputStream bos;
		bis = null;
		bos = null;
		try {
			String filePath = CommonUtil.getInstance().getResourceProperty("filePath");
			response.setContentType("text/html;charset=UTF-8");
			response.addHeader("Content-Disposition", "attachment; filename="+new String(exportFileName.getBytes("gbk"),"iso-8859-1"));
			bis = new BufferedInputStream(new FileInputStream(filePath+url));
			bos = new BufferedOutputStream(response.getOutputStream());
			byte[] buff = new byte[20480];
			int bytesRead;
			while (-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
				bos.write(buff, 0, bytesRead);
			}
			bos.flush();
			bis.close();
			bos.close();
			if("1".equals(flag)){
				deleteFile(filePath+url);
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 *   <p>【获取随机字符串】</p>
	 *
	 * @author 林军雄  2014年11月30日 
	 *
	 * @param s
	 * @return
	 */
	public static String getSequence(String s) {

		return java.util.UUID.randomUUID().toString().replaceAll("-", "");
	}
}
