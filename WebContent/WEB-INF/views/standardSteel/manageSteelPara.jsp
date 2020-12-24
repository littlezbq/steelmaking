<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%-- <%
    pageContext.setAttribute("BasePath", request.getContextPath());
    %> --%>
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
<body>
    <div class="navbar navbar-light" style="background-color:#6495ED;" role="navigation">               
      <div style="float:left;margin-left:10px;display:inline; "><h2 style="color:#F8F8FF;font-weight: bold;"><img alt="" src="images/jian.png" style="height:60px"></h2></div>
     <div style="padding-top:20px;float:right;padding-right:20px;"> <a href="javascript:void(0)" onclick="logout()" data-toggle="topjui-menubutton"  style="text-decoration:none;color:#fff;"><i class="fa fa-sign-out" ></i>注销</a></div>       
    </div>
    
 <div id="menu"><!--隐藏菜单-->
    <div id="ensconce">
        <h2>
            <img src="images/show.png" alt="">
            导航菜单
        </h2>
    </div>
       
    <div id="open"><!--显示菜单-->
        <div class="navH">
            导航菜单
            <span><img class="obscure" src="images/obscure.png" alt=""></span>
        </div>
        <div class="navBox">
            <ul>                
                 <li>
                    <h2 class="obtain"><a style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">生产数据管理</a><i></i></h2>
                    <div class="secondary">
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#d9d919;"href="manageProducePara"><i class="fa fa-hand-o-right"></i>生产参数数据管理</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#d9d919;"href="proAlloy.jsp"><i class="fa fa-hand-o-right"></i>生产用合金数据管理</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#d9d919;"href="proAccessory.jsp"><i class="fa fa-hand-o-right"></i>生产用渣料数据管理</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#d9d919;"href="proSteel.jsp"><i class="fa fa-hand-o-right"></i>成品成分数据管理</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#d9d919;"href="proDreg.jsp"><i class="fa fa-hand-o-right"></i>炉渣成分数据管理</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain"><a style="text-decoration:none;font-size:17px;color:#F0FFF0;font-weight: bold;">辅助材料管理</a><i></i></h2>
                    <div class="secondary">
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="manageSteelPara"><i class="fa fa-hand-o-right"></i> 钢种数据管理&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="alloy.jsp"><i class="fa fa-hand-o-right"></i> 合金数据管理</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="accessory.jsp"><i class="fa fa-hand-o-right"></i> 渣料数据管理</a></h3>
                    </div>             
                </li> 
                <li>
                    <h2 class="obtain"><a style="text-decoration:none;font-size:17px;color:#F0FFF0;font-weight: bold;">数据统计分析</a><i></i></h2>
                    <div class="secondary">
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="showstatistics"><i class="fa fa-hand-o-right"></i>成品成分数据统计分析&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="statistics_output.jsp"><i class="fa fa-hand-o-right"></i> 输出产物数据统计分析</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="statistics_frequency.jsp"><i class="fa fa-hand-o-right"></i> 生产指标频率分布&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="statistics_report.jsp"><i class="fa fa-hand-o-right"></i> 报表生成&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a></h3>
                    </div>
                </li>
                <li>
                    <h2 class="obtain"><a href="index.jsp" style="text-decoration:none;font-size:17px;color:#F0FFF0;font-weight: bold;">生产效益测算</a></h2>
                </li>
                <li>
                    <h2 class="obtain"><a style="text-decoration:none;font-size:17px;color:#F0FFF0;font-weight: bold;">冶炼数据预测</a><i></i></h2>
                    <div class="secondary">
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="predictSteel"><i class="fa fa-hand-o-right"></i> 数据预测</a></h3>
<!--                         <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="predict_reduction.jsp"><i class="fa fa-hand-o-right"></i> 还原炉数据预测</a></h3> -->
                    </div>
                </li>
                <li>
                    <h2 class="obtain"><a style="text-decoration:none;font-size:17px;color:#F0FFF0;font-weight: bold;">冶炼回归模型训练</a><i></i></h2>
                    <div class="secondary">
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="model_bottom.jsp"><i class="fa fa-hand-o-right"></i> 底吹炉模型训练</a></h3>
                        <h3><a style="text-decoration:none;font-size:15px;;font-weight: bold;color:#F0FFF0;"href="model_reduction.jsp"><i class="fa fa-hand-o-right"></i> 还原炉模型训练</a></h3>
                    </div>
                </li>                                
            </ul>
        </div>
    </div>
</div>

<!-- 
	<div id="center" data-options="region:'center',border:false"
		style="overflow: hidden;">
		<ol class="breadcrumb">
			<li><a href="showsteel">钢种成分</a>
			<li>
			<li><a href="showalloy">合金成分</a>
			<li>
			<li><a href="showdreg">渣料成分</a>
			<li>
		</ol>
	</div> -->
	
	<div class="panel-body">
		<!--添加钢种参数按钮  -->
		<form action="addSteelParaPage" method="post" name="form1"
			id="form1">
			<button class="btn btn-primary btn-sm" type="submit" id="submit">
				添加钢种参数<i class="fa fa-plus" style="font-size: 15px;"></i>
			</button>
		</form>
		<!-- 查询操作 -->
		<form action="searchProducePara" method="post" name="form2" id="form2">
			<div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<!-- 	属性选择：<select id="NAME" name="NAME"
					class="selectpicker show-tick form-control"
					style="font-size: 15px; text-align: center; display: inline; vertical-align: middle; width: 160px; height: 30px; border: none">
					<option value="class_no">按班次查询</option>
					<option value="furnace_num">按炉次查询</option>
					<option value="produce_date">按生产日期查询</option>
					<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option> -->

				</select> 输入钢种名称：<input type="text"
					style="width: 50px; height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
					id="VALUE" name="VALUE"> &nbsp;&nbsp;
				<button class="btn btn-success btn-sm" type="submit">
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
</script> 
<script>
        jQuery(function($){
                $("ul>li>a").click(function(){
                    $(this).next("ul").toggle().closest("li").siblings("li").children("ul").hide();
                }).next("ul").hide();
            });
        </script>

</html>