<!DOCTYPE html>
<html>
<!-- <span style="font-size:12px;"><span style="font-size:12px;"> -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%
    pageContext.setAttribute("BasePath", request.getContextPath());
    %>
    <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content='easyui,jui,jquery easyui,easyui demo,easyui中文'/>
    <title>转炉炼钢</title>
    <!-- 浏览器标签图片 -->
    <link rel="shortcut icon" href="${BasePath}/topjui//images/favicon.jpg"/>
    <link rel="stylesheet" href="${BasePath}/static/plugins/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${BasePath}/static/plugins/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" media="all" href="${BasePath}/static/plugins/bootstrap/css/daterangepicker-bs3.css" />
    <script src="https://cdn.bootcss.com/jquery/2.1.1/jquery.min.js"></script>
    <script src="${BasePath}/res/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${BasePath}/res/bootstrap/3.3.7/js/moment.js"></script>
    <script type="text/javascript" src="${BasePath}/res/bootstrap/3.3.7/js/daterangepicker.js"></script>
    <script type="text/javascript" src="${BasePath}/calendar/calendar.js"></script>
    <script type="text/javascript" src="${BasePath}/calendar/WdatePicker.js"></script>
</head>
<body>






<%-- 	<jsp:include page="include.jsp" /> --%>
	<!--修改生产参数面板 -->
	<div id="center" data-options="region:'center',border:false" style="overflow:hidden;">
			<div class="panel-heading" style="text-align: center;">
				<h4 style="font-weight: bolder;">
					修改信息 <h5>带*的为必填项</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					&nbsp;&nbsp;<a  class = "btn btn-primary btn-sm" href="${BasePath}/manageProducePara" style="font-size: 15px;" > 返回</a>
				</h4>
			</div>
			<div class="panel-body">
			<form action="${BasePath}/updateProducePara" id="form1" method="post" name="form1">
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
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 150px; height: 30px"
								name="produceDate" id="produceDate"class="form-control" readonly="readonly" value="<fmt:formatDate value="${old_productPara.produceDate}" pattern="yyyy-MM-dd"/>" /></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="furnaceNum" id="furnaceNum" class="form-control" readonly="readonly" value='${old_productPara.furnaceNum}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="classNo" id="classNo" class="form-control" value='${old_productPara.classNo}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="furnaceNo" id="furnaceNo" class="form-control" value='${old_productPara.furnaceNo}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="furnaceAge" id="furnaceAge"class="form-control" value='${old_productPara.furnaceAge}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="steelName" id="steelName" class="form-control" value='${old_productPara.steelName}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="oxygun1" id="oxygun1" class="form-control" value='${old_productPara.oxygun1}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="oxygun2" id="oxygun2" class="form-control" value='${old_productPara.oxygun2}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="oxymode" id="oxymode" class="form-control" value='${old_productPara.oxymode}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironC" id="ironC" class="form-control" value='${old_productPara.ironC}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironSi" id="ironSi" class="form-control" value='${old_productPara.ironSi}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="ironMn" id="ironMn" class="form-control" value='${old_productPara.ironMn}'></td>
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
								name="ironP" id = "ironP" class="form-control" value='${old_productPara.ironP}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironS" id = "ironS" class="form-control" value='${old_productPara.ironS}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironTemperature" id = "ironTemperature" class="form-control" value='${old_productPara.ironTemperature}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="outletAge" id = "outletAge" class="form-control" value='${old_productPara.outletAge}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ironWeight" id="ironWeight" class="form-control" value='${old_productPara.ironWeight}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="resteelWeight1" id="resteelWeight1" class="form-control" value='${old_productPara.resteelWeight1}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="resteelWeight2" id="resteelWeight2" class="form-control" value='${old_productPara.resteelWeight2}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="steelWeight" id = "steelWeight" class="form-control" value='${old_productPara.steelWeight}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="proOxytime1" id="proOxytime1" class="form-control" value='${old_productPara.proOxytime1}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="proOxyval" id="proOxyval" class="form-control" value='${old_productPara.proOxyval}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnNum" id="turnNum" class="form-control" value='${old_productPara.turnNum}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnTemperature1" id="turnTemperature1" class="form-control" value='${old_productPara.turnTemperature1}'></td>
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
								name="proOxytime2" id="proOxytime2" class="form-control" value='${old_productPara.proOxytime2}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnTemperature2" id="turnTemperature2" class="form-control" value='${old_productPara.turnTemperature2}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="proNval" id="proNval" class="form-control" value='${old_productPara.proNval}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="slagTime" id="slagTime" class="form-control" value='${old_productPara.slagTime}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="slagWeight" id="slagWeight" class="form-control" value='${old_productPara.slagWeight}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="turnC" id="turnC" class="form-control" value='${old_productPara.turnC}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnS" id="turnS" class="form-control" value='${old_productPara.turnS}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnP" id="turnP" class="form-control" value='${old_productPara.turnP}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="turnMn" id="turnMn" class="form-control" value='${old_productPara.turnMn}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelDir" id="steelDir" class="form-control" value='${old_productPara.steelDir}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelFe" id="steelFe" class="form-control" value='${old_productPara.steelFe}'></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="steelRemark" id="steelRemark" class="form-control" value='${old_productPara.steelRemark}'></td>
						</tr>
						<tr align="center">
							<td style="height: 20px"><button
									class="btn btn-primary btn-sm" type="submit" id = "submit" >
									提交 <i class="fa fa-plus" style="font-size: 15px;"></i>
								</button></td>
								<!-- onclick="update()" -->
							<td><button class="btn btn-warning btn-sm" type="reset">
								重置<i class="fa fa-refresh" style="font-size: 15px;"></i>
							</button></td>
							<!-- <td><button class="btn btn-primary btn-sm" type="submit" id = "submit" onclick="update()" >
								更新<i class="fa fa-plus" style="font-size: 15px;"></i>
							</button></td> -->
						</tr>
					</tbody>
				</table>
				</form>
	</div>
</div>	
	<!-- 添加和更新分辨跳转的函数 -->
	<script type="text/javascript">
		function update(){
			form1.action = "${BasePath}/updateProducePara";
			document.form1.submit();
		}
		function add(){
			form1.action = "addmaterial";
			document.form1.submit();
		}
	</script>
	
</body>
</html>