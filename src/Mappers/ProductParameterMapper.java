package Mappers;

import java.util.Date;
import java.util.List;
import java.util.Map;

import model.ProductParameter;
import org.apache.ibatis.annotations.Param;

public interface ProductParameterMapper {
	
	//��ָ���ֶ�ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
//  ��ѯ���и�������
    List<String> selectAllSteelName();
    
    
//  �����ѯ����ʱ��β�ѯ
    List<ProductParameter>selectByTime(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2,@Param("begin")int begin,@Param("total")int total);

    //  ��ȡ��ʱ��μ�¼�ܺ�
    int getTotalRecord(@Param("produceDate1")Date produceDate1,@Param("produceDate2")Date produceDate2);
    
//  �����ѯ���ָ��ֲ�ѯ
    List<ProductParameter> selectBySteelName(@Param("steelName")String steelName,@Param("begin")int begin,@Param("total")int total);
    
//  ��ȡĳһ���ּ�¼�ܺ�
    int getTotalRecordBySteelName(@Param("steelName")String steelName);
    
//  ������ѯ����ĳ��ʱ������������ֶβ�ѯ��¼
    List<ProductParameter> selectWithThreeRequirementsByTime(Map<String,String> map);
    
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