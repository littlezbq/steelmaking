<span style="font-size:12px;"><span style="font-size:12px;">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<!--显示查询结果页面：该页面用于显示生产参数数据条件查询的结果  -->
<!--每条查询结果前都可进行添加合金、添加渣料、添加成品成分、添加炉渣成分、修改生产参数和删除生产参数记录的操作  -->
<!-- 目前只做了修改生产参数和删除生产参数记录的按钮，未实现按钮的时间跳转及后端连接，需先完成此项工作 -->
<!--还需添加未做的几个按钮并实现其功能  -->
<!-- 做完上述工作后，需完善页面美观程度，优化用户体验。目前此方面存在问题：查询结果滚动效果较丑，需修改，增删改查页面还未嵌入菜单等 -->
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content='easyui,jui,jquery easyui,easyui demo,easyui中文'/>
    <title>查询结果</title>
    <!-- 浏览器标签图片 -->
    <link rel="shortcut icon" href="./topjui//images/favicon.jpg"/>
    <link rel="stylesheet" href="./static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="./static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="all" href="./static/plugins/bootstrap/css/daterangepicker-bs3.css" />
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="./res/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./res/bootstrap/3.3.7/js/moment.js"></script>
    <script type="text/javascript" src="./res/bootstrap/3.3.7/js/daterangepicker.js"></script>
    <script type="text/javascript" src="calendar/calendar.js"></script>
    <script type="text/javascript" src="calendar/WdatePicker.js"></script>
</head>
<body>

	<script type="text/javascript">
		if ("${info}" != '') {
			alert("${info}");
		}
	</script>
	<!-- 调用确认是否删除的js文件 -->
	<script type="text/javascript" src="./js/check_delete.js"></script>
	<script type="text/javascript">
		function url() {
			var r = confirm("是否要删除这条数据？");
			if (r == true) {
				return true;
			} else {
				return false;
			}
		}
	</script>
	
	
	<!-- 提示插入不能为空值 -->
	<script>
	function checkitems(){
		if(produceDate.value==""){
			alert("生产日期不能为空"); 
			return (false);
		}
		else if(furnaceNum.value==""){
			alert("炉次不能为空");
			return (false);
		}
		else if(classNo.value==""){
			alert("班别");
			return false;
		}
		else if(furnaceNo.value==""){
			alert("炉号");
			return false;
		}
		else if(furnaceAge.value==""){
			alert("炉龄");
			return false;
		}
		else if(steelName.value==""){
			alert("计划钢种名称");
			return false;
		}
		else if(ironC.value==""){
			alert("铁水成分碳含量");
			return false;
		}
		else if(ironSi.value==""){
			alert("铁水成分硅含量");
			return false;
		}
		else if(ironMn.value==""){
			alert("铁水成分锰含量");
			return false;
		}
		else if(ironP.value==""){
			alert("铁水成分磷含量");
			return false;
		}
		else if(ironS.value==""){
			alert("铁水成分硫含量");
			return false;
		}
		else if(ironWeight.value==""){
			alert("铁水装入量");
			return false;
		}
		else if(steelWeight.value==""){
			alert("钢水量");
			return false;
		}
		else if(proOxytime1.value==""){
			alert("冶炼时供氧时长");
			return false;
		}
		else if(proOxyval.value==""){
			alert("冶炼耗氧量");
			return false;
		}
		else if(turnNum.value==""){
			alert("倒炉次数");
			return false;
		}
		else if(turnC.value==""){
			alert("终点成分(一倒钢水成分)碳");
			return false;
		}
		else if(turnS.value==""){
			alert("终点成分(一倒钢水成分)硫");
			return false;
		}
		else if(turnP.value==""){
			alert("终点成分(一倒钢水成分)磷");
			return false;
		}
		else if(turnMn.value==""){
			alert("终点成分(一倒钢水成分)锰");
			return false;
		}
		
	}
	</script>

	

