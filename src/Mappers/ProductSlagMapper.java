package Mappers;

import java.sql.Timestamp;
import java.util.List;

import model.ProductSlag;
import org.apache.ibatis.annotations.Param;
public interface ProductSlagMapper {
    int deleteByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate);

    int insert(ProductSlag product);

    int insertSelective(ProductSlag product);

    ProductSlag selectByPrimaryKey(@Param("furnaceNum")String furnaceNum,@Param("produceDate")Timestamp produceDate);
    
    List<ProductSlag> selectAll();

    int updateByPrimaryKeySelective(ProductSlag product);

    int updateByPrimaryKey(ProductSlag product);
}