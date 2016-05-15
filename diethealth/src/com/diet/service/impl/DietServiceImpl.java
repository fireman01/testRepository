package com.diet.service.impl;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.common.util.CacheUtil;
import com.common.util.CommonUtil;
import com.common.util.SpringContextUtil;
import com.diet.mapper.DietMapper;
import com.diet.service.DietService;
import com.user.mapper.UserMapper;

@Service("DietService")
public class DietServiceImpl implements DietService {
	@Autowired(required=true)
	private DietMapper dietDao;
	

	/**
	 *   <p>【保存膳食信息】</p>
	 *
	 * @author 林军雄
	 *
	 * @param param
	 * @return
	 */
	@Override
	public String saveDiet(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		if(isUpdate(param)){
			dietDao.updateDiet(param);
		}else{
			dietDao.saveDiet(param);
		}
		return "1";
	}
	
	private boolean isUpdate(Map<String, Object> param){
		if(dietDao.countDietBypIdAndType(param)>0){
			return true;
		}
		return false;
	}
	
	@Override
	public List<Map<String, Object>> getFoodListWithPage(Map<String, Object> map) {
		return dietDao.getFoodListWithPage(map);
	}
	
	@Override
	public Map<String, Object> showFoodInfo(Map<String, Object> param) {
		return dietDao.getFoodInfo(param);
	}
	
	@Override
	public String saveFoodInfo(Map<String, Object> param) {
		if(param.get("id")==null){
			param.put("id", CommonUtil.getSequence(null));
			dietDao.saveFoodInfo(param);
			CacheUtil.getInstance().updateFoodList(param, false);
		}else{
			dietDao.updateFoodInfo(param);
			CacheUtil.getInstance().updateFoodList(param, true);
		}
		return "1";
	}
	
	@Override
	public String deleteFoodInfo(Map<String, Object> param) {
		dietDao.deleteFoodInfo(param);
		CacheUtil.getInstance().deleteFoodFromList(param);
		return "1";
	}
	
	@Override
	public int countFoodTotal() {
		return dietDao.countFoodTotal();
	}
	
	@Override
	public Map<String, Object> showBloodGlucoseInfo(Map<String, Object> param) {
		if(param.get("date")==null){
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(new Date());
			param.put("date", today);
		}
		return dietDao.showBloodGlucoseInfo(param);
	}

	@Override
	public String saveBloodGlucoseInfo(Map<String, Object> param) {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String today = sdf.format(new Date());
		param.put("date", today);
		if(dietDao.checkBloodGlucoseUpdate(param)>0){
			dietDao.updateBloodGlucoseInfo(setDefaultValue(param));
		}else{
			dietDao.saveBloodGlucoseInfo(setDefaultValue(param));
		}
		return "1";
	}
	private Map<String,Object> setDefaultValue(Map<String, Object> param){
		Set<Entry<String, Object>> sets = param.entrySet();
		Iterator<Entry<String, Object>> it = sets.iterator();
		while(it.hasNext()){
			Entry<String, Object> entry = it.next();
			if(null==entry.getValue()||"".equals(entry.getValue().toString())){
				param.put(entry.getKey(), "0");
			}else{
				continue;
			}
		}
		return param;
	}
	
	@Override
	public List<Map<String, Object>> getDietList(Map<String, Object> map) {
		return dietDao.getDietList(map);
	}
	
	
	@Override
	public int countDietTotal(Map<String, Object> map) {
		return dietDao.countDietTotal(map).size();
	}
	
	@Override
	public List<Map<String, Object>> showDietInfo(Map<String, Object> param) {
		List<Map<String, Object>> list = dietDao.showDietInfo(param);
		for(int i=0; i<list.size(); i++){
			String mainfood = (String)list.get(i).get("mainfood");
			String mainfoodNum = (String)list.get(i).get("mainfoodNum");
			String meat = (String)list.get(i).get("meat");
			String meatNum = (String)list.get(i).get("meatNum");
			String vegetables = (String)list.get(i).get("vegetables");
			String vegetablesNum = (String)list.get(i).get("vegetablesNum");
			String drink = (String)list.get(i).get("drink");
			String drinkNum = (String)list.get(i).get("drinkNum");
			String nut = (String)list.get(i).get("nut");
			String nutNum = (String)list.get(i).get("nutNum");
			String fruits = (String)list.get(i).get("fruits");
			String fruitsNum = (String)list.get(i).get("fruitsNum");
			if(!"".equals(mainfood)&&mainfood!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(mainfood,"1",mainfoodNum);
				list.get(i).put("mainfood", tmpList);
			}
			if(!"".equals(meat)&&meat!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(meat,"2",meatNum);
				list.get(i).put("meat", tmpList);
			}
			if(!"".equals(vegetables)&&vegetables!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(vegetables,"3",vegetablesNum);
				list.get(i).put("vegetables", tmpList);
			}
			if(!"".equals(drink)&&drink!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(drink,"4",drinkNum);
				list.get(i).put("drink", tmpList);
			}
			if(!"".equals(nut)&&nut!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(nut,"5",nutNum);
				list.get(i).put("nut", tmpList);
			}
			if(!"".equals(fruits)&&fruits!=null){
				List<Map<String, Object>> tmpList = getFoodListByIds(fruits,"6",fruitsNum);
				list.get(i).put("fruits", tmpList);
			}
			int type = (Integer)list.get(i).get("type");
			switch(type){
				case 1:{
					list.get(i).put("type","早餐");
					break;
				}
				case 2:{
					list.get(i).put("type","午餐");
					break;
				}
				case 3:{
					list.get(i).put("type","晚餐");
					break;
				}
				case 4:{
					list.get(i).put("type","上午加餐");
					break;
				}
				case 5:{
					list.get(i).put("type","下午加餐");
					break;
				}
				case 6:{
					list.get(i).put("type","晚上加餐");
					break;
				}
				default:{
					list.get(i).put("type","夜宵");
				}
			}
		}
		return list;
	}

