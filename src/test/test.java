package test;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.parser.ParseException;

import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;

public class test {
	public static void main(String[] args) {
//		test_selectBySteelName();
//		test_selectByTime();
		test_selectAllSteelName();
	}
	
	public static void test_selectByTime() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		String producedate1 = "2020-01-01";
		String producedate2 = "2020-03-05";
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
		
		
		List<ProductParameter> product_list = productImpl.selectByTime(produceDate1,produceDate2);
		ProductParameter product = null;
		for(int i = 0; i < product_list.size(); i ++) {
			product = product_list.get(i);
			System.out.println(product.toString());
		}
	}
	
	public static void test_selectBySteelName() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		String steelName = "Q195-Y";
		List<ProductParameter> product_list = productImpl.selectBySteelName(steelName);
		
		ProductParameter product = null;
		for(int i = 0; i < product_list.size(); i ++) {
			product = product_list.get(i);
			System.out.println(product.toString());
		}
	}
	
	public static void test_selectWithThreeRequirementsByTime() {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
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
