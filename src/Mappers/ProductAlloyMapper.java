package Mappers;

import java.util.List;

import model.ProductAccessory;
import model.ProductAlloy;
import org.apache.ibatis.annotations.Param;

public interface ProductAlloyMapper {
   
	//ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //�����������ǰ��
    int insertSingleRecord(ProductAlloy product);
    
    //��ָ���ֶβ�ѯ
    List<ProductAlloy> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //��ѯ�ñ����м�¼
    List<ProductAlloy> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductAlloy product);
}