<%-- 	<jsp:include page="index.jsp" /> --%>
	<!-- 添加（录入）钢种成分面板 -->
	<div id="center" data-options="region:'center',border:false" style="overflow:hidden;">
			<div class="panel-heading" style="text-align: center;">
				<h4 style="font-weight: bolder;">
					添加信息 <h5>带*的为必填项</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					&nbsp;&nbsp;<a href="index.jsp" style="font-size: 15px;"> 返回</a>
				</h4>
			</div>
			<div class="panel-body">
			<form  id="form1" method="post" name="form1"  onsubmit= "return checkitems()">
				<table class="table table-bordered" style="width: 80%; margin: auto">
					<tr class="success">
						<th style="text-align: center; height: 15px">生产日期（*）</th>
						<th style="text-align: center; height: 15px">炉次（*）</th>
						<th style="text-align: center; height: 15px">班别（*）</th>
						<th style="text-align: center; height: 15px">炉号（*）</th>
						<th style="text-align: center; height: 15px">炉龄（*）</th>
						<th style="text-align: center; height: 15px">计划钢种名称（*）</th>
						<th style="text-align: center; height: 15px">氧枪枪龄（东枪枪龄）</th>
						<th style="text-align: center; height: 15px">氧枪枪龄（西枪枪龄）</th>
						<th style="text-align: center; height: 15px">氧枪模式</th>
						<th style="text-align: center; height: 15px">铁水成分碳含量（*）</th>
						<th style="text-align: center; height: 15px">铁水成分硅含量（*）</th>
						<th style="text-align: center; height: 15px">铁水成分锰含量（*）</th>
				
					</tr>
					<tbody>
						<tr align="center">
							<td style="height: 20px"><input type="date"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 150px; height: 30px"
								name="produceDate" id="produceDate"class="form-control" onclick="check();"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="furnaceNum" id="furnaceNum" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="classNo" id="classNo" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="furnaceNo" id="furnaceNo" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="furnaceAge" id="furnaceAge"class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="steelName" id="steelName" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="oxygun1" id="oxygun1" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="oxygun2" id="oxygun2" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="oxymode" id="oxymode" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironC" id="ironC" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironSi" id="ironSi" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="ironMn" id="ironMn" class="form-control"></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">铁水成分的磷含量（*）</th>
							<th style="text-align: center; height: 15px">铁水成分的硫含量（*）</th>
							<th style="text-align: center; height: 15px">铁水温度</th>
							<th style="text-align: center; height: 15px">出钢口龄</th>
							<th style="text-align: center; height: 15px">铁水装入量（*）</th>
							<th style="text-align: center; height: 15px">计量废钢装入量</th>
							<th style="text-align: center; height: 15px">自产废钢装入量</th>
							<th style="text-align: center; height: 15px">钢水量（*）</th>
							<th style="text-align: center; height: 15px">冶炼时供氧时长（*）</th>
							<th style="text-align: center; height: 15px">冶炼耗氧量（*）</th>
							<th style="text-align: center; height: 15px">倒炉次数（*）</th>	
							<th style="text-align: center; height: 15px">一倒温度</th>

						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironP" id = "ironP" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironS" id = "ironS" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironTemperature" id = "ironTemperature" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="outletAge" id = "outletAge" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironWeight" id="ironWeight" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="resteelWeight1" id="resteelWeight1" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="resteelWeight2" id="resteelWeight2" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="steelWeight" id = "steelWeight" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="proOxytime1" id="proOxytime1" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="proOxyval" id="proOxyval" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnNum" id="turnNum" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnTemperature1" id="turnTemperature1" class="form-control"></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">补吹时间</th>
							<th style="text-align: center; height: 15px">出钢温度</th>
							<th style="text-align: center; height: 15px">耗氮量</th>
							<th style="text-align: center; height: 15px">溅渣用时</th>
							<th style="text-align: center; height: 15px">调渣剂用量</th>
							<th style="text-align: center; height: 15px">终点成分(一倒钢水成分)碳（*）</th>
							<th style="text-align: center; height: 15px">终点成分(一倒钢水成分)硫（*）</th>
							<th style="text-align: center; height: 15px">终点成分(一倒钢水成分)磷（*）</th>
							<th style="text-align: center; height: 15px">终点成分(一倒钢水成分)锰（*）</th>
							<th style="text-align: center; height: 15px">钢水去向</th>
							<th style="text-align: center; height: 15px">兑铁（次）</th>
							<th style="text-align: center; height: 15px">备注</th>
						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="proOxytime2" id="proOxytime2" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnTemperature2" id="turnTemperature2" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="proNval" id="proNval" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="slagTime" id="slagTime" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="slagWeight" id="slagWeight" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnC" id="turnC" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnS" id="turnS" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnP" id="turnP" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnMn" id="turnMn" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelDir" id="steelDir" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelFe" id="steelFe" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelRemark" id="steelRemark" class="form-control"></td>
						</tr>
						<tr align="center">
							<td style="height: 20px"><button
									class="btn btn-primary btn-sm" type="submit" id = "submit" onclick="add()">
									提交 <i class="fa fa-plus" style="font-size: 15px;"></i>
								</button></td>
							<td><button class="btn btn-warning btn-sm" type="reset">
								重置<i class="fa fa-refresh" style="font-size: 15px;"></i>
							</button></td>
							<td><button class="btn btn-primary btn-sm" type="submit" id = "submit" onclick="update()" >
								更新<i class="fa fa-plus" style="font-size: 15px;"></i>
							</button></td>
						</tr>
					</tbody>
				</table>
				</form>
	</div>
	<div class="panel-body">
				
    <!-- 查询操作 -->
	<form action="searchsteel" method="post" name="form2" id="form2">
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			属性选择：<select id = "NAME" name="NAME"
				class="selectpicker show-tick form-control"
				style="font-size: 15px; text-align: center; display: inline; vertical-align: middle; width: 160px; height: 30px; border: none">
				<option value="class_no">按班次查询</option>
				<option value="furnace_num">按炉次查询</option>
				<option value="produce_date">按生产日期查询</option>
			<!--<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option> -->

			</select> 输入关键字：<input type="text"
				style="width: 50px; height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
				id="VALUE" name="VALUE">
			&nbsp;&nbsp;
			<button class="btn btn-success btn-sm" type="submit">
				<i class="fa fa-search" aria-hidden="true" ></i>查询
			</button>
		</div>
	</form>
	
	
	<!-- 删除操作 -->
