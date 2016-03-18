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
	public List<Map<String, Object>> getFoods();
}
