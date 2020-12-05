package Mappers;

import java.sql.Timestamp;
import java.util.List;

import model.ProductSteel;
import org.apache.ibatis.annotations.Param;
public interface ProductSteelMapper {
    int deleteByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("steelName")String steelName,@Param("produceDate")Timestamp produceDate);

    int insert(ProductSteel product);

    int insertSelective(ProductSteel product);

    ProductSteel selectByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("steelName")String steelName,@Param("produceDate")Timestamp produceDate);
    
    List<ProductSteel> selectAll();

    int updateByPrimaryKeySelective(ProductSteel product);

    int updateByPrimaryKey(ProductSteel product);
}