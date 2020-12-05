package daoMappersImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductSlagMapper;
import model.ProductSlag;

public class ProductSlagMapperImpl implements ProductSlagMapper {
//	��ָ���ֶβ�ѯ
	@Override
	public List<ProductSlag> selectByOneCharacter(String NAME, String VALUE) {
		
		List<ProductSlag> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
		
		//�ر�sql�Ự	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

	
	public int updateSingleRecord(ProductSlag product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.updateSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public List<ProductSlag> selectAll() {
		List<ProductSlag> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
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
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.deleteByOneCharacter(NAME,VALUE);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insertSingleRecord(ProductSlag product) {
		int result = -1;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//ִ��sql���
		result = product_mapper.insertSingleRecord(product);
		
		//�ر�sql�Ự
		sqlsession.commit();
		sqlsession.close();
		return result;
	}
}
