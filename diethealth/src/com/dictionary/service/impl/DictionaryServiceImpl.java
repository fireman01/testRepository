package com.dictionary.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dictionary.mapper.DictionaryMapper;
import com.dictionary.service.DictionaryService;

@Service("DictionaryService")
public class DictionaryServiceImpl implements DictionaryService {
	
	@Resource
	private DictionaryMapper dictionaryMapper;

    
    /**
     *   <p>【根据类型取得字典表信息】</p>
     *
     * @author 林军雄  2015年1月26日 
     *
     * @param paramMap
     * @return
     */
    public List<Map<String, Object>> getDictionary(List<Map<String, Object>> paramMap) {
    	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		for(Map<String, Object> pMap:paramMap) {
			Map<String,Object> map = new HashMap<String,Object>();
			map.put("tablename", pMap.get("table").toString());
			
			map.put("valuecol", pMap.containsKey("value")?pMap.get("value").toString():"resource_id");
			map.put("namecol", pMap.containsKey("name")?pMap.get("name").toString():"type_name");
			map.put("orderstr", pMap.containsKey("order")?pMap.get("order").toString():"ORDER_ID");
			map.put("wherestr", pMap.containsKey("where")?pMap.get("where").toString():"'1'='1'");
			
			
			List<Map<String, Object>> list1 =dictionaryMapper.getDictionary(map);
			list.addAll(list1);
		}
    	return list;
    }
	/**
	 *   <p>【获得所属分类列表】</p>
	 *
	 * @author 林军雄  2015年1月4日 
	 * @param 类型：“1”表示景点，“2”表示美食，“3”表示购物，“4”表示活动
	 * @return 分类列表
	 */
	@Override
	public List<Map<String, Object>> getSsflList(String type) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("type", type);
		return dictionaryMapper.getSsflList(param);
	}




	/**
	 *   <p>【获得省份列表】</p>
	 *
	 * @author 林军雄  2015年1月6日 
	 *
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getSflist() {
		
		return dictionaryMapper.getSflist();
	}


	/**
	 *   <p>【获得城市列表】</p>
	 *
	 * @author 林军雄  2015年1月7日 
	 *
	 * @param param
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getCslist(Map<String, Object> param) {
		return dictionaryMapper.getCslist(param);
	}


	/**
	 *   <p>【获得所在地列表】</p>
	 *
	 * @author 林军雄  2015年1月7日 
	 *
	 * @param param
	 * @return
	 */
	@Override
	public List<Map<String, Object>> getDdmlist() {
		return dictionaryMapper.getDdmlist();
	}
}
