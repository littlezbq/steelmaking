package daoMappersImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductAccessoryMapper;
import model.ProductAccessory;



public class ProductAccessoryMapperImpl implements ProductAccessoryMapper{
	
//	��ָ���ֶβ�ѯ
	@Override
	public List<ProductAccessory> selectByOneCharacter(String NAME, String VALUE) {
		
		List<ProductAccessory> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
		
		//�ر�sql�Ự	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

	
	public int updateSingleRecord(ProductAccessory product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//ִ��sql���
		result = product_mapper.updateSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public List<ProductAccessory> selectAll() {
		List<ProductAccessory> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
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
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//ִ��sql���
		result = product_mapper.deleteByOneCharacter(NAME,VALUE);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insertSingleRecord(ProductAccessory product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//ִ��sql���
		result = product_mapper.insertSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

}
