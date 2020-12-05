package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductSlagMapper;
import model.ProductSlag;

public class ProductSlagMapperImpl implements ProductSlagMapper {
	//获取sql会话
	SqlSession sqlsession = MybatisUtil.getSqlSession();
				
	//调用接口中的方法定位sql语句
	ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
	
	@Override
	public int deleteByPrimaryKey(String fornaceNum,Timestamp produceDate) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//调用接口中的方法定位sql语句
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//执行sql语句
		result = product_mapper.deleteByPrimaryKey(fornaceNum,produceDate);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insert(ProductSlag product) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//调用接口中的方法定位sql语句
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//执行sql语句
		result = product_mapper.insert(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int insertSelective(ProductSlag product) {
		int result = -1;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//调用接口中的方法定位sql语句
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//执行sql语句
		result = product_mapper.insert(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public ProductSlag selectByPrimaryKey(String fornaceNum,Timestamp produceDate) {
		ProductSlag product = null;
		
		//获取sql会话
		SqlSession sqlsession = MybatisUtil.getSqlSession();
					
		//调用接口中的方法定位sql语句
		ProductSlagMapper product_mapper = sqlsession.getMapper(ProductSlagMapper.class);
		//执行sql语句
		product = product_mapper.selectByPrimaryKey(fornaceNum,produceDate);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public List<ProductSlag> selectAll() {
		List<ProductSlag> product_list = null;
		//执行sql语句
		product_list = product_mapper.selectAll();
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int updateByPrimaryKeySelective(ProductSlag product) {
		int result = -1;
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductSlag product) {
		int result = -1;
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKey(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

}
