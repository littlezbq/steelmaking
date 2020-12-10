package controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	
	//test
	@RequestMapping(value="/updateTest")
	public String updateTest() {
		return "addsuccess";
	}
	
	
	//更新数据操作
	@RequestMapping(value="/updateMaterial")
	public String updateMaterial(ProductParameter product) {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.updateSingleRecord(product);
		System.out.println(product.toString());
		return "addsuccess";
	}
	
	//显示数据统计操作
	@RequestMapping("/showstatistics")
	public String showstatistics() {
		return "statistics2";
	}
	
	@RequestMapping("/train")
    public String train(HttpServletRequest request, Model model) throws Exception {
        String[] input_train;
        String[] output_train;
        input_train = request.getParameterValues("input_train");
        output_train = request.getParameterValues("output_train");

        for(int i = 0; i < input_train.length; i++){
            System.out.println(String.valueOf(input_train[i]));
        }

        String steelType_train = (String) request.getParameter("steelType_train");
        String stoveNum_train = (String) request.getParameter("stoveNum_train");
        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/train.py", "-t", steelType_train, "-n", stoveNum_train, "i_C i_Si ", "p_Si "};
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "predictSteel";
    }

    @RequestMapping("/test")
    public String test(HttpServletRequest request, Model model) throws Exception {
        String steelType_test = request.getParameter("steelType_test");
        String stoveNum_test = request.getParameter("stoveNum_test");
        String modelSelect_test = request.getParameter("modelSelect_test");
//        String[] cmds = new String[] {"C:/Anaconda3/envs/pytorch/python.exe", "F:/code/python/data_mining/fePredict/test.py",  "-t", steelType_test, "-n", stoveNum_test, modelSelect_test};
        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/test.py", "-t", steelType_test, "-n", stoveNum_test};
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "predictSteel";
    }

    @RequestMapping("/regression")
    public String regression(HttpServletRequest request, Model model) throws Exception {
        String[] favorites;
        favorites = request.getParameterValues("favorite");
        String steelType_regression = request.getParameter("steelType_regression");
        String stoveNum_regression = request.getParameter("stoveNum_regression");
        String outputSelect_regression = request.getParameter("outputSelect_regression");
        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/regression.py", "-t", steelType_regression, "-n", stoveNum_regression, "123", outputSelect_regression};
        String str = getOutput(cmds);
        model.addAttribute("text", str);
        return "predictSteel";
    }
    
    @RequestMapping("/predictSteel")
    public String predictSteel() {
    	return "predictSteel";
    }
    
    public static String getOutput(String[] cmds) throws Exception
    {
        Process pcs = Runtime.getRuntime().exec(cmds);
        // 定义Python脚本的返回值
        String result = null;
        // 获取CMD的返回流
        BufferedInputStream in = new BufferedInputStream(pcs.getInputStream());
        // 字符流转换字节流
        BufferedReader br = new BufferedReader(new InputStreamReader(in, "GBK"));
        // 这里也可以输出文本日志

        String lineStr = null;
        String result1="";
        while ((lineStr = br.readLine()) != null) {
            result = lineStr;
            result1=result1.concat(result);
        }
        // 关闭输入流
        br.close();
        in.close();
        System.out.println(result1);
        return result1;
    }
	
	
}
