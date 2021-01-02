package controller;

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.core.JsonParser;
import com.mysql.cj.xdevapi.JsonArray;

import daoMappersImpl.ProductParameterMapperImpl;
import model.ProductParameter;
import net.sf.json.JSONArray;

@Controller

public class excipient {
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8") 
	
//	管理生产数据页面
	@RequestMapping("/manageProducePara")
	public String manageProducePara() {
		
		return "/productParameter/manageProducePara";
	}
	
//	跳转至添加页面
	@RequestMapping("/addProduceParaPage")
	public String addProduceParaPage() {
		
		return "/productParameter/addProduceParaPage";
	}
	
	
	@RequestMapping("/showmaterial")
	public String showmaterial() {
		
		return "material";
	}
	
	@RequestMapping("/manageSteelPara")
	public String manageSteelPara() {
		return "/standardSteel/manageSteelPara";
	}

	@RequestMapping("/addSteelParaPage")
	public String addSteelParaPage() {
		return "/standardSteel/addSteelParaPage";
	}
	
	@RequestMapping("/test2")
	public String test2() {
		return "/standardSteel/test2";
	}
	
	//添加生产数据操作
	@RequestMapping(value="/addProducePara", method=RequestMethod.POST)
	@ResponseBody
	public String addProducePara(ProductParameter product){
		System.out.println(product.toString());
//		System.out.println(product.getProduceDate());
		int result = -1;
		
		Date produceDate = product.getProduceDate();
		String furnaceNum = product.getFurnaceNum();
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		if (productImpl.selectByPrimaryKey(produceDate, furnaceNum) == null) {
			result = productImpl.insertSingleRecord(product);
			return " success";
		}
		return "failed";
		
//		System.out.println(product.toString());
		
	}
	
	
//	查询所有钢种类型
	@RequestMapping("/searchAllSteelName")
	@ResponseBody
	public List<String> searchAllSteelName(){
		List<String> steelName_list = null;
		
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		steelName_list = productImpl.selectAllSteelName();
		
		return steelName_list;
	}
	
//	按钢种查询
	@RequestMapping("/searchProduceParaBySteelName")
	public ModelAndView searchProduceParaBySteelName(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		
//		新建分页类对象
		pageInfo page = pageInfo.getPageInfo();
		request.setCharacterEncoding("UTF-8");
		String steelName = request.getParameter("selectAllSteelName");
		
//		将steelName存入session中
		HttpSession session = request.getSession();
		if (steelName != null) {
			session.setAttribute("steelName",steelName);
			
//			将总记录数存入pageInfo中
			page.setTotalRecord(productImpl.getTotalRecordBySteelName(steelName));
//			System.out.println(page.getTotalRecord());
			
			session.setAttribute("totalRecord", page.getTotalRecord());
		}
		else {
			steelName = session.getAttribute("steelName").toString();
		}
		
		List<ProductParameter> product_list = null;
		
		int totalRecord = Integer.parseInt(session.getAttribute("totalRecord").toString());
		
//		获取当前页面
		page.setCurrentPage(Integer.parseInt(request.getParameter("pageNum")));
		
//		获取每一页的起始索引
		int begin = (page.getCurrentPage() - 1) * page.getMaxRecord();
		
//		获取上一页和下一页,这里要加上校验
//		如果当前页面已经为首页了，则怎么点上一页都是首页，否则返回上一页
		if (page.getCurrentPage() > 1) {
			page.setPrePage(page.getCurrentPage() - 1);
		}
		else {
			page.setPrePage(page.getCurrentPage());
		}
		
//		获取尾页
		if (totalRecord % page.getMaxRecord() == 0) {
			page.setFinalPage(totalRecord / page.getMaxRecord());
		}
		else {
			page.setFinalPage(totalRecord / page.getMaxRecord() + 1);
		}
		
//		如果当前页面已经是尾页了，则怎么点都是尾页，否则返回下一页
		if (page.getCurrentPage() < page.getFinalPage()) {
			page.setNextPage(page.getCurrentPage() + 1);
		}
		else {
			page.setNextPage(page.getCurrentPage());
		}
		
		product_list = productImpl.selectBySteelName(steelName,begin,page.getMaxRecord());
		
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("prePage", page.getPrePage());
		modelAndView.addObject("nextPage", page.getNextPage());
		modelAndView.addObject("finalPage", page.getFinalPage());
		modelAndView.addObject("sum", totalRecord);
		modelAndView.addObject("pageNum", page.getCurrentPage());
		
//		返回页面时表明是哪一个函数传过来的参数
		modelAndView.addObject("selectType","searchProduceParaBySteelName");
		
		modelAndView.setViewName("/productParameter/searchresult");
		return modelAndView;
	}
	
	
	//按生产日期查询生产数据记录操作-ModelAndView
	@RequestMapping("/searchProduceParaByTime")
	public ModelAndView searchProduceParaByTime(HttpServletRequest request) throws UnsupportedEncodingException{
		ModelAndView modelAndView = new ModelAndView();
//		新建分页类对象
		pageInfo page = pageInfo.getPageInfo();
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		request.setCharacterEncoding("UTF-8");
		
		String producedate1 = request.getParameter("produceDate1");
		String producedate2 = request.getParameter("produceDate2");
		Date produceDate1 = null;
		Date produceDate2 = null;
//		将本次查询的生产日期参数存入Session中
		HttpSession session = request.getSession();
		if (producedate1 != null && producedate2 != null) {
			session.setAttribute("produceDate1", producedate1);
			session.setAttribute("produceDate2", producedate2);
			
			produceDate1 = dateToTime.StringToDate(producedate1);
			produceDate2 = dateToTime.StringToDate(producedate2);
			
//			将总记录数存入pageInfo中
			page.setTotalRecord(productImpl.getTotalRecord(produceDate1, produceDate2));
//			System.out.println(page.getTotalRecord());
			
			session.setAttribute("totalRecord", page.getTotalRecord());
		}
		else {
			producedate1 = session.getAttribute("produceDate1").toString();
			producedate2 = session.getAttribute("produceDate2").toString();
			
			produceDate1 = dateToTime.StringToDate(producedate1);
			produceDate2 = dateToTime.StringToDate(producedate2);
		}
		
		List<ProductParameter> product_list = null;
		int totalRecord = Integer.parseInt(session.getAttribute("totalRecord").toString());
		
//		获取当前页面
		page.setCurrentPage(Integer.parseInt(request.getParameter("pageNum")));
		
//		获取每一页的起始索引
		int begin = (page.getCurrentPage() - 1) * page.getMaxRecord();
		
//		获取上一页和下一页,这里要加上校验
//		如果当前页面已经为首页了，则怎么点上一页都是首页，否则返回上一页
		if (page.getCurrentPage() > 1) {
			page.setPrePage(page.getCurrentPage() - 1);
		}
		else {
			page.setPrePage(page.getCurrentPage());
		}
		
//		获取尾页
		if (totalRecord % page.getMaxRecord() == 0) {
			page.setFinalPage(totalRecord / page.getMaxRecord());
		}
		else {
			page.setFinalPage(totalRecord / page.getMaxRecord() + 1);
		}
		
//		如果当前页面已经是尾页了，则怎么点都是尾页，否则返回下一页
		if (page.getCurrentPage() < page.getFinalPage()) {
			page.setNextPage(page.getCurrentPage() + 1);
		}
		else {
			page.setNextPage(page.getCurrentPage());
		}
		

		
		product_list = productImpl.selectByTime(produceDate1, produceDate2,begin,page.getMaxRecord());
		
		modelAndView.addObject("firstlist", product_list);
		modelAndView.addObject("prePage", page.getPrePage());
		modelAndView.addObject("nextPage", page.getNextPage());
		modelAndView.addObject("finalPage", page.getFinalPage());
		modelAndView.addObject("sum", totalRecord);
		modelAndView.addObject("pageNum", page.getCurrentPage());

//		返回页面时表明是哪一个函数传过来的参数
		modelAndView.addObject("selectType","searchProduceParaByTime");
		
		System.out.println();
		
		modelAndView.setViewName("/productParameter/searchresult");
		return modelAndView;
	}
	
	
	  @RequestMapping("/searchresult") 
	  public String searchresult() { 
		  return "/productParameter/searchresult"; 
	  }
	 
		
	//删除数据操作
	@RequestMapping(value="/deleteProduceParaPage/{produceDate}&{furnaceNum}",method=RequestMethod.GET)
	public String deleteProduceParaPage(@PathVariable("produceDate")String producedate,@PathVariable("furnaceNum")String furnaceNum, HttpServletResponse response) throws IOException {
		int result = -1;
		Date produceDate = dateToTime.dateToTime2(producedate);
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		result = productImpl.deleteByPrimaryKey(produceDate, furnaceNum);
		
		System.out.println(producedate);
		System.out.println(furnaceNum);
		
		if (result > 0) {
			return "redirect:/manageProducePara";
//			response.sendRedirect("/steelmakingSYS/searchResult");
			
		}
		else {
			System.out.print("error");
		}
		return null;
	}
	
	
	
//跳转至更新页面
	@RequestMapping(value="/updateProduceParaPage/{produceDate}&{furnaceNum}",method=RequestMethod.GET)
	public ModelAndView updateProduceParaPage(@PathVariable("produceDate")String produceDate, @PathVariable("furnaceNum")String furnaceNum ) {
//			 System.out.println(produceDate);
//			 System.out.println(furnaceNum);
	     ProductParameter product = null;
		 Date produceDate2=dateToTime.dateToTime2(produceDate);
//			 System.out.println(produceDate2);
		 ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();	
		 ProductParameter productParameter = productImpl.selectByPrimaryKey(produceDate2, furnaceNum);
//			 System.out.println(productParameter);
		ModelAndView modelAndView=new ModelAndView();
		modelAndView.addObject("old_productPara", productParameter);
		modelAndView.setViewName("/productParameter/updateProduceParaPage");
		return modelAndView;
	}
	
	
	//更新数据操作
	@RequestMapping("/updateProducePara")
	public String updateProducePara(ProductParameter product) {
		ProductParameterMapperImpl productImpl = new ProductParameterMapperImpl();
		productImpl.updateSingleRecord(product);
		System.out.println(product.toString());
		return "/productParameter/manageProducePara";
	}
	
