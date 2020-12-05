package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductSteelMapper;
import model.ProductSteel;

public class ProductSteelMapperImpl implements ProductSteelMapper {

//	按指定字段查询
	@Override
	public List<ProductSteel> selectByOneCharacter(String NAME, String VALUE) {
		
		List<ProductSteel> product_list = null;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//执行sql语句
		product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
		
		//关闭sql会话	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

	
	public int updateSingleRecord(ProductSteel product) {
		int result = -1;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//执行sql语句
		result = product_mapper.updateSingleRecord(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public List<ProductSteel> selectAll() {
		List<ProductSteel> product_list = null;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//执行sql语句
		product_list = product_mapper.selectAll();
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}
	
	//删除记录
	@Override
	public int deleteByOneCharacter(String NAME,String VALUE) {
		int result = -1;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//执行sql语句
		result = product_mapper.deleteByOneCharacter(NAME,VALUE);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insertSingleRecord(ProductSteel product) {
		int result = -1;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
		//执行sql语句
		result = product_mapper.insertSingleRecord(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

}