<!-- 	<form action="deleteMaterials" method="post" name="form3" id="form3">
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			属性选择：<select id = "NAME" name="NAME"
				class="selectpicker show-tick form-control"
				style="font-size: 15px; text-align: center; display: inline; vertical-align: middle; width: 160px; height: 30px; border: none">
				<option value="class_no">按班次删除</option>
				<option value="furnace_num">按炉次删除</option>
				<option value="produce_date">按生产日期删除</option>
			<option value="4">4</option>
				<option value="5">5</option>
				<option value="6">6</option>
				<option value="7">7</option>
				<option value="8">8</option>
				<option value="9">9</option>
				<option value="10">10</option>
				<option value="11">11</option>
				<option value="12">12</option>

			</select> 输入关键字：<input type="text"
				style="width: 50px; height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
				id="VALUE" name="VALUE">
			&nbsp;&nbsp;
			<button class="btn btn-success btn-sm" type="submit">
				<i class="fa fa-search" aria-hidden="true" ></i>删除
			</button>
		</div>
	</form> -->
	<!-- 显示查询结果 -->
	<div class="panel-body" style="width=200px;height=400px;overflow-x:scroll;overflow-y:scroll">
			<table class="table table-bordered"
				style="border: 1px #CCCCCC solid; width: 80%; margin: auto">
				<!-- 查询结果表头 -->
				<thead>
					<tr class="success">
						<th colspan="56" style="text-align: center; height: 20px">钢种类别成分表
						</th>
					</tr>
					<tr>
						<th colspan="2" bgcolor="FFD700" style="text-align: center;">操作<br>方法
						</th>
						<th bgcolor="ADD8E6" style="text-align: center;">生产日期</th>
						<th bgcolor="ADD8E6" style="text-align: center;">炉次</th>
						<th bgcolor="ADD8E6" style="text-align: center;">班别</th>
						<th bgcolor="ADD8E6" style="text-align: center;">炉号</th>
						<th bgcolor="ADD8E6" style="text-align: center;">炉龄</th>
						<th bgcolor="ADD8E6" style="text-align: center;">计划钢种名称</th>
						<th bgcolor="ADD8E6" style="text-align: center;">氧枪枪龄（东枪枪龄）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">氧枪枪龄（西枪枪龄）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">氧枪模式</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水成分C%</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水成分Si%<</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水成分Mn%<</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水成分P%<</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水成分S%<</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水温度</th>
						<th bgcolor="ADD8E6" style="text-align: center;">出钢口龄</th>
						<th bgcolor="ADD8E6" style="text-align: center;">铁水装入量（T）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">计量废钢装入量（T）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">自产废钢装入量（T）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">钢水量（T）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">冶炼时供氧时长（min:ss）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">冶炼耗氧量（Nm2）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">倒炉次数</th>
						<th bgcolor="ADD8E6" style="text-align: center;">一倒温度（℃）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">补吹时间</th>
						<th bgcolor="ADD8E6" style="text-align: center;">出钢温度（℃）</th>
						<th bgcolor="ADD8E6" style="text-align: center;">耗氮量(Nm2)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">溅渣用时(分、秒)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">调渣剂用量(kg)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">终点成分C%</th>
						<th bgcolor="ADD8E6" style="text-align: center;">终点成分S%</th>
						<th bgcolor="ADD8E6" style="text-align: center;">终点成分P%</th>
						<th bgcolor="ADD8E6" style="text-align: center;">终点成分Mn%</th>
					    <th bgcolor="ADD8E6" style="text-align: center;">钢水<br>去向</th>
						<th bgcolor="ADD8E6" style="text-align: center;">兑铁<br>次数</th>
                        <th bgcolor="ADD8E6" style="text-align: center;">备注</th>
  				</tr>
				</thead>
				<!-- 获取后端参数并使用foreach语句循环显示每一列的值。一个td标签为一个单元格 -->
				<tbody>
					<c:forEach items="${requestScope.firstlist}" var="ProductParameter"
						varStatus="sta">
						<tr>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<a href="edit_granules.jsp?gran_id=9&amp;gran_date=2018-03-09">
									<!-- data-toggle="topjui-menubutton"   data-toggle="topjui-menubutton" -->
									<i class="fa fa-pencil box" style="color: SteelBlue"></i>
							</a>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<a onclick="return url()" id="deleteConfirmation"
								data-msg="提示：删除后无法恢复！确认是否删除？"
								href="delete_granules.jsp?gran_id=9&amp;gran_date=2018-03-09">
									<i class="fa fa-trash-o box" style="color: Tomato"></i>
							</a>
							</td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.produceDate}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceNum}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.classNo}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceNo}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceAge}' />&nbsp;
								</font>
							</font></td>
							
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelName}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxygun1}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxygun2}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxymode}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironC}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironSi}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironMn}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironP}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironS}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF" style="text-align: center;height:20px;width: 100px;border: #CCCCCC 1px solid;">
							<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironTemperature}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.outletAge}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironWeight}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.resteelWeight1}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.resteelWeight2}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxytime1}' />&nbsp;
								</font>
							</font></td>
							
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxyval}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnNum}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnTemperature1}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxytime2}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnTemperature2}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proNval}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.slagTime}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.slagWeight}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnC}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnC}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnS}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnP}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnMn}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelDir}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelFe}' />&nbsp;
								</font>
							</font></td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelRemark}' />&nbsp;
								</font>
							</font></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
