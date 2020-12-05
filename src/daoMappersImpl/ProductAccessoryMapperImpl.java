package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductAccessoryMapper;
import model.ProductAccessory;



public class ProductAccessoryMapperImpl implements ProductAccessoryMapper{
	
	@Override
	public ProductAccessory selectByPrimaryKey(String furnaceNum,Timestamp produceDate,String accessoryName,int addTime) {
		ProductAccessory product = null;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		product = product_mapper.selectByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public int insert(ProductAccessory product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductAccessory product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKey(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}
	
	@Override
	public int updateByPrimaryKeySelective(ProductAccessory product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}	

	@Override
	public int deleteByPrimaryKey(String furnaceNum,Timestamp produceDate,String accessoryName,int addTime) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		result = product_mapper.deleteByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}
	
	public List<ProductAccessory> selectAll(){
		List<ProductAccessory> product_list = null;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		product_list = product_mapper.selectAll();
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int insertSelective(ProductAccessory product) {
		
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}


}
