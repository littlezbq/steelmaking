package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductAlloyMapper;
import model.ProductAlloy;

public class ProductAlloyMapperImpl implements ProductAlloyMapper{
	
	@Override
	public int deleteByPrimaryKey(String furnaceNum,Timestamp produceDate,String accessoryName,int addTime) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		result = product_mapper.deleteByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insert(ProductAlloy product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int insertSelective(ProductAlloy product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public ProductAlloy selectByPrimaryKey(String furnaceNum,Timestamp produceDate,String accessoryName,int addTime) {
		ProductAlloy product = null;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		product = product_mapper.selectByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public List<ProductAlloy> selectAll() {
		List<ProductAlloy> product_list = null;
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectAll();
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int updateByPrimaryKeySelective(ProductAlloy product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		//ִ��sql���
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductAlloy product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
				
		//���ýӿ��еķ�����λsql���
		ProductAlloyMapper product_mapper = sqlsession.getMapper(ProductAlloyMapper.class);
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKey(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	
}
