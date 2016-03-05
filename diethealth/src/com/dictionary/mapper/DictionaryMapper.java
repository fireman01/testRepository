package com.dictionary.mapper;

import java.util.List;
import java.util.Map;

public interface DictionaryMapper {

	/**
	 *   <p>【获取字典表数据】</p>
	 *
	 * @author 林军雄  2015年1月26日 
	 *
	 * @param param
	 * @return
	 */
	public List<Map<String, Object>> getDictionary(Map<String, Object> param);
	/**
	 *   <p>【获得所属分类列表】</p>
	 *
	 * @author 林军雄  2015年1月6日 
	 *
	 * @return
	 */
	public List<Map<String, Object>> getSsflList(Map<String, Object> param);
	
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
	 * @author 林军雄  2015年1月6日 
	 *
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
