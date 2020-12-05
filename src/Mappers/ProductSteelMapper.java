package Mappers;

import java.util.List;

import model.ProductSteel;
import org.apache.ibatis.annotations.Param;
public interface ProductSteelMapper {
	//删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //插入操作（当前）
    int insertSingleRecord(ProductSteel product);
    
    //按指定字段查询
    List<ProductSteel> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //查询该表所有记录
    List<ProductSteel> selectAll(); 
    
    //更新单条记录
    int updateSingleRecord(ProductSteel product);
}