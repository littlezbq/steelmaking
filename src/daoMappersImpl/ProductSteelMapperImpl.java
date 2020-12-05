package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductSteelMapper;
import model.ProductSteel;

public class ProductSteelMapperImpl implements ProductSteelMapper {

	//��ȡsql�Ự
	SqlSession sqlsession = MybatisUtil.getSqlSession();
				
	//���ýӿ��еķ�����λsql���
	ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
	@Override
	public int deleteByPrimaryKey(String fornaceNum,String steelName,Timestamp produceDate) {
		int result = -1;
			
		//ִ��sql���
		result = product_mapper.deleteByPrimaryKey(fornaceNum,steelName,produceDate);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insert(ProductSteel product) {
		int result = -1;
		
		//ִ��sql���
		result = product_mapper.insert(product);
			
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int insertSelective(ProductSteel product) {
		int result = -1;
			
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
			
		return result;
	}

	@Override
	public ProductSteel selectByPrimaryKey(String fornaceNum,String steelName,Timestamp produceDate) {
		ProductSteel product = null;
		
		//ִ��sql���
		product = product_mapper.selectByPrimaryKey(fornaceNum,steelName,produceDate);
			
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public List<ProductSteel> selectAll() {
		List<ProductSteel> product_list = null;
		//ִ��sql���
		product_list = product_mapper.selectAll();
			
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int updateByPrimaryKeySelective(ProductSteel product) {
		int result = -1;
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductSteel product) {
		int result = -1;
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKey(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}


}
