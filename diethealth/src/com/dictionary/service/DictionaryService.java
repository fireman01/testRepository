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
	public List<Map<String, Object>> getFoods();
	
}