	//显示数据统计操作
	@RequestMapping("/showstatistics")
	public String showstatistics() {
		return "/productParameter/statistics";
	}
	
	
//	跳转至预测模块
	@RequestMapping("/predictSteel")
	public String predictSteel() {
		return "/productParameter/predictSteel";
	}
	
//	获取训练好的模型
	@RequestMapping(value="/getModel", method=RequestMethod.POST)
	@ResponseBody
	public List<String> getmodel(@RequestParam(value="steelType")String steelType,@RequestParam(value="stoveNum")String stoveNum) throws IOException {
		String path="F:/python/fePredict/model_data/" + steelType + '_' +stoveNum + '#' ;
		String folder="F:/python/fePredict/model_data/" + steelType + '_' +stoveNum + '#'+steelType + '_' +stoveNum+'#';
		File dir=new File(path);
		File file[]=dir.listFiles();//用file对象的slistFiles()方法返回指定目录下的文件	
		List<String> modelList=new ArrayList<String>();
		for(int i=0;i<file.length;i++)
		{
	    	if(file[i].isFile() && file[i].toString().substring(file[i].toString().length()-4,file[i].toString().length()).compareTo("json")!=0){
	    		String model=new String(file[i].toString().substring(folder.length()+1,file[i].toString().length()-4));
				/* out.print("<br>"+model); */
	           	/* Map<Integer,String> modelList=new HashMap<Integer,String>();
	            modelList.put(i,model);*/
	           
	            modelList.add(model);
				/* System.out.println(modelList.toString()); */      
	    	}
		}
//	    request.setAttribute("modelList",modelList);
		return modelList;
	}
	
	
//	预测模块
	  @RequestMapping("/train")
	    public String train(HttpServletRequest request, Model model) throws Exception {
	        String[] input_train;
	        String[] output_train;
	        input_train = request.getParameterValues("input_train");
	        output_train = request.getParameterValues("output_train");

	        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
	        Set<String> set_output = new HashSet<>(Arrays.asList(output_train));
	        String input_columns =  String.join(",", set_input);
	        String output_columns =  String.join(",", set_output);

	        String steelType_train = (String) request.getParameter("steelType_train");
	        String stoveNum_train = (String) request.getParameter("stoveNum_train");
	        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/train.py", "-t", steelType_train, "-n", stoveNum_train, input_columns, output_columns};
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/test")
	    public String test(HttpServletRequest request, Model model) throws Exception {
	        String[] cmds;
	        String[] input_textedit;
	        String[] input_test;
	        List list = new ArrayList();
	        input_test = request.getParameterValues("input_test");
	        String flag = request.getParameter("test_flag");
	        input_textedit = request.getParameterValues("textedit_test");
	        System.out.println(input_textedit);
	        for(int i=0; i < input_textedit.length;i++){
	            if(input_textedit[i] != null){
	                list.add(input_textedit[i]);
	            }
	        }
	        String textedit_str = listToString(list);
//	        System.out.println(textedit_str);
	        String steelType_test = request.getParameter("steelType_test");
	        String stoveNum_test = request.getParameter("stoveNum_test");
	        String modelSelect_test = request.getParameter("modelSelect_test");
	        Set<String> set_input = new HashSet<>(Arrays.asList(input_test));
	        String input_columns =  String.join(",", set_input);
	        System.out.println(modelSelect_test);
	        if(flag!=null){
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/test.py", "-t", steelType_test, "-n", stoveNum_test, modelSelect_test, input_columns, textedit_str};
	        
	        }
	        else{
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/test.py", "-t", steelType_test, "-n", stoveNum_test, modelSelect_test};
	        }
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/regression")
	    public String regression(HttpServletRequest request, Model model) throws Exception {
	        String[] cmds;
	        String[] input_textedit;
	        List list = new ArrayList();
	        String[] input_train;
	        input_textedit = request.getParameterValues("textedit_regression");
	        for(int i=0; i < input_textedit.length;i++){
	            if(input_textedit[i] != null){
	                list.add(input_textedit[i]);
	            }
	        }
	        String textedit_str = listToString(list);
	        System.out.println(textedit_str);
	        input_train = request.getParameterValues("input_regression");
	        Set<String> set_input = new HashSet<>(Arrays.asList(input_train));
	        String input_columns =  String.join(",", set_input);
	        String steelType_regression = request.getParameter("steelType_regression");
	        String stoveNum_regression = request.getParameter("stoveNum_regression");
	        String flag = request.getParameter("regression_flag");
	        String outputSelect_regression = request.getParameter("outputSelect_regression");
	        if(flag!=null){
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/regression.py", "-t", steelType_regression, "-n", stoveNum_regression, input_columns, outputSelect_regression, textedit_str};
	        }
	        else{
	            cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/regression.py", "-t", steelType_regression, "-n", stoveNum_regression, input_columns, outputSelect_regression};
	        }
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    @RequestMapping("/clean")
	    public String clean(HttpServletRequest request, Model model) throws Exception {
	        String steelType_clean = request.getParameter("steelType_clean");
	        String stoveNum_clean = request.getParameter("stoveNum_clean");
	        String flag_file = request.getParameter("clean_table");
	        String flag_txt = request.getParameter("clean_txt");
	        String flag_module = request.getParameter("clean_module");

	        String moduleSelect_clean = request.getParameter("moduleSelect_clean");
	        String[] cmds = new String[] {"D:/Anacoda3/envs/tensorflow-gpu/python.exe", "F:/python/fePredict/clean.py", "-t", steelType_clean, "-n", stoveNum_clean, moduleSelect_clean};
	        String str = getOutput(cmds);
	        model.addAttribute("text", str);
	        return "/productParameter/predictSteel";
	    }

	    public static String convertArrayToString(String[] strArr) {
	        if (strArr == null || strArr.length == 0) {
	            return "";
	        }
	        String res = "";
	        for (int i = 0, len = strArr.length; i < len; i++) {
	            res += strArr[i];
	            if (i < len - 1) {
	                res += ",";
	            }
	        }
	        return res;
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
	        return result1;

	    }
	    public static <T> String listToString(List<T> list) {
	        StringBuilder sb = new StringBuilder();
	        boolean b = false;
	        for (T o : list) {
	            if (b)
	                sb.append(',');
	            sb.append(o);
	            b = true;
	        }
	        return sb.toString();
	    }

	
}
