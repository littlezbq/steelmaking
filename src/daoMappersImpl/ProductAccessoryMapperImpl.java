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
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		product = product_mapper.selectByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public int insert(ProductAccessory product) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		result = product_mapper.insert(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductAccessory product) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKey(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}
	
	@Override
	public int updateByPrimaryKeySelective(ProductAccessory product) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}	

	@Override
	public int deleteByPrimaryKey(String furnaceNum,Timestamp produceDate,String accessoryName,int addTime) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		result = product_mapper.deleteByPrimaryKey(furnaceNum,produceDate,accessoryName,addTime);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}
	
	public List<ProductAccessory> selectAll(){
		List<ProductAccessory> product_list = null;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		product_list = product_mapper.selectAll();
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int insertSelective(ProductAccessory product) {
		
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
			
		//调用接口中的方法定位sql语句
		ProductAccessoryMapper product_mapper = sqlsession.getMapper(ProductAccessoryMapper.class);
		
		//执行sql语句
		result = product_mapper.insert(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}


}