</div>
</div>
<!-- 添加和更新分辨跳转的函数 -->
	<script type="text/javascript">
		function update(){
			form1.action = "updateMaterial";
			document.form1.submit();
		}
		function add(){
			form1.action = "addmaterial";
			document.form1.submit();
		}
	</script>
	
	<!-- 插入记录：ajax提交表单 -->
	<!-- <script type="text/javascript">
		function sendForm1(){
			$.ajax({
				type:"POST",
				/* dataType:"json",  */
				async:true,
				/* contentType: "application/json; charset=UTF-8",  */
				url:"addmaterial",//请求函数
				data:$("#form1").serialize()
				success:function(result){
					if(result){
						alert("添加成功！");
					}
					else
						alert("添加失败！");
				},
				error:function(){
					alert("异常");
				}
			
			})
		}
	</script> -->
	
	<!-- 更新记录：ajax提交表单 -->
<!-- 	<script type="text/javascript">
		function sendForm2(){
			$.ajax({
				type:"POST",
				/* dataType:"json",  */
				async:true,
				/* contentType: "application/json; charset=UTF-8",  */
				url:"updateMaterial",//请求函数
				data:$("#form1").serialize()
				success:function(result){
					if(result){
						alert("更新成功！");
					}
					else
						alert("更新失败");
				},
				error:function(){
					alert("异常！");
				}
			})
		}
	</script> -->
	
	
	
	
	
	
	<!-- <script type="text/javascript">
		function sendParm(){
			$ajax({
				type:"post",
				async:true,
				url:"searchsteel",
				data:{'NAME':NAME,'VALUE='+encodeURI(encodeURI(VALUE))},
				success:function(result){
					if(result){
						alert("success");
						window.location.href = "searchsteel";
					}
					
				},
				error:function(){
					alert("异常");
				}
				
			})	
		}
	</script> -->
	
	<script type="text/javascript">
  $(document).ready(function() {
    $('#hls_date').daterangepicker({ singleDatePicker: true }, function(start, end, label) {
    console.log(start.toISOString(), end.toISOString(), label);
    });
  });
</script>

	<script type="text/javascript">
$(function () { 
    $('input:text:first').focus(); //获取第一个焦点
    var $inp = $('input:text'); //定义全部焦点
    $inp.bind('keydown', function (e) {// 绑定事件
        var key = e.which;//定义按键
        if (key == 13) {//回车事件
            e.preventDefault();
            var nxtIdx = $inp.index(this) + 1;
            $(":input:text:eq(" + nxtIdx + ")").focus();
            if(nxtIdx==3){
                $('textarea').focus();
            }
        }
    });
});

</script>
</body>
</html>
</span>
<span style="font-size:24px;color: rgb(255, 0, 0);">
</span>
</span>
