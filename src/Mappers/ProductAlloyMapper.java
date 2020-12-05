package Mappers;

import java.sql.Timestamp;
import java.util.List;

import model.ProductAlloy;
import org.apache.ibatis.annotations.Param;

public interface ProductAlloyMapper {
   
    int deleteByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate,@Param("accessoryName")String accessoryName,@Param("addTime")int addTime);

    int insert(ProductAlloy product);
    
    int insertSelective(ProductAlloy product);

    ProductAlloy selectByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate,@Param("accessoryName")String accessoryName,@Param("addTime")int addTime);
    
    List<ProductAlloy> selectAll();

    int updateByPrimaryKeySelective(ProductAlloy product);

    int updateByPrimaryKey(ProductAlloy product);
}