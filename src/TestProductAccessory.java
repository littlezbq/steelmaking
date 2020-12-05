import java.sql.Timestamp;
import java.util.List;

import Mappers.ProductAccessoryMapper;
import controller.dateToTime;
import daoMappersImpl.ProductAccessoryMapperImpl;
import model.ProductAccessory;

public class TestProductAccessory {
	ProductAccessoryMapper mapper = new ProductAccessoryMapperImpl();
	
	public void testInsertProduct() {
		int result = -1;
		ProductAccessory product = new ProductAccessory();
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setClassNo("乙");
		product.setFurnaceNum("02613579");
		product.setAccessoryName("二氧化硫");
		product.setAddweight(5000);
		product.setAddtime(5);
		
		
		result = mapper.insert(product);
		
		//检验sql语句执行
		if (result == 1) {
			System.out.println("添加记录成功！");
		}
		else {
			System.out.println("该记录已存在！");
		}
	}
	
	public  ProductAccessory testQueryProduct() {
		String furnaceNum = "02600001";
		
		String producedate = "2020-01-01";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		
		String accessoryName = "生白云石";
		int addTime = 0;
		ProductAccessory product = mapper.selectByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//检验sql语句执行
		if(product != null) {
			System.out.println("查询成功！查询结果如下！");
		}
		else {
			System.out.println("查询失败！该记录不存在！");
		}
		return product;
	}
	
	public  List<ProductAccessory> testQueryAll(){
		List<ProductAccessory> product_list = mapper.selectAll();
		
		//检查sql执行
		if (product_list != null) {
			System.out.println("查询成功！所有记录如下：");
		}
		else {
			System.out.println("查询失败，该表为空！");
		}
		return product_list;
	}
	
	public  void testDeleteProduct() {
		int result = -1;
		String furnaceNum = "02613579";
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		
		String accessoryName = "二氧化硫";
		int addTime = 5;
		result = mapper.deleteByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//删检查sql执行
		if (result == 1 ) {
			System.out.println("删除成功！");
		}
		else {
			System.out.println("删除失败,该记录不存在！");
		}
	}
	
	public  void testUpdateProduct() {
		int result = -1;
		
		ProductAccessory product = new ProductAccessory();
		
		product.setFurnaceNum("02613579");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setAccessoryName("二氧化硫");
		product.setAddtime(5);
		
		
		product.setClassNo("甲");
		product.setAddweight(600);
		
		
		result = mapper.updateByPrimaryKey(product);
		
		//检验sql执行
		if (result == 1) {
			System.out.println("更新记录成功！");
		}
		else {
			System.out.println("更新纪录失败！");
		}
	}
	
	public void testUpdateProductSelective() {
		int result = -1;
		
		ProductAccessory product = new ProductAccessory();
		
		product.setFurnaceNum("02613579");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setAccessoryName("二氧化硫");
		product.setAddtime(5);
		
		
//		product.setClassNo("甲");
		product.setAddweight(600);
		
		result = mapper.updateByPrimaryKeySelective(product);
		
		//检验sql执行
		if (result == 1) {
			System.out.println("更新记录成功！");
		}
		else {
			System.out.println("更新纪录失败！");
		}
	}
}
