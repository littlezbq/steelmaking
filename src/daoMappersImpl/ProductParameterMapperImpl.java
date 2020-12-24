package daoMappersImpl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductParameterMapper;
import model.ProductParameter;


public class ProductParameterMapperImpl implements ProductParameterMapper{
	
//	 ��ѯ���и�������
    public List<String> selectAllSteelName(){
    	List<String> steelName_list = null;
    	SqlSession sqlsession = null;
    	try {
//    		��ȡsql�Ự
    		sqlsession = MybatisUtil.openSqlSession();
    		
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			
			//ִ��sql���
			steelName_list = product_mapper.selectAllSteelName();
			
//			�ύ����	
			sqlsession.commit();
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
//			����ع�����
			sqlsession.rollback();
    	}
    	finally {
//			��֤��Դ˳���ر�
			if (sqlsession != null) {
				sqlsession.close();
			}
    	}
    	
    	return steelName_list;
    }
	
//  �����ѯ����ʱ��β�ѯ
	@Override
	public List<ProductParameter> selectByTime(Date produceDate1, Date produceDate2) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product_list = product_mapper.selectByTime(produceDate1,produceDate2);
			
//			�ύ����	
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
//			��֤��Դ˳���ر�
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

//  �����ѯ���ָ��ֲ�ѯ
	@Override
	public List<ProductParameter> selectBySteelName(String steelName) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product_list = product_mapper.selectBySteelName(steelName);
			
//			�ύ����	
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
//			��֤��Դ˳���ر�
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

//  Ƕ�ײ�ѯ����ĳ��ʱ������������ֶβ�ѯ��¼
	@Override
	public List<ProductParameter> selectWithThreeRequirementsByTime(String classNo, String furnaceNo, String steelName,
			Date produceDate1, Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		
		try {
			//��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
			//���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product_list = product_mapper.selectWithThreeRequirementsByTime(classNo,furnaceNo,steelName,
					produceDate1,produceDate2);
			
			//�ر�sql�Ự	
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
			
		}
		
		return product_list;
	}

//  Ƕ�ײ�ѯ����ĳ��ʱ��ε��������������ֶβ�ѯ��¼
	@Override
	public List<ProductParameter> selectWithAnyTwoRequirementsByTime(String NAME1, String VALUE1, String NAME2,
			String VALUE2, Date produceDate1, Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		
		//��ȡsql�Ự
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//���ýӿ��еķ�����λsql���
		ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
		//ִ��sql���
		product_list = product_mapper.selectWithAnyTwoRequirementsByTime(NAME1,VALUE1,NAME2,VALUE2,
				produceDate1,produceDate2);
		
		//�ر�sql�Ự	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

//  Ƕ�ײ�ѯ����ĳ��ʱ��ε�����һ�������ֶβ�ѯ��¼
	@Override
	public List<ProductParameter> selectWithAnyOneRequirementByTime(String NAME1, String VALUE1, Date produceDate1,
			Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
			//��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
			//���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product_list = product_mapper.selectWithAnyOneRequirementByTime(NAME1,VALUE1,
					produceDate1,produceDate2);
			
			//�ύ����	
			sqlsession.commit();
		}
		catch(Exception e) {
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
			
		return product_list;
	}
	
	
//	��ָ���ֶβ�ѯ
	@Override
	public List<ProductParameter> selectByOneCharacter(String NAME, String VALUE) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			��ȡsql�Ự
//			SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
//			sqlsession = sqlsessionFactory.openSession();
			
			sqlsession = MybatisUtil.openSqlSession();
			
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
			
//			�ύ����	
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
//			��֤��Դ˳���ر�
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

// ��������ѯ
	@Override
	public ProductParameter selectByPrimaryKey(Date produceDate,String furnaceNum) {
		
		ProductParameter product = null;
		SqlSession sqlsession = null;
		try {
//			��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			product = product_mapper.selectByPrimaryKey(produceDate,furnaceNum);
			
//			�ύ����	
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
//			��֤��Դ˳���ر�
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product;
	}

	
//	����һ����¼
	public int updateSingleRecord(ProductParameter product) {
		int result = -1;
		SqlSession sqlsession = null;
		try {
			//��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
			//���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			result = product_mapper.updateSingleRecord(product);
			
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				//�ر�sql�Ự
				sqlsession.close();
			}
			
		}
		
		return result;
	}

	
//	��ָ���ֶ�ɾ����¼
	@Override
	public int deleteByOneCharacter(String NAME,String VALUE) {
		int result = -1;
		SqlSession sqlsession = null;
		try {
//			��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
//			���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
//			ִ��sql���
			result = product_mapper.deleteByOneCharacter(NAME,VALUE);
			
			sqlsession.commit();
			
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		return result;
	}
	
//	�������ֶ�ɾ����¼
	@Override
	public int deleteByPrimaryKey(Date produceDate, String furnaceNum) {
		int result = -1;
		SqlSession sqlsession = null;
		
		try {
			//��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
			//���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			result = product_mapper.deleteByPrimaryKey(produceDate,furnaceNum);
			
			sqlsession.commit();
			
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		return result;
	}

//	���뵥����¼
	@Override
	public int insertSingleRecord(ProductParameter product) {
		int result = -1;
		SqlSession sqlsession = null;
		
		try{
			//��ȡsql�Ự
			sqlsession = MybatisUtil.openSqlSession();
			
			//���ýӿ��еķ�����λsql���
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//ִ��sql���
			result = product_mapper.insertSingleRecord(product);
			
			//�ر�sql�Ự
			sqlsession.commit();
		}
		catch (Exception e) {
//			����ع�����
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return result;
	}


}
