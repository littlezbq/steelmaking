package Mappers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import model.ProductParameter;
import org.apache.ibatis.annotations.Param;

public interface ProductParameterMapper {
	
	//按指定字段删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  查询所有钢种类型
    List<String> selectAllSteelName();
    
    
//  分组查询：分时间段查询
    List<ProductParameter>selectByTime(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2,@Param("begin")int begin,@Param("total")int total);

    //  获取该时间段记录总和
    int getTotalRecord(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  分组查询：分钢种查询
    List<ProductParameter> selectBySteelName(@Param("steelName")String steelName,@Param("begin")int begin,@Param("total")int total);
    
//  获取某一钢种记录总和
    int getTotalRecordBySteelName(@Param("steelName")String steelName);
    
//  条件查询：对某个时间段三个属性字段查询记录
    List<ProductParameter> selectWithThreeRequirementsByTime(Map<String,String> map);
    
//  按主键字段删除单条记录
    int deleteByPrimaryKey(@Param("produceDate")Date produceDate,@Param("furnaceNum")String furnaceNum);
    
    //插入操作（当前）
    int insertSingleRecord(ProductParameter product);
    
//  按指定字段查询
    List<ProductParameter> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  按主键查询
    ProductParameter selectByPrimaryKey(@Param("produceDate")Date produceDate,@Param("furnaceNum")String furnaceNum);
    
    //查询该表所有记录,不推荐
//    List<ProductParameter> selectAll(); 
    
    //更新单条记录
    int updateSingleRecord(ProductParameter product);

}