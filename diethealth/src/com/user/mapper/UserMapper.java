package com.user.mapper;


import java.util.List;
import java.util.Map;


public interface UserMapper {
    
    /**
     *   <p>【登录检查】</p>
     *
     * @author 林军雄  2014年11月15日 
     *
     * @param map
     * @return
     */
    int loginCheck(Map<String, Object> map);
    
    /**
     *   <p>【校验用户是否存在】</p>
     *
     * @author 林军雄  2014年12月2日 
     *
     * @param param
     * @return
     */
    List<Map<String, Object>> checkUser(Map<String, Object> param);
    
    /**
     *   <p>【添加用户】</p>
     *
     * @author 林军雄  2014年12月2日 
     *
     * @param param
     */
    void saveUser(Map<String, Object> param);
    
    /**
     *   <p>【显示用户详细信息】</p>
     *
     * @author 林军雄  2015年1月21日 
     *
     * @param param
     * @return
     */
    List<Map<String, Object>> showUserInfo(Map<String, Object> param);
    
    /**
     *   <p>【更新用户信息】</p>
     *
     * @author 林军雄  2015年1月21日 
     *
     * @param param
     */
    void updateUser(Map<String, Object> param);
    
    List<Map<String, Object>> getPHList1();
    List<Map<String, Object>> getPHList2();
    List<Map<String, Object>> getPHList3();
    List<Map<String, Object>> getPHList4();
    List<Map<String, Object>> getPHList5();
    
    List<Map<String, Object>> getPHlist(List<String> param);
    
}