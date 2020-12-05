package daoMappersImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import Mappers.ProductAccessoryMapper;
import model.ProductAccessory;



public class ProductAccessoryMapperImpl implements ProductAccessoryMapper{
	
//	按指定字段查询
	@Override
	public List<ProductAccessory> selectByOneCharacter(String NAME, String VALUE) {
		
		List<ProductAccessory> product_list = null;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//执行sql语句
		product_list = product_mapper.selectByOneCharacter(NAME,VALUE);
		
		//关闭sql会话	
		sqlsession.commit();
		sqlsession.close();
		
		return product_list;
	}

	
	public int updateSingleRecord(ProductAccessory product) {
		int result = -1;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//执行sql语句
		result = product_mapper.updateSingleRecord(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public List<ProductAccessory> selectAll() {
		List<ProductAccessory> product_list = null;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
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
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//执行sql语句
		result = product_mapper.deleteByOneCharacter(NAME,VALUE);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insertSingleRecord(ProductAccessory product) {
		int result = -1;
		
		//获取sql会话
		SqlSessionFactory sqlsessionFactory = MybatisUtil.getSqlSessionFactory();
		SqlSession sqlsession = sqlsessionFactory.openSession();
		
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		//执行sql语句
		result = product_mapper.insertSingleRecord(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

}
