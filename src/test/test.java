package test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;

public class test {
	public static void main(String[] args) {
//		test_selectBySteelName();
//		test_selectByTime();
//		test_selectAllSteelName();
		test_selectWithThreeRequirementsByTime();
	}
	
//	条件查询
	public static void test_selectWithThreeRequirementsByTime() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		ProductParameter product_result = null;
		Map<String,String> map = new HashMap<String,String>();
		
//		设置时间段为必选
		String producedate1 = "2020-01-01";
		String producedate2 = "2020-12-28";
		
		/*
		 * Date produceDate1 = null; Date produceDate2 = null; SimpleDateFormat sdf =
		 * new SimpleDateFormat("yyyy-MM-dd"); try { produceDate1 =
		 * sdf.parse(producedate1); produceDate2 = sdf.parse(producedate2); } catch
		 * (java.text.ParseException e) { // TODO Auto-generated catch block
		 * e.printStackTrace(); }
		 */
		
//		按照班次、炉号和钢种名随意组合查询
		map.put("steelName","HRB400E");
		map.put("classNo", "乙");
		map.put("furnaceNo", "1");
		
		map.put("produceDate1",producedate1);
		map.put("produceDate2",producedate2);
		List<ProductParameter> product_list1 = productImpl.selectWithThreeRequirementsByTime(map);
		for(int i = 0; i < product_list1.size(); i++) {
			product_result = product_list1.get(i);
			System.out.println(product_result);
		}
		
	}
	
	
	public static void test_selectByTime() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		String producedate1 = "2020-01-01";
		String producedate2 = "2020-12-28";
		Date produceDate1 = null;
		Date produceDate2 = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			produceDate1 = sdf.parse(producedate1);
			produceDate2 = sdf.parse(producedate2);
		} catch (java.text.ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		int begin = 0;
		int total = 50;
		List<ProductParameter> product_list = productImpl.selectByTime(produceDate1,produceDate2,begin,total);
		int sum = productImpl.getTotalRecord(produceDate1, produceDate2);
		ProductParameter product = null;
		for(int i = 0; i < product_list.size(); i ++) {
			product = product_list.get(i);
			System.out.println(product.toString());
		}
		System.out.println(sum);
	}
	
	public static void test_selectBySteelName() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		String steelName = "Q195-Y";
		int begin = 0;
		int total = 50;
		List<ProductParameter> product_list = productImpl.selectBySteelName(steelName,begin,total);
		
		
		ProductParameter product = null;
		for(int i = 0; i < product_list.size(); i ++) {
			product = product_list.get(i);
			System.out.println(product.toString());
		}
	}
	
	
	
	public static void test_selectAllSteelName() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		List<String> steelName_list = null;
		steelName_list = productImpl.selectAllSteelName();
		
		String steelname = null;
		for(int i = 0; i < steelName_list.size(); i++) {
			steelname = steelName_list.get(i);
			System.out.println(steelname);
		}
		
	}
	
	
	
}
