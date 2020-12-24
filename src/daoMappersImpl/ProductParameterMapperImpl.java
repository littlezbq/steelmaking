package daoMappersImpl;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductParameterMapper;
import model.ProductParameter;


public class ProductParameterMapperImpl implements ProductParameterMapper{
	
//	 查询所有钢种类型
    public List<String> selectAllSteelName(){
    	List<String> steelName_list = null;
    	SqlSession sqlsession = null;
    	try {
//    		获取sql会话
    		sqlsession = MybatisUtil.openSqlSession();
    		
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			
			//执行sql语句
			steelName_list = product_mapper.selectAllSteelName();
			
//			提交事务	
			sqlsession.commit();
    		
    	}
    	catch (Exception e) {
    		e.printStackTrace();
//			出错回滚事务
			sqlsession.rollback();
    	}
    	finally {
//			保证资源顺利关闭
			if (sqlsession != null) {
				sqlsession.close();
			}
    	}
    	
    	return steelName_list;
    }
	
//  分组查询：分时间段查询
	@Override
	public List<ProductParameter> selectByTime(Date produceDate1, Date produceDate2) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product_list = product_mapper.selectByTime(produceDate1,produceDate2);
			
//			提交事务	
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
//			保证资源顺利关闭
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

//  分组查询：分钢种查询
	@Override
	public List<ProductParameter> selectBySteelName(String steelName) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product_list = product_mapper.selectBySteelName(steelName);
			
//			提交事务	
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
//			保证资源顺利关闭
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

//  嵌套查询：对某个时间段三个属性字段查询记录
	@Override
	public List<ProductParameter> selectWithThreeRequirementsByTime(String classNo, String furnaceNo, String steelName,
			Date produceDate1, Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		
		try {
			//获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
			//调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product_list = product_mapper.selectWithThreeRequirementsByTime(classNo,furnaceNo,steelName,
					produceDate1,produceDate2);
			
			//关闭sql会话	
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
			
		}
		
		return product_list;
	}

//  嵌套查询：对某个时间段的任意两个属性字段查询记录
	@Override
	public List<ProductParameter> selectWithAnyTwoRequirementsByTime(String NAME1, String VALUE1, String NAME2,
			String VALUE2, Date produceDate1, Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
		//执行sql语句
		product_list = product_mapper.selectWithAnyTwoRequirementsByTime(NAME1,VALUE1,NAME2,VALUE2,
				produceDate1,produceDate2);
		
		//关闭sql会话	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

//  嵌套查询：对某个时间段的任意一个属性字段查询记录
	@Override
	public List<ProductParameter> selectWithAnyOneRequirementByTime(String NAME1, String VALUE1, Date produceDate1,
			Date produceDate2) {
		
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
			//获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
			//调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product_list = product_mapper.selectWithAnyOneRequirementByTime(NAME1,VALUE1,
					produceDate1,produceDate2);
			
			//提交事务	
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
	
	
//	按指定字段查询
	@Override
	public List<ProductParameter> selectByOneCharacter(String NAME, String VALUE) {
		List<ProductParameter> product_list = null;
		SqlSession sqlsession = null;
		try {
//			获取sql会话
//			SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
//			sqlsession = sqlsessionFactory.openSession();
			
			sqlsession = MybatisUtil.openSqlSession();
			
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
			
//			提交事务	
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
//			保证资源顺利关闭
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product_list;
	}

// 按主键查询
	@Override
	public ProductParameter selectByPrimaryKey(Date produceDate,String furnaceNum) {
		
		ProductParameter product = null;
		SqlSession sqlsession = null;
		try {
//			获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			product = product_mapper.selectByPrimaryKey(produceDate,furnaceNum);
			
//			提交事务	
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
//			保证资源顺利关闭
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		
		return product;
	}

	
//	更新一条记录
	public int updateSingleRecord(ProductParameter product) {
		int result = -1;
		SqlSession sqlsession = null;
		try {
			//获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
			//调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			result = product_mapper.updateSingleRecord(product);
			
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				//关闭sql会话
				sqlsession.close();
			}
			
		}
		
		return result;
	}

	
//	按指定字段删除记录
	@Override
	public int deleteByOneCharacter(String NAME,String VALUE) {
		int result = -1;
		SqlSession sqlsession = null;
		try {
//			获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
//			调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
//			执行sql语句
			result = product_mapper.deleteByOneCharacter(NAME,VALUE);
			
			sqlsession.commit();
			
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		return result;
	}
	
//	按主键字段删除记录
	@Override
	public int deleteByPrimaryKey(Date produceDate, String furnaceNum) {
		int result = -1;
		SqlSession sqlsession = null;
		
		try {
			//获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
			//调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			result = product_mapper.deleteByPrimaryKey(produceDate,furnaceNum);
			
			sqlsession.commit();
			
		}
		catch (Exception e) {
//			出错回滚事务
			sqlsession.rollback();
		}
		finally {
			if (sqlsession != null) {
				sqlsession.close();
			}
		}
		return result;
	}

//	插入单条记录
	@Override
	public int insertSingleRecord(ProductParameter product) {
		int result = -1;
		SqlSession sqlsession = null;
		
		try{
			//获取sql会话
			sqlsession = MybatisUtil.openSqlSession();
			
			//调用接口中的方法定位sql语句
			ProductParameterMapper product_mapper = sqlsession.getMapper(ProductParameterMapper.class);
			//执行sql语句
			result = product_mapper.insertSingleRecord(product);
			
			//关闭sql会话
			sqlsession.commit();
		}
		catch (Exception e) {
//			出错回滚事务
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
