package daoMappersImpl;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import Mappers.ProductSteelMapper;
import model.ProductSteel;

public class ProductSteelMapperImpl implements ProductSteelMapper {

	//获取sql会话
	SqlSession sqlsession = MybatisUtil.getSqlSession();
				
	//调用接口中的方法定位sql语句
	ProductSteelMapper product_mapper = sqlsession.getMapper(ProductSteelMapper.class);
	@Override
	public int deleteByPrimaryKey(String fornaceNum,String steelName,Timestamp produceDate) {
		int result = -1;
			
		//执行sql语句
		result = product_mapper.deleteByPrimaryKey(fornaceNum,steelName,produceDate);
		
		sqlsession.commit();
		sqlsession.close();
		return result;
	}

	@Override
	public int insert(ProductSteel product) {
		int result = -1;
		
		//执行sql语句
		result = product_mapper.insert(product);
			
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int insertSelective(ProductSteel product) {
		int result = -1;
			
		//执行sql语句
		result = product_mapper.insert(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
			
		return result;
	}

	@Override
	public ProductSteel selectByPrimaryKey(String fornaceNum,String steelName,Timestamp produceDate) {
		ProductSteel product = null;
		
		//执行sql语句
		product = product_mapper.selectByPrimaryKey(fornaceNum,steelName,produceDate);
			
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product;
	}

	@Override
	public List<ProductSteel> selectAll() {
		List<ProductSteel> product_list = null;
		//执行sql语句
		product_list = product_mapper.selectAll();
			
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		return product_list;
	}

	@Override
	public int updateByPrimaryKeySelective(ProductSteel product) {
		int result = -1;
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKeySelective(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}

	@Override
	public int updateByPrimaryKey(ProductSteel product) {
		int result = -1;
		
		//执行sql语句
		result = product_mapper.updateByPrimaryKey(product);
		
		//关闭sql会话
		sqlsession.commit();
		sqlsession.close();
		
		return result;
	}


}
