
import java.io.IOException;
import java.io.Reader;
import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import model.ProductAccessory;
import model.ProductParameter;
public class test {
	
	public static void main(String[] args) throws IOException {
		
		//�������ϺϽ��
		TestProductAccessory testProductAccessory = new TestProductAccessory();
		
		//���Ե������ݲ���
//		testProductAccessory.testInsertProduct();
		
		//���Ե�������ɾ��
//		testProductAccessory.testDeleteProduct();
		
		//���Ե������ݸ���
//		testProductAccessory.testUpdateProduct();
		
		//���Ե������ݲ�ѯ
//		ProductAccessory product_accessory = testProductAccessory.testQueryProduct();
//		System.out.println(product_accessory.toString());
		
//		//����ȫ�����ݲ�ѯ
//		List<ProductAccessory> product_alloyList = testProductAccessory.testQueryAll();
//		for (int i = 0; i < product_alloyList.size(); i++) {
//			ProductAccessory product = product_alloyList.get(i);
//			System.out.println(product.toString());
//		}
		
		//����ѡ���Ը�������
//		testProductAccessory.testUpdateProductSelective();
		
		
		
		
		
		
		//�����������ݱ�
		TestProductParameter testProduct = new TestProductParameter();
		
		//���Ե������ݲ���
//		testProduct.testInsertProduct();
		
		//���Ե�������ɾ��
//		testProduct.testDeleteProduct();
		
		//���Ե������ݸ���
//		testProduct.testUpdateProduct();
		
//		//���Ե������ݲ�ѯ
		ProductParameter product = testProduct.testQueryProduct();
		System.out.println(product.toString());
		
		//����ȫ�����ݲ�ѯ
//		List<ProductParameter> product_list = testProduct.testQueryAll();
//		for (int i = 0; i < product_list.size(); i++) {
//			ProductParameter product = product_list.get(i);
//			System.out.println(product.toString());
//		}
		
		//����ѡ���Ը�������
//		testProduct.testUpdateProductSelective();
		
		
	}
}
