package Mappers;

import java.util.List;

import model.ProductAccessory;
import model.ProductParameter;

import org.apache.ibatis.annotations.Param;
public interface ProductAccessoryMapper {
	//ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //�����������ǰ��
    int insertSingleRecord(ProductAccessory product);
    
    //��ָ���ֶβ�ѯ
    List<ProductAccessory> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //��ѯ�ñ����м�¼
    List<ProductAccessory> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductAccessory product);
}