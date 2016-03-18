package com.dictionary.service.impl;

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
    public List<Map<String, Object>> getFoods() {
    	return dictionaryMapper.getFoods();
    }




}
