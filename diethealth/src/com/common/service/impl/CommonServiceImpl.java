package com.common.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.annotation.Resource;
import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.ServletContextAware;
import org.springframework.web.multipart.MultipartFile;

import com.common.service.CommonService;
import com.common.util.CommonUtil;

@Service
public class CommonServiceImpl implements CommonService,ServletContextAware {

	@Autowired
	private ServletContext servletContext;

	public void setServletContext(ServletContext servletContext) { // 实现接口中的setServletContext方法
		this.servletContext = servletContext;
	}


	/**
	 * <p>Discription:[上传文件]</p>
	 * Created on 2013-9-9
	 * @author: [齐星] - [qi_x@neusoft.com]
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public synchronized String upload(String url, MultipartFile file) throws IOException {
		String rtuValue = "1";
		if (null != file && !file.isEmpty()) {
			// String path = this.servletContext.getRealPath(url); // 上传路径
			String filePath = CommonUtil.getInstance().getResourceProperty("filePath");
			String path = filePath + url;
			File file1 = new File(path);
			if (!file1.exists() && !file1.isDirectory()) {
				file1.mkdir();
			}
			byte[] bytes = file.getBytes();
			String ename = getExtensionName(file.getOriginalFilename());
			String filename = String.valueOf(System.currentTimeMillis()) + getRandomNum(5);
			filename = filename + "." + ename;
			// rtuValue = url + filename;
			rtuValue = filename;
			FileOutputStream fos = new FileOutputStream(path + "/" + filename); // 上传到web服务器
			fos.write(bytes); // 写入文件
		}
		return rtuValue;
	}

	/**
	 * <p>Discription:[对比两个list是否相等]</p>
	 * Created on 2012-10-31
	 * @author: [齐星] - [qi_x@neusoft.com] 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public boolean compareList(List<String> a, List<String> b) {

		if (a.size() != b.size())
			return false;
		if (a.size() == 0 && b.size() == 0)
			return true;
		Collections.sort(a);
		Collections.sort(b);
		for (int i = 0; i < a.size(); i++) {
			if (!a.get(i).equals(b.get(i)))
				return false;
		}
		return true;
	}

	/**
	 * <p>Discription:[数组去重]</p>
	 * Created on 2012-10-25
	 * @author: [齐星] - [qi_x@neusoft.com] 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String[] removeRepeatArray(String[] arr) {
		Set<String> set = new HashSet<String>();
		for (int i = 0; i < arr.length; i++) {
			set.add(arr[i]);
		}
		String[] newStr = set.toArray(new String[1]);
		return newStr;
	}

	/**
	 * <p>Discription:[list去重]</p>
	 * Created on Apr 12, 2012
	 * @author: [齐星] - [qi_x@neusoft.com] 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public List removeRepeatList(List list) {
		Set set = new HashSet();
		List newList = new ArrayList();
		for (Iterator iter = list.iterator(); iter.hasNext();) {
			Object element = iter.next();
			if (set.add(element))
				newList.add(element);
		}
		return newList;
	}

	/**
	 * <p>Discription:[取得n位数字或字母]</p>
	 * Created on Apr 24, 2012
	 * @author: [齐星] - [qi_x@neusoft.com] 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public static String getRandomNum(int num) {
		Random rd = new Random(); // 创建随机对象
		String n = "";
		int rdGet; // 取得随机数
		do {
			rdGet = Math.abs(rd.nextInt()) % 10 + 48; // 产生48到57的随机数(0-9的键位值)
			// rdGet=Math.abs(rd.nextInt())%26+97; //产生97到122的随机数(a-z的键位值)
			char num1 = (char) rdGet;
			String dd = Character.toString(num1);
			n += dd;

		} while (n.length() < 4);// 假如长度小于4

		return n; // 获取4位字母的序列
	}

	/**
	 * <p>Discription:[获取文件扩展名]</p>
	 * Created on Apr 17, 2012
	 * @author: [齐星] - [qi_x@neusoft.com] 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	/**
	 * <p>Discription:[删除文件]</p>
	 * Created on Apr 17, 2012
	 * @author:　[齐星] - [qi_x@neusoft.com]
	 * @update:[日期YYYY-MM-DD] [更改人姓名]
	 */
	public boolean deleteFile(String filename) throws Exception {
		String filePath = CommonUtil.getInstance().getResourceProperty("filePath");
		File file = new File(filePath + filename);
		if (file.exists()) {
			file.delete();
		}
		return true;
	}

	/**
	 * <p>Discription:[生成zip文件]</p>
	 * Created on 2013-9-23
	 * @author: [齐星] - [qi_x@neusoft.com]
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getZip(String[] files,String path) throws Exception {
		String filePath = CommonUtil.getInstance().getResourceProperty("filePath");
		byte[] buffer = new byte[1024];
		String fileName = String.valueOf(System.currentTimeMillis()) + getRandomNum(5);
		String strZipName = fileName + ".zip";
		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(filePath + path + strZipName));
		for (int j = 0; j < files.length; j++) {
			String name = files[j];
			FileInputStream fis = new FileInputStream(filePath + path + name);
			out.putNextEntry(new ZipEntry(name));
			int len;
			while ((len = fis.read(buffer)) > 0) {
				out.write(buffer, 0, len);
			}
			out.closeEntry();
			fis.close();
		}
		out.close();
		return strZipName;
	}

}
