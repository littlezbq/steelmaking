package Mappers;

import java.sql.Timestamp;
import java.util.List;

import model.ProductAccessory;
import org.apache.ibatis.annotations.Param;
public interface ProductAccessoryMapper {
    int deleteByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate,@Param("accessoryName")String accessoryName,@Param("addTime")int addTime);

    int insert(ProductAccessory product);
    
    int insertSelective(ProductAccessory product);

    ProductAccessory selectByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate,@Param("accessoryName")String accessoryName,@Param("addTime")int addTime);
    
    List<ProductAccessory> selectAll(); 

    int updateByPrimaryKeySelective(ProductAccessory product);

    int updateByPrimaryKey(ProductAccessory product);
}