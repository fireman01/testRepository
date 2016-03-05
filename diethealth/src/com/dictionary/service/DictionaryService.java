package com.dictionary.service;

import java.util.List;
import java.util.Map;

public interface DictionaryService {
	/**
	 *   <p>【根据类型取得字典表信息】</p>
	 *
	 * @author 林军雄  2015年1月26日 
	 *
	 * @param paramMap
	 * @return
	 */
	public List<Map<String, Object>> getDictionary(List<Map<String, Object>> paramMap);
	/**
	 *   <p>【获得所属分类列表】</p>
	 *
	 * @author 林军雄  2015年1月4日 
	 * @param 类型：“1”表示景点，“2”表示美食，“3”表示购物，“4”表示活动
	 * @return
	 */
	public List<Map<String, Object>> getSsflList(String type);
	
	/**
	 *   <p>【获得省份列表】</p>
	 *
	 * @author 林军雄  2015年1月6日 
	 *
	 * @return
	 */
	public List<Map<String, Object>> getSflist();
	
	/**
	 *   <p>【获得城市列表】</p>
	 *
	 * @author 林军雄  2015年1月7日 
	 *
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getCslist(Map<String, Object> param);
	/**
	 *   <p>【获得所在地列表】</p>
	 *
	 * @author 林军雄  2015年1月7日 
	 *
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getDdmlist();
}
