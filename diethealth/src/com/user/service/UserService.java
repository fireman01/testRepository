package com.user.service;

import java.util.List;
import java.util.Map;

public interface  UserService {
	
	/**
	 *   <p>【登录检查】</p>
	 *
	 * @author 林军雄  2014年11月15日 
	 *
	 * @param map
	 * @return
	 */
	public int loginCheck(Map<String, Object> map);
	
	/**
	 *   <p>【校验用户是否存在】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	public String checkUser(Map<String, Object> param);
	
	/**
	 *   <p>【添加用户】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	public String saveUser(Map<String, Object> param);
	
	/**
	 *   <p>【显示用户详细信息】</p>
	 *
	 * @author 林军雄  2015年1月21日 
	 *
	 * @param param
	 * @return
	 */
	public Map<String, Object> showUserInfo(Map<String, Object> param);
	/**
	 *   <p>【获取偏好列表】</p>
	 *
	 * @author 林军雄  2015年5月5日 
	 *
	 * @return
	 */
	public List<Map<String, Object>> getPHList1();
	public List<Map<String, Object>> getPHList2();
	public List<Map<String, Object>> getPHList3();
	public List<Map<String, Object>> getPHList4();
	public List<Map<String, Object>> getPHList5();
    /**
     *   <p>【保存用户信息】</p>
     *
     * @author 林军雄  2015年5月5日 
     *
     * @param param
     * @return
     */
    public String saveProject(Map<String, Object> param);
}
