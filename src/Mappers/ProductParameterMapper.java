package Mappers;

import java.util.Date;
import java.util.List;

import model.ProductParameter;
import org.apache.ibatis.annotations.Param;

public interface ProductParameterMapper {
	
	//按指定字段删除单条记录
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  查询所有钢种类型
    List<String> selectAllSteelName();
    
    
//  分组查询：分时间段查询
    List<ProductParameter>selectByTime(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  分组查询：分钢种查询
    List<ProductParameter> selectBySteelName(@Param("steelName")String steelName);
    
//  嵌套查询：对某个时间段三个属性字段查询记录
    List<ProductParameter> selectWithThreeRequirementsByTime(@Param("classNo")String classNo,@Param("furnaceNo")String furnaceNo,@Param("steelName")String steelName,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  嵌套查询：对某个时间段的任意两个属性字段查询记录
    List<ProductParameter> selectWithAnyTwoRequirementsByTime(@Param("NAME1")String NAME1,@Param("VALUE1")String VALUE1,@Param("NAME2")String NAME2,@Param("VALUE2")String VALUE2,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  嵌套查询：对某个时间段的任意一个属性字段查询记录
    List<ProductParameter> selectWithAnyOneRequirementByTime(@Param("NAME1")String NAME1,@Param("VALUE1")String VALUE1,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
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