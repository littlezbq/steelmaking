package Mappers;

import java.util.List;

import model.ProductAccessory;
import model.ProductAlloy;
import org.apache.ibatis.annotations.Param;

public interface ProductAlloyMapper {
   
	//删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //插入操作（当前）
    int insertSingleRecord(ProductAlloy product);
    
    //按指定字段查询
    List<ProductAlloy> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //查询该表所有记录
    List<ProductAlloy> selectAll(); 
    
    //更新单条记录
    int updateSingleRecord(ProductAlloy product);
}