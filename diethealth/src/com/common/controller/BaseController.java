package com.common.controller;


import javax.servlet.http.HttpServletRequest;

/**
 * @author 林军雄     2014-11-13 
 * @version 1.0
 */
public abstract class BaseController {
	/**
	 * 读取资源文件
	 */
//	@Autowired
//	protected ResourceBundleMessageSource _res;
	
	
	/**
	 * <p>Discription:[得到当前登录用户id]</p>
	 * Created on 2014-11-27
	 * @author: 林军雄   2014-11-27
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getCurrentUserId(HttpServletRequest request) {
		String user_id = "";
		if (request.getSession().getAttribute("user_id") != null) {
			user_id = request.getSession().getAttribute("user_id").toString();
		}
		return user_id;
	}

	
	/**
	 * <p>Discription:[得到当前登录用户账号]</p>
	 * Created on 2014-11-27
	 * @author: 林军雄  2014-11-27
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getCurrentUserAccount(HttpServletRequest request) {
		String account = "";
		if (request.getSession().getAttribute("account") != null) {
			account = request.getSession().getAttribute("account").toString();
		}
		return account;
	}
	
	/**
	 * <p>Discription:[取得当前登录人ip]</p>
	 * Created on 2014-11-27
	 * @author: 林军雄  2014-11-27
	 * @update: [日期YYYY-MM-DD] [更改人姓名]
	 */
	public String getCurrentUserIp(HttpServletRequest request) {
		String ip = "";
		if (request.getSession().getAttribute("ip") != null) {
			ip = request.getSession().getAttribute("ip").toString();
		}
		return ip;
	}
	
	
	
}
