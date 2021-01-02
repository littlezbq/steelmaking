<span style="font-size:12px;"><span style="font-size:12px;">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"
    
%>
<%
    pageContext.setAttribute("BasePath", request.getContextPath());
    %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <!-- 避免IE使用兼容模式 -->
    <meta http-equiv="X-UA-Compatible" content="IE=edge, chrome=1">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content='easyui,jui,jquery easyui,easyui demo,easyui中文'/>
    <title>转炉炼钢</title>
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
	
	<script type="text/javascript">
	function GMTToStr(time){
	    var date = new Date(time)
	    /* var Str=date.getFullYear() + '-' +
	    (date.getMonth() + 1) + '-' +
	    date.getDate() + ' ' */
	    return date;
	} 
	

	function check(){
		/* 获取当前时间 */
		var dateNow = new Date();
		dateNow = dateNow.toLocaleDateString().split('/').join('-');
		dateNow = new Date(Date.parse(dateNow));
		var dateChoose = GMTToStr(produceDate.value);
		
		if (dateChoose > dateNow){
			alert("请输入合适的生产日期");
			return false;	
		}
		if(produceDate.value == ""){
			alert("生产日期不能为空");
			return false;
		}
		if(furnaceNum.value.length > 10){
			alert("炉次编号需小于10位");
			return false;
		}
		if(furnaceNum.value==""){
			alert("炉次不能为空");
			return (false);
		}
		/* if(classNo.value){
			alert("班别");
			return false;
		} */
		if(furnaceNo.value.length > 2){
			alert("炉号需小于2位");
			return false;
		}
		if(furnaceNo.value==""){
			alert("炉号不能为空");
			return false;
		}
		if(furnaceAge.value.length > 8){
			alert("炉龄需小于8位");
			return false;
		}
		if(furnaceAge.value==""){
			alert("炉龄不能为空");
			return false;
		}
		if(steelName.value.length > 15){
			alert("钢种名称需小于15位");
			return false;
		}
		if(steelName.value==""){
			alert("钢种名称不能为空");
			return false;
		}
		if (oxygun1.value != ""){
			if(Number.isInteger(Number(oxygun1.value)) == false){
				alert("氧枪枪龄需为整数");
				return false;
			}	
		}
		
		if (oxygun2.value != ""){
			if(Number.isInteger(Number(oxygun2.value)) == false){
				alert("氧枪枪龄需为整数");
				return false;
			}	
		}
		if(oxymode.value != ""){
			if (oxymode.value <=0 || oxymode.value >=100){
				alert("请重新选择氧枪模式");
				return false;
			}
		}
		if(ironC.value != ""){
			if(ironC.value <= 0 || ironC.value >=100 ){
				alert("请输入合理的铁水成分碳含量");
				return false;
			}	
		}
		if(ironC.value==""){
			alert("铁水成分碳含量不能为空");
			return false;
		}
		if (ironSi.value != ""){
			if(ironSi.value <= 0 || ironSi.value >=100){
				alert("请输入合理正确的铁水成分硅含量");
				return false;
			}
		}
		if(ironSi.value==""){
			alert("铁水成分硅含量");
			return false;
		}
		
		if(ironMn.value != ""){
			if(ironMn.value <= 0 || ironMn.value >=100){
				alert("请输入合理的铁水成分锰含量");
				return false;
			}	
		}
		if(ironMn.value==""){
			alert("铁水成分锰含量不能为空");
			return false;
		}
		if(ironP.value != ""){
			if(ironP.value <= 0 || ironP.value >=100){
				alert("请输入合理的铁水成分磷含量");
				return false;
			}	
		}
		if(ironP.value==""){
			alert("铁水成分磷含量不能为空");
			return false;
		}

		if(ironS.value != ""){
			if(ironS.value <= 0 || ironS.value >=100){
				alert("请输入正确的铁水成分硫含量");
				return false;
			}	
		}
		if(ironS.value==""){
			alert("铁水成分硫含量不能为空");
			return false;
		}

		if(ironTemperature.value != ""){
			if(ironTemperature.value.length > 5){
				alert("请输入合理的铁水温度");
				return false;
			}	
		}

		if (outletAge.value != ""){
			if(Number.isInteger(Number(outletAge.value)) == false){
				alert("出口钢龄需为整数");
				return false;
			}	
		}

		if (ironWeight.value != ""){
			if(ironWeight.value < 0 || ironWeight.value > 1000){
				alert("请输入正确的铁水装入量");
				return false;
			}	
		}
		if(ironWeight.value==""){
			alert("铁水装入量不能为空");
			return false;
		}

		if (resteelWeight1.value != ""){
			if(resteelWeight1.value < 0 || resteelWeight1.value > 1000){
				alert("请输入正确的计量废钢装入量");
				return false;
			}	
		}

		if(resteelWeight2.value != ""){
			if(resteelWeight2.value < 0 || resteelWeight2.value > 1000){
				alert("请输入正确的自产废钢装入量");
				return false;
			}	
		}

		if(steelWeight.value !=""){
			if(steelWeight.value < 0 || steelWeight.value > 1000){
				alert("请输入合理的钢水量");
				return false;
			}	
		}
		if(steelWeight.value==""){
			alert("钢水量不能为空");
			return false;
		}
		
		if(proOxytime1.value==""){
			alert("冶炼时供氧时长不能为空");
			return false;
		}

		if(proOxyval.value !=""){
			if(Number.isInteger(Number(proOxyval.value)) == false){
				alert("冶炼耗氧量需为整数");
				return false;
			}	
		}
		if(proOxyval.value==""){
			alert("冶炼耗氧量不能为空");
			return false;
		}

		if(turnNum.value !=""){
			if(Number.isInteger(Number(turnNum.value)) == false){
				alert("倒炉次数需为整数");
				return false;
			}	
		}
		if(turnNum.value==""){
			alert("倒炉次数不能为空");
			return false;
		}

		if(turnTemperature1.value != ""){
			if(Number.isInteger(Number(turnTemperature1.value)) == false){
				alert("一倒温度需为整数");
				return false;
			}	
		}
		
		if(turnTemperature2.value != ""){
			if(turnTemperature2.value.length > 5){
				alert("请输入合适的出钢温度");
				return false;
			}	
		}

		if(proNval.value != ""){
			if(proNval.value.length > 5){
				alert("请输入合适的耗氮量");
				return false;
			}	
		}

		if(slagWeight.value != ""){
			if(Number.isInteger(Number(slagWeight.value)) == false){
				alert("调渣剂用量需为整数");
				return false;
			}	
		}
		
		if(turnC.value != ""){
			if(turnC.value < 0 || turnC.value > 100){
				alert("请输入合理的终点成分(一倒钢水成分)碳");
				return false;
			}	
		}
		if(turnC.value==""){
			alert("终点成分(一倒钢水成分)碳不能为空");
			return false;
		}

		if(turnS.value != ""){
			if(turnS.value < 0 || turnS.value > 100){
				alert("请输入合理的终点成分(一倒钢水成分)硫");
				return false;
			}	
		}
		if(turnS.value==""){
			alert("终点成分(一倒钢水成分)硫不能为空");
			return false;
		}

		if(turnP.value != ""){
			if(turnP.value < 0 || turnP.value > 100){
				alert("请输入合理的终点成分(一倒钢水成分)磷");
				return false;
			}	
		}
		if(turnP.value==""){
			alert("终点成分(一倒钢水成分)磷不能为空");
			return false;
		}

		if(turnMn.value != ""){
			if(turnMn.value < 0 || turnMn.value > 100){
				alert("请输入合理的终点成分(一倒钢水成分)锰");
				return false;
			}	
		}
		if(turnMn.value==""){
			alert("终点成分(一倒钢水成分)锰不能为空");
			return false;
		}

		/* else{
			alert("添加成功");
			return true;
		} */
		else{
			return true;
		}
		
	}
	</script>
	
 	<jsp:include page="include.jsp" />
	<!-- 添加（录入）钢种成分面板 -->
	<div id="center" data-options="region:'center',border:false" style="overflow:hidden;">
			<div class="panel-heading" style="text-align: center;">
				<h4 style="font-weight: bolder;">
					添加信息 <h5>带*的为必填项</h5>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					&nbsp;&nbsp;<a  class = "btn btn-primary btn-sm" href="${BasePath}/manageProducePara" style="font-size: 15px;" > 返回</a>
				</h4>
			</div>
			<div class="panel-body">
			<form  id="form1" method="post" name="form1"  onsubmit= "return check()">
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
								name="produceDate" id="produceDate"class="form-control" ></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="furnaceNum" id="furnaceNum" class="form-control"></td>
							<td style="height: 20px"><!-- <input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="classNo" id="classNo" class="form-control"> -->
								<select id="classNo" name="classNo" style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"> 
									<option value="甲" >甲</option>
									<option value="乙" >乙</option>
									<option value="丙" >丙</option>
								</select>
							</td>
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
									class="btn btn-primary btn-sm" type="button"  onclick="sendForm1()">
									提交 <i class="fa fa-plus" style="font-size: 15px;"></i>
								</button></td>
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
	<div class="panel-body">
				

</div>
<!-- 添加和更新分辨跳转的函数 -->
	<script type="text/javascript">
		function update(){
			form1.action = "updateMaterial";
			document.form1.submit();
		}
		function add(){
			form1.action = "addProducePara";
			document.form1.submit();
		}
	</script>
	
	<!-- 插入记录：ajax提交表单 -->
	<script type="text/javascript">
		function sendForm1(){
			if(check()){
				$.ajax({
					type:"POST",
				 	/* dataType:"json",  */
					async:false, 
					contentType: "application/x-www-form-urlencoded; charset=utf-8",
					url:"addProducePara",//请求函数
					/* data:JSON.stringify(form1), */
					data:$("#form1").serialize(),
					success:function(data){
							alert(data);
							window.location.href="manageProducePara";
							
					},
					error:function(XMLHttpRequest, textStatus, errorThrown){
						// 状态码
						alert(XMLHttpRequest.status);	                    	
	                    // 状态 
	                    alert(XMLHttpRequest.readyState); 
	                    // 错误信息
	                    alert(textStatus); 
					}
				
				})
			}
		}
	</script>
	
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
