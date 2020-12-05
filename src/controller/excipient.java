package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

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
	
	//添加生产数据操作
	@RequestMapping(value="/addmaterial", method=RequestMethod.POST)
	public String addmaterial(ProductParameter product){
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.insertSingleRecord(product);
		System.out.println(product.toString());
		return "addsuccess";
	}
	
	//查询生产数据记录操作
	@RequestMapping("/searchsteel")
	public ModelAndView searchsteel(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView=new ModelAndView();
		request.setCharacterEncoding("UTF-8");
		String NAME = request.getParameter("NAME");
		String VALUE = request.getParameter("VALUE");
		List<ProductParameter> product_list = null;
		ProductParameter product = null;
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		product_list = productImpl.selectByOneCharacter(NAME, VALUE);
		modelAndView.addObject("firstlist", product_list);
		for (int i = 0; i < product_list.size();i++) {
			product = product_list.get(i);
			System.out.println(product.toString());
			
		}
		modelAndView.setViewName("searchresult");
		return modelAndView;
	}
	
	//删除数据操作
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
	
	//更新数据操作
	@RequestMapping(value="/updateMaterial",method=RequestMethod.POST)
	public String updateMaterial(ProductParameter product) {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.updateSingleRecord(product);
		System.out.println(product.toString());
		return "addsuccess";
	}
	
	//显示数据统计操作
	@RequestMapping("/showstatistics")
	public String showstatistics() {
		return "statistics";
	}
	
	
	
}
