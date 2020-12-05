package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;

@Controller

public class excipient {
	@RequestMapping("/showmaterial")
	public String showmaterial() {
		
		return "material";
	}
	
	@RequestMapping("/showsteel")
	public String showsteel() {
		System.out.println(123);
		return "steel";
	}
	
	@RequestMapping("/showalloy")
	public String showalloy() {
		return "alloy";
	}
	
	@RequestMapping("/showdreg")
	public String showdreg() {
		return "dreg";
	}
	
	@RequestMapping("/addsteel")
	public String addsteel() {
		return "addsuccess";
	}
	
	//����������ݲ���
	@RequestMapping(value="/addmaterial", method=RequestMethod.POST)
	public String addmaterial(ProductParameter product){
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.insertSingleRecord(product);
		System.out.println(product.toString());
		return "addsuccess";
	}
	
	//��ѯ�������ݼ�¼����
	@RequestMapping("/searchsteel")
	public String searchsteel(HttpServletRequest request) throws UnsupportedEncodingException{
		request.setCharacterEncoding("UTF-8");
		String NAME = request.getParameter("NAME");
		String VALUE = request.getParameter("VALUE");
		List<ProductParameter> product_list = null;
		ProductParameter product = null;
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		product_list = productImpl.selectByOneCharacter(NAME, VALUE);
		
		for (int i = 0; i < product_list.size();i++) {
			product = product_list.get(i);
			System.out.println(product.toString());
		}
		
		return "searchresult";
	}
	
	//ɾ�����ݲ���
	@RequestMapping("/deleteMaterials")
	public String deleteMaterials(HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String NAME = request.getParameter("NAME");
		String VALUE = request.getParameter("VALUE");
		
		int result = -1;
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		result = productImpl.deleteByOneCharacter(NAME, VALUE);
		
		if (result > 0) {
			return "deleteresult";
		}
		else {
			System.out.print("error");
		}
		return null;
	}
	
	//�������ݲ���
	@RequestMapping(value="/updateMaterial",method=RequestMethod.POST)
	public String updateMaterial(ProductParameter product) {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.updateSingleRecord(product);
		System.out.println(product.toString());
		return "addsuccess";
	}
	
	//��ʾ����ͳ�Ʋ���
	@RequestMapping("/showstatistics")
	public String showstatistics() {
		return "statistics";
	}
	
	
	
}
