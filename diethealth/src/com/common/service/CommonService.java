package com.common.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public interface CommonService {
	/**
	 * <p>Discription:[文件上传]</p>
	 * Created on 2013-9-9
	 * @author: [齐星] - [qi_x@neusoft.com]
	 * @throws IOException 
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String upload(String uploadurl, MultipartFile file1) throws IOException;
	

	/**
	 * <p>Discription:[文件删除]</p>
	 * Created on 2013-9-23
	 * @author: [齐星] - [qi_x@neusoft.com]
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public boolean deleteFile(String filename) throws Exception;
	
	/**
	 * <p>Discription:[生成zip文件]</p>
	 * Created on 2013-9-23
	 * @author: [齐星] - [qi_x@neusoft.com]
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getZip(String[] files,String path) throws Exception;
	
}
