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
		
		product.setClassNo("��");
		product.setFurnaceNum("02613579");
		product.setAccessoryName("��������");
		product.setAddweight(5000);
		product.setAddtime(5);
		
		
		result = mapper.insert(product);
		
		//����sql���ִ��
		if (result == 1) {
			System.out.println("��Ӽ�¼�ɹ���");
		}
		else {
			System.out.println("�ü�¼�Ѵ��ڣ�");
		}
	}
	
	public  ProductAccessory testQueryProduct() {
		String furnaceNum = "02600001";
		
		String producedate = "2020-01-01";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		
		String accessoryName = "������ʯ";
		int addTime = 0;
		ProductAccessory product = mapper.selectByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//����sql���ִ��
		if(product != null) {
			System.out.println("��ѯ�ɹ�����ѯ������£�");
		}
		else {
			System.out.println("��ѯʧ�ܣ��ü�¼�����ڣ�");
		}
		return product;
	}
	
	public  List<ProductAccessory> testQueryAll(){
		List<ProductAccessory> product_list = mapper.selectAll();
		
		//���sqlִ��
		if (product_list != null) {
			System.out.println("��ѯ�ɹ������м�¼���£�");
		}
		else {
			System.out.println("��ѯʧ�ܣ��ñ�Ϊ�գ�");
		}
		return product_list;
	}
	
	public  void testDeleteProduct() {
		int result = -1;
		String furnaceNum = "02613579";
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		
		String accessoryName = "��������";
		int addTime = 5;
		result = mapper.deleteByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//ɾ���sqlִ��
		if (result == 1 ) {
			System.out.println("ɾ���ɹ���");
		}
		else {
			System.out.println("ɾ��ʧ��,�ü�¼�����ڣ�");
		}
	}
	
	public  void testUpdateProduct() {
		int result = -1;
		
		ProductAccessory product = new ProductAccessory();
		
		product.setFurnaceNum("02613579");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setAccessoryName("��������");
		product.setAddtime(5);
		
		
		product.setClassNo("��");
		product.setAddweight(600);
		
		
		result = mapper.updateByPrimaryKey(product);
		
		//����sqlִ��
		if (result == 1) {
			System.out.println("���¼�¼�ɹ���");
		}
		else {
			System.out.println("���¼�¼ʧ�ܣ�");
		}
	}
	
	public void testUpdateProductSelective() {
		int result = -1;
		
		ProductAccessory product = new ProductAccessory();
		
		product.setFurnaceNum("02613579");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setAccessoryName("��������");
		product.setAddtime(5);
		
		
//		product.setClassNo("��");
		product.setAddweight(600);
		
		result = mapper.updateByPrimaryKeySelective(product);
		
		//����sqlִ��
		if (result == 1) {
			System.out.println("���¼�¼�ɹ���");
		}
		else {
			System.out.println("���¼�¼ʧ�ܣ�");
		}
	}
}
