package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductSlagMapper;
import model.ProductSlag;

public class ProductSlagMapperImpl implements ProductSlagMapper {
	//��ȡsql�Ự
	SqlSession sqlsession = MybatisUtil.getSqlSession();
				
	//���ýӿ��еķ�����λsql���
	ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
	
	@Override
	public int deleteByPrimaryKey(String fornaceNum,Timestamp produceDate) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.deleteByPrimaryKey(fornaceNum,produceDate);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insert(ProductSlag product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int insertSelective(ProductSlag product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.insert(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public ProductSlag selectByPrimaryKey(String fornaceNum,Timestamp produceDate) {
		ProductSlag product = null;
		
		//��ȡsql�Ự
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		product = product_mapper.selectByPrimaryKey(fornaceNum,produceDate);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public List<ProductSlag> selectAll() {
		List<ProductSlag> product_list = null;
		//ִ��sql���
		product_list = product_mapper.selectAll();
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int updateByPrimaryKeySelective(ProductSlag product) {
		int result = -1;
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductSlag product) {
		int result = -1;
		
		//ִ��sql���
		result = product_mapper.updateByPrimaryKey(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

}
