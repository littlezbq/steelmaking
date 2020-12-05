
import java.io.IOException;
import java.io.Reader;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import model.ProductAccessory;
import model.ProductParameter;
public class test {
	
	public static void main(String[] args) throws IOException {
		
		//测试渣料合金表
		TestProductAccessory testProductAccessory = new TestProductAccessory();
		
		//测试单条数据插入
//		testProductAccessory.testInsertProduct();
		
		//测试单条数据删除
//		testProductAccessory.testDeleteProduct();
		
		//测试单条数据更新
//		testProductAccessory.testUpdateProduct();
		
		//测试单条数据查询
//		ProductAccessory product_accessory = testProductAccessory.testQueryProduct();
//		System.out.println(product_accessory.toString());
		
//		//测试全部数据查询
//		List<ProductAccessory> product_alloyList = testProductAccessory.testQueryAll();
//		for (int i = 0; i < product_alloyList.size(); i++) {
//			ProductAccessory product = product_alloyList.get(i);
//			System.out.println(product.toString());
//		}
		
		//测试选择性更新数据
//		testProductAccessory.testUpdateProductSelective();
		
		
		
		
		
		
		//测试生产数据表
		TestProductParameter testProduct = new TestProductParameter();
		
		//测试单条数据插入
//		testProduct.testInsertProduct();
		
		//测试单条数据删除
//		testProduct.testDeleteProduct();
		
		//测试单条数据更新
//		testProduct.testUpdateProduct();
		
//		//测试单条数据查询
		ProductParameter product = testProduct.testQueryProduct();
		System.out.println(product.toString());
		
		//测试全部数据查询
//		List<ProductParameter> product_list = testProduct.testQueryAll();
//		for (int i = 0; i < product_list.size(); i++) {
//			ProductParameter product = product_list.get(i);
//			System.out.println(product.toString());
//		}
		
		//测试选择性更新数据
//		testProduct.testUpdateProductSelective();
		
		
	}
}
