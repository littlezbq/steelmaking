package Mappers;

import java.util.List;

import model.ProductSlag;
import org.apache.ibatis.annotations.Param;
public interface ProductSlagMapper {
	//ɾ��������¼
    int deleteByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //�����������ǰ��
    int insertSingleRecord(ProductSlag product);
    
    //��ָ���ֶβ�ѯ
    List<ProductSlag> selectByOneCharacter(@Param("NAME")String NAME,@Param("VALUE")String VALUE);
    
    //��ѯ�ñ����м�¼
    List<ProductSlag> selectAll(); 
    
    //���µ�����¼
    int updateSingleRecord(ProductSlag product);
}