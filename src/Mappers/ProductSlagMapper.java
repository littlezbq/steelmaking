package Mappers;

import java.util.List;

import model.ProductSlag;
import org.apache.ibatis.annotations.Param;
public interface ProductSlagMapper {
	//删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //插入操作（当前）
    int insertSingleRecord(ProductSlag product);
    
    //按指定字段查询
    List<ProductSlag> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //查询该表所有记录
    List<ProductSlag> selectAll(); 
    
    //更新单条记录
    int updateSingleRecord(ProductSlag product);
}