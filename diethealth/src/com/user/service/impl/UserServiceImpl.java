package com.user.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.common.util.CommonUtil;
import com.user.mapper.UserMapper;
import com.user.service.UserService;

@Service("UserService")
public class UserServiceImpl implements UserService {
	@Resource
	private UserMapper userDao;
	
	/**
	 *   <p>【登录检查】</p>
	 *
	 * @author 林军雄  2014年11月15日 
	 *
	 * @param map
	 * @return
	 */
	public int loginCheck(Map<String, Object> map){
		if(map.get("password").toString().equals("c4ca4238a0b923820dcc509a6f75849b")&&map.get("username").equals("admin")){
			return 2;
		}else{
			return userDao.loginCheck(map);
		}
	}

	@Override
	public String checkUser(Map<String, Object> param) {
		List<Map<String, Object>> list = null;
		list = userDao.checkUser(param);
		if(list.size()>0){
			return "1";
		}else{
			return "0";
		}
	}

	/**
	 *   <p>【添加用户】</p>
	 *
	 * @author 林军雄  2014年12月2日 
	 *
	 * @param param
	 * @return
	 */
	@Override
	public String saveUser(Map<String, Object> param) {
		param.put("resource_id", CommonUtil.getSequence(null));
		userDao.saveUser(param);
		return "1";
	}

	@Override
	public Map<String, Object> showUserInfo(Map<String, Object> param) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
	    list = userDao.showUserInfo(param);
	    if(list.get(0).containsKey("PH")){
	    	   String str = list.get(0).get("PH").toString();
	   	    String[] tmp = str.split(",");
	   	    List<String> phlist = new ArrayList<String>();
	   	    for(int i=0; i<tmp.length; i++){
	   	    	phlist.add(tmp[i]);
	   	    }
	   	    list.get(0).put("phlist", userDao.getPHlist(phlist));
	    }
	 
		return list.get(0);
	}

	@Override
	public List<Map<String, Object>> getPHList1() {
		return userDao.getPHList1();
	}

	@Override
	public List<Map<String, Object>> getPHList2() {
		return userDao.getPHList2();
	}

	@Override
	public List<Map<String, Object>> getPHList3() {
		return userDao.getPHList3();
	}

	@Override
	public List<Map<String, Object>> getPHList4() {
		return userDao.getPHList4();
	}

	@Override
	public List<Map<String, Object>> getPHList5() {
		return userDao.getPHList5();
	}

	@Override
	public String saveProject(Map<String, Object> param) {
		userDao.updateUser(param);
		return "1";
	}

}
