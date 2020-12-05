package Mappers;

import java.util.List;

import model.ProductParameter;
import org.apache.ibatis.annotations.Param;

public interface ProductParameterMapper {
	
	//ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //�����������ǰ��
    int insertSingleRecord(ProductParameter product);
    
//  ��ָ���ֶβ�ѯ
    List<ProductParameter> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //��ѯ�ñ����м�¼
    List<ProductParameter> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductParameter product);

}