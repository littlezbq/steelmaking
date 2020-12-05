import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

import Mappers.ProductParameterMapper;
import controller.dateToTime;
import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;
public class TestProductParameter {
	ProductParameterMapper mapper = new ProductParameterMapperImpl(); 
	
	public void testInsertProduct() {
		int result = -1;
		ProductParameter product = new ProductParameter();
		
		product.setFurnaceNo("2");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setClassNo("��");
		product.setFurnaceNum("02613579");
		product.setFurnaceAge("11074");
		product.setSteelName("Q235B-Z");
		product.setOxygun1(116);
		product.setOxygun2(121);
		product.setOxymode(20);
		
		BigDecimal iron_c = new BigDecimal(4.93);
		BigDecimal iron_si = new BigDecimal(0.47);
		BigDecimal iron_mn = new BigDecimal(0.33);
		BigDecimal iron_p = new BigDecimal(0.136);
		BigDecimal iron_s = new BigDecimal(0.026);
		product.setIronC(iron_c);
		product.setIronSi(iron_si);
		product.setIronMn(iron_mn);
		product.setIronP(iron_p);
		product.setIronS(iron_s);
		
		product.setIronTemperature("1330");
		product.setOutletAge(251);
		
		BigDecimal iron_weight = new BigDecimal(110.05);
		product.setIronWeight(iron_weight);
		BigDecimal resteel_weight1 = new BigDecimal(19.95);
		product.setResteelWeight1(resteel_weight1);
		BigDecimal resteel_weight2 = new BigDecimal(20.02);
		product.setResteelWeight2(resteel_weight2);
		BigDecimal steel_weight = new BigDecimal(127.56);
		product.setSteelWeight(steel_weight);
		BigDecimal pro_oxytime1 = new BigDecimal(0.5403);
		product.setProOxytime1(pro_oxytime1);
		
		product.setProOxyval(5663);
		product.setTurnNum(1);
		product.setTurnTemperature1(1672);
		
		BigDecimal pro_oxytime2 = new BigDecimal(0.15);
		product.setProOxytime2(pro_oxytime2);
		
		product.setTurnTemperature1(1672);
		product.setProNval(1591);
		
		BigDecimal slag_time = new BigDecimal(0.153);
		product.setSlagTime(slag_time);
		
		product.setSlagWeight(20);
		
		BigDecimal turn_c = new BigDecimal(0.09);
		product.setTurnC(turn_c);
		BigDecimal turn_s = new BigDecimal(0.09);
		product.setTurnS(turn_s);
		BigDecimal turn_p = new BigDecimal(0.09);
		product.setTurnP(turn_p);
		BigDecimal turn_mn = new BigDecimal(0.09);
		product.setTurnMn(turn_mn);
		
		product.setSteelDir(1);
		
		product.setSteelFe(5);
		product.setSteelRemark("good");
		
		result = mapper.insert(product);
		
		//����sql���ִ��
		if (result == 1) {
			System.out.println("��Ӽ�¼�ɹ���");
		}
		else {
			System.out.println("��Ӽ�¼ʧ�ܣ�");
		}
	}
	
	public ProductParameter testQueryProduct() {		
		String NAME = "produceDate";
//		String VALUE = stampToTime.stampToTime(producedate);
		String VALUE = "2020-11-06";
		ProductParameter product = mapper.selectByPrimaryKey(NAME,VALUE);
		
		//����sql���ִ��
		if(product != null) {
			System.out.println("��ѯ�ɹ�����ѯ������£�");
		}
		else {
			System.out.println("��ѯʧ�ܣ��ü�¼�����ڣ�");
		}
		return product;
	}
	
	public List<ProductParameter> testQueryAll(){
		List<ProductParameter> product_list = mapper.selectAll();
		
		//���sqlִ��
		if (product_list != null) {
			System.out.println("��ѯ�ɹ������м�¼���£�");
		}
		else {
			System.out.println("��ѯʧ�ܣ��ñ�Ϊ�գ�");
		}
		
		return product_list;
	}
	
	public void testDeleteProduct() {
		int result = -1;
		String fornaceNum = "02613579";
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		result = mapper.deleteByPrimaryKey(fornaceNum,produceDate);
		
		//ɾ���sqlִ��
		if (result == 1 ) {
			System.out.println("ɾ���ɹ���");
		}
		else {
			System.out.println("ɾ��ʧ��,�ü�¼�����ڣ�");
		}
	}
	
	public void testUpdateProduct() {
		int result = -1;
		
		ProductParameter product = new ProductParameter();
		product.setFurnaceNo("2");
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setClassNo("��");
		product.setFurnaceNum("02613579");
		product.setFurnaceAge("11073");
		product.setSteelName("Q235B-Z");
		product.setOxygun1(116);
		product.setOxygun2(121);
		product.setOxymode(20);
		
		BigDecimal iron_c = new BigDecimal(4.93);
		BigDecimal iron_si = new BigDecimal(0.47);
		BigDecimal iron_mn = new BigDecimal(0.33);
		BigDecimal iron_p = new BigDecimal(0.136);
		BigDecimal iron_s = new BigDecimal(0.026);
		product.setIronC(iron_c);
		product.setIronSi(iron_si);
		product.setIronMn(iron_mn);
		product.setIronP(iron_p);
		product.setIronS(iron_s);
		
		product.setIronTemperature("1330");
		product.setOutletAge(251);
		
		BigDecimal iron_weight = new BigDecimal(110.05);
		product.setIronWeight(iron_weight);
		BigDecimal resteel_weight1 = new BigDecimal(19.95);
		product.setResteelWeight1(resteel_weight1);
		BigDecimal resteel_weight2 = new BigDecimal(20.02);
		product.setResteelWeight2(resteel_weight2);
		BigDecimal steel_weight = new BigDecimal(127.56);
		product.setSteelWeight(steel_weight);
		BigDecimal pro_oxytime1 = new BigDecimal(0.5403);
		product.setProOxytime1(pro_oxytime1);
		
		product.setProOxyval(5663);
		product.setTurnNum(1);
		product.setTurnTemperature1(1672);
		
		BigDecimal pro_oxytime2 = new BigDecimal(0.15);
		product.setProOxytime2(pro_oxytime2);
		
		product.setTurnTemperature1(1672);
		product.setProNval(1591);
		
		BigDecimal slag_time = new BigDecimal(0.153);
		product.setSlagTime(slag_time);
		
		product.setSlagWeight(20);
		
		BigDecimal turn_c = new BigDecimal(0.09);
		product.setTurnC(turn_c);
		BigDecimal turn_s = new BigDecimal(0.09);
		product.setTurnS(turn_s);
		BigDecimal turn_p = new BigDecimal(0.09);
		product.setTurnP(turn_p);
		BigDecimal turn_mn = new BigDecimal(0.09);
		product.setTurnMn(turn_mn);
		
		product.setSteelDir(1);
		
		product.setSteelFe(5);
		product.setSteelRemark("good");
		
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
		
		ProductParameter product = new ProductParameter();
		
		String producedate = "2020-03-05";
		Timestamp produceDate = dateToTime.stampToTime(producedate);
		product.setProduceDate(produceDate);
		
		product.setFurnaceNum("02613579");
		
		
		product.setIronTemperature("3000");//�޸���
		product.setOutletAge(251);
		
		
		product.setSteelFe(5);
		product.setSteelRemark("bad");
		
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
