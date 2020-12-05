package Mappers;

import java.util.List;

import model.ProductSteel;
import org.apache.ibatis.annotations.Param;
public interface ProductSteelMapper {
	//ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //�����������ǰ��
    int insertSingleRecord(ProductSteel product);
    
    //��ָ���ֶβ�ѯ
    List<ProductSteel> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //��ѯ�ñ����м�¼
    List<ProductSteel> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductSteel product);
}