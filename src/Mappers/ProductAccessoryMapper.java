package Mappers;

import java.util.List;

import model.ProductAccessory;
import model.ProductParameter;

import org.apache.ibatis.annotations.Param;
public interface ProductAccessoryMapper {
	//删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //插入操作（当前）
    int insertSingleRecord(ProductAccessory product);
    
    //按指定字段查询
    List<ProductAccessory> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //查询该表所有记录
    List<ProductAccessory> selectAll(); 
    
    //更新单条记录
    int updateSingleRecord(ProductAccessory product);
}