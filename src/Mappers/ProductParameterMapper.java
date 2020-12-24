package Mappers;

import java.util.Date;
import java.util.List;

import model.ProductParameter;
import org.apache.ibatis.annotations.Param;

public interface ProductParameterMapper {
	
	//��ָ���ֶ�ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  ��ѯ���и�������
    List<String> selectAllSteelName();
    
    
//  �����ѯ����ʱ��β�ѯ
    List<ProductParameter>selectByTime(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  �����ѯ���ָ��ֲ�ѯ
    List<ProductParameter> selectBySteelName(@Param("steelName")String steelName);
    
//  Ƕ�ײ�ѯ����ĳ��ʱ������������ֶβ�ѯ��¼
    List<ProductParameter> selectWithThreeRequirementsByTime(@Param("classNo")String classNo,@Param("furnaceNo")String furnaceNo,@Param("steelName")String steelName,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  Ƕ�ײ�ѯ����ĳ��ʱ��ε��������������ֶβ�ѯ��¼
    List<ProductParameter> selectWithAnyTwoRequirementsByTime(@Param("NAME1")String NAME1,@Param("VALUE1")String VALUE1,@Param("NAME2")String NAME2,@Param("VALUE2")String VALUE2,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  Ƕ�ײ�ѯ����ĳ��ʱ��ε�����һ�������ֶβ�ѯ��¼
    List<ProductParameter> selectWithAnyOneRequirementByTime(@Param("NAME1")String NAME1,@Param("VALUE1")String VALUE1,@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  �������ֶ�ɾ��������¼
    int deleteByPrimaryKey(@Param("produceDate")Date produceDate,@Param("furnaceNum")String furnaceNum);
    
    //�����������ǰ��
    int insertSingleRecord(ProductParameter product);
    
//  ��ָ���ֶβ�ѯ
    List<ProductParameter> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  ��������ѯ
    ProductParameter selectByPrimaryKey(@Param("produceDate")Date produceDate,@Param("furnaceNum")String furnaceNum);
    
    //��ѯ�ñ����м�¼,���Ƽ�
//    List<ProductParameter> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductParameter product);

}