package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductSteelMapper;
import model.ProductSteel;

public class ProductSteelMapperImpl implements ProductSteelMapper {

//	��ָ���ֶβ�ѯ
	@Override
	public List<ProductSteel> selectByOneCharacter(String NAME, String VALUE) {
		
		List<ProductSteel> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
		
		//�ر�sql�Ự	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

	
	public int updateSingleRecord(ProductSteel product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//ִ��sql���
		result = product_mapper.updateSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public List<ProductSteel> selectAll() {
		List<ProductSteel> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectAll();
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}
	
	//ɾ����¼
	@Override
	public int deleteByOneCharacter(String NAME,String VALUE) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//ִ��sql���
		result = product_mapper.deleteByOneCharacter(NAME,VALUE);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insertSingleRecord(ProductSteel product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//ִ��sql���
		result = product_mapper.insertSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

}
