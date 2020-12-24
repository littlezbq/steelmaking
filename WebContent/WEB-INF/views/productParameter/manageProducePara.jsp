<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>转炉炼钢</title>
  <meta name="keywords" content="" />
  <meta name="description" content="" />
  <meta name="viewport" content="width=device-width">
  <script src="js/adapter.js"></script> <!--rem适配js-->

<link rel="stylesheet" href="css/base.css"> <!--初始化文件-->
<link rel="stylesheet" href="css/menu.css"> <!--主样式-->        
<link rel="stylesheet" href="css/templatemo_main.css">
<link rel="shortcut icon" href="./images/favicon.jpg"/>
<link type="text/css" href="./topjui/css/topjui.core.min.css" rel="stylesheet">
<link type="text/css" href="./topjui/themes/default/topjui.blue.css" rel="stylesheet" id="dynamicTheme"/>
</head>
<!-- <script>
funtion 1(){
	window.location.href="showmaterial";
}
</script> -->
<body>
	
	<jsp:include page="include.jsp" />
	<div class="panel-body">
		<!--添加生产参数按钮  -->
		<form action="addProduceParaPage" method="post" name="form1"
			id="form1">
			<button class="btn btn-primary btn-sm" type="submit" id="submit">
				添加生产参数<i class="fa fa-plus" style="font-size: 15px;"></i>
			</button>
		</form>
		
		<!-- 查询操作 -->
		<form  method="post" name="form2" id="form2">
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;分类查询&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				属性选择：<select id="NAME" name="NAME" onchange="selectType();"
					class="selectpicker show-tick form-control"
					style="font-size: 15px; text-align: center; display: inline; vertical-align: middle; width: 160px; height: 30px; border: none">
					<!-- <option value=null></option> -->
					<option value="produce_date">按生产日期查询</option>
					<option value="steel_name">按钢种类别查询</option>

				</select> 
				输入关键字：
				<!-- 按日期查询 -->
				<div id="date" style="display:inline;">
					<input type="date" 
						style=" height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
						id="produceDate1" name="produceDate1"> &nbsp;&nbsp;
					<input type="date"
						style=" height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
						id="produceDate2" name="produceDate2"> &nbsp;&nbsp;
				</div>
				<!-- 按钢种类型查询 -->
				<select id="selectAllSteelName" name="selectAllSteelName" >
				</select>
				
				
				<button class="btn btn-success btn-sm" type="submit" onclick="select();">
					<i class="fa fa-search" aria-hidden="true"></i>查询
				</button>
			</div>
		</form>
	</div>
</body>
<script src="js/jquery.min.js"></script>
<script type="text/javascript" src="./static/public/js/topjui.config.js"></script>
<script type="text/javascript" src="./topjui/js/topjui.core.min.js"></script>
<script type="text/javascript" src="./topjui/js/locale/topjui.lang.zh_CN.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/templatemo_script.js"></script>
<script src="js/menu.js"></script> <!--控制js-->
<script type="text/javascript">
    function logout() {
	    $.iMessager.confirm('提示', '确定要退出吗?', function (r) {
	        if (r) {
	            $.iMessager.progress({
	                text: '正在退出中...'
	            });
	            window.location.href = './login.jsp' + location.search;
	        }
	    });
	}

    /* 初始化时隐藏除默认下拉菜单的其他菜单 */
     $(document).ready(function(){
		$("#steelname").hide();
    }) 

	function selectType(){
    	var orderTypeName = $("#NAME").val();
    	if (orderTypeName == "steel_name"){
    		$("#date").hide();
		    $.ajax({
		  		 type : "post",
		   		 async : false, //同步执行
		  		 url : "searchSteelName.do",
		  		 /* data : transdata, */
		 		 //dataType : "json", //返回数据形式为json 
		 	     contentType: "application/x-www-form-urlencoded; charset=utf-8", 
		 	     //contentType: "application/json;charset=utf-8",
		 	     success : function(result) {
			 	    var option;  
		 		 	for (let index = 0; index < result.length; index++) {
		 		 		$("#selectAllSteelName").append("<option value='"+result[index]+"'>"+result[index]+"</option>");
		 		 		/* option += "<option value='"+result[index]+"'>"+result[index]+"</option>" */
		 		 	}
		 		 	$("#selectAllSteelName").html(option);
		 		 	$("#selectAllSteelName").show();
		   		 			
				 },
				 error : function(errorMsg) {
		   		 	alert("不好意思，数据请求数据失败啦!");
				 }
			})
    	}else if (orderTypeName == "produce_date") {
    		$("#selectAllSteelName").hide();
    		$("#date").show();
        }
    	
	}

	function select(){
		var orderTypeName = $("#NAME").val();
		if (orderTypeName == "produce_date")
			$.ajax({
				type : "post",
		   		async : false, //同步执行
		   		url:"searchProducePara",
		   		contentType: "application/x-www-form-urlencoded; charset=utf-8",
		   		success:function(result){
					
				}
			})
	}

   	
    
</script> 
<script>
        jQuery(function($){
                $("ul>li>a").click(function(){
                    $(this).next("ul").toggle().closest("li").siblings("li").children("ul").hide();
                }).next("ul").hide();
            });
        </script>

</html>