	private List<Map<String, Object>> getFoodListByIds(String foodIds, String type, String nums) {
		String[] ids = foodIds.split(",");
		String[] numbers = nums.split(",");
		List<Map<String, Object>> tmpList = new LinkedList<Map<String,Object>>();
		for(int i=0; i<ids.length; i++){
			if("0".equals(ids[i])){
				continue;
			}
			Map<String, Object> tmp = new HashMap<String, Object>();
			tmp.put("id", ids[i]);
			tmp.put("type", type);
			Map<String, Object> map = dietDao.getFoodInfo(tmp);
			tmpList.add(getCalculateFoodInfo(map,Integer.valueOf(numbers[i])));
		}
		return tmpList;
	}
	
	private Map<String, Object> getCalculateFoodInfo(Map<String, Object> param, int num){
		if(param==null){
			return param;
		}
		NumberFormat nf = NumberFormat.getNumberInstance() ; 
		nf.setMaximumFractionDigits(2); 
		for(Entry<String, Object> entry : param.entrySet()){
				String key = entry.getKey();
				if(key!=null&&!"id".equals(key)&&!"type".equals(key)&&!"name".equals(key)&&!"ordername".equals(key)){
					param.put(key, nf.format(num*((Float)entry.getValue())));
				}
		}
		return param;
		
	}
	
	@Override
	public List<Map<String, Object>> getBloodGlucoseList(Map<String, Object> map) {
		return dietDao.getBloodGlucoseList(map);
	}
	
	@Override
	public int countBloodGlucoseTotal(Map<String, Object> map) {
		return dietDao.countBloodGlucoseTotal(map);
	}
	
	@Override
	public String saveAdvice(Map<String, Object> param) {
		if(dietDao.countAdvice(param)>0){
			dietDao.updateAdvice(param);
		}else{
			dietDao.saveAdvice(param);
		}
		return "1";
	}
	
	@Override
	public Map<String, Object> showAdviceInfo(Map<String, Object> param) {
		return dietDao.getAdviceInfo(param);
	}
	
	@Override
	public int getTargetEnergy(String snacks, String pId) {
		int energy = 0;
		UserMapper userMapper = (UserMapper)SpringContextUtil.getBeanById("userMapper");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("pId", pId);
		Map<String, Object> patient = userMapper.showUserInfo(param);
		int height = (Integer)patient.get("height");
		String strength = (String)patient.get("strength");
		if("0".equals(strength)){
			energy = (height-105)*30;
		}else if("1".equals(strength)){
			energy = (height-105)*34;
		}else if("2".equals(strength)){
			energy = (height-105)*38;
		}
		return energy;
	}
	
	@Override
	public List<Map<String, Object>> getTypeList(String snacks) {
		List<Map<String,Object>> list = new LinkedList<Map<String,Object>>();
		Map<String,Object> diettype1 = new HashMap<String, Object>();
		diettype1.put("value", "1");
		diettype1.put("name", "早餐");
		list.add(diettype1);
		Map<String,Object> diettype2 = new HashMap<String, Object>();
		diettype2.put("value", "2");
		diettype2.put("name", "午餐");
		list.add(diettype2);
		Map<String,Object> diettype3 = new HashMap<String, Object>();
		diettype3.put("value", "3");
		diettype3.put("name", "晚餐");
		list.add(diettype3);
		String[] types = snacks.split("|");
		for(int i=0; i<types.length; i++){
			Map<String, Object> type = new HashMap<String, Object>();
			if(!"|".equals(types[i])&&!"".equals(types[i])){
				type.put("value", types[i]);
				if("4".equals(types[i])){
					type.put("name", "上午加餐");
				}else if("5".equals(types[i])){
					type.put("name", "下午加餐");
				}else if("6".equals(types[i])){
					type.put("name", "晚上加餐");
				}
				list.add(type);
			}
		}
		return list;
	}
}
