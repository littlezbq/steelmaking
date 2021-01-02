<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<!-- <span style="font-size:12px;"><span style="font-size:12px;"> -->
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    <%    pageContext.setAttribute("BasePath", request.getContextPath());    %>
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
<!--     <script type="text/javascript" src="calendar/calendar.js"></script>
    <script type="text/javascript" src="calendar/WdatePicker.js"></script> -->
    
    
</head>
<body>
	<script type="text/javascript">
		if ("${info}" != '') {
			alert("${info}");
		}
	</script>
	<!-- 调用确认是否删除的js文件 -->
	<!-- <script type="text/javascript" src="./js/check_delete.js"></script> -->
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
	
	

	

	
<jsp:include page="manageProducePara.jsp" />
		<!-- 显示查询结果 -->
		<div class="panel-body"  style="width:auto;height:987px;overflow-x:scroll;overflow-y:scroll">
			<table class="table table-bordered"
				style="border: 1px #CCCCCC solid; width: 80%; margin: auto">
				<!-- 查询结果表头 -->
				<thead>
					<tr class="success">
						<th colspan="56" style="text-align: center; height: 20px">生产参数数据表
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
						<th bgcolor="ADD8E6" style="text-align: center;">钢水<br>去向
						</th>
						<th bgcolor="ADD8E6" style="text-align: center;">兑铁<br>次数
						</th>
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
								<a href="updateProduceParaPage/${ProductParameter.produceDate}&${ProductParameter.furnaceNum}"> 
									<i class="fa fa-pencil box" style="color: SteelBlue"></i>
							</a>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<a onclick="return url()"								
								href="deleteProduceParaPage/${ProductParameter.produceDate}&${ProductParameter.furnaceNum}">
									<i class="fa fa-trash-o box" style="color: Tomato"></i>
							</a>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <fmt:formatDate
											type="date" pattern="y-M-d"
											value='${ProductParameter.produceDate}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceNum}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.classNo}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceNo}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.furnaceAge}' />&nbsp;
								</font>
							</font>
							</td>

							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelName}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxygun1}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxygun2}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.oxymode}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironC}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironSi}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironMn}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironP}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironS}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; width: 100px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironTemperature}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.outletAge}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.ironWeight}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.resteelWeight1}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.resteelWeight2}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxytime1}' />&nbsp;
								</font>
							</font>
							</td>

							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxyval}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnNum}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnTemperature1}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proOxytime2}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnTemperature2}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.proNval}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.slagTime}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.slagWeight}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnC}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnC}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnS}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnP}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.turnMn}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelDir}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="F8F8FF"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelFe}' />&nbsp;
								</font>
							</font>
							</td>
							<td bgcolor="E6E6FA"
								style="text-align: center; height: 20px; border: #CCCCCC 1px solid;">
								<font style="vertical-align: inherit;"> <font
									style="vertical-align: inherit;"> <c:out
											value='${ProductParameter.steelRemark}' />&nbsp;
								</font>
							</font>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<!--显示分页信息-->

		<div class="modal-footer no-margin-top" style="display:inline;">

			<div class="col-md-6" style="font-size:15px">当前第 [${requestScope.pageNum}]页,共
				[${requestScope.finalPage}] 页.一共 [${requestScope.sum}]条记录,上一页[${requestScope.prePage}],下一页[${requestScope.nextPage}]
			</div>
			<div style="display:inline;">
			<ul  style="margin-left:-290px;" class="pagination pull-left no-margin" >
				<li style="float:left;" class="prev" >
					<form id="form1" action="${requestScope.selectType}" method="post">
						<button type="submit"  class="btn btn-default" id="pageNum" name="pageNum" value=1 >首页</button>
					</form>
						
				</li>
				<li class="prev" >
					<form id="form1" style="float:left;" action="${requestScope.selectType}" method="post">
						<button type="submit"  class="btn btn-default" id="pageNum" name="pageNum" value=${requestScope.prePage} >上一页</button>
					</form>
				</li>
				<li class="next" >
					<form id="form1" style="float:left;" action="${requestScope.selectType}" method="post">
						<button type="submit"  class="btn btn-default" id="pageNum" name="pageNum" value=${requestScope.nextPage} >下一页</button>
					</form>
				</li>
				<li>
					<form id="form1" style="float:left;" action="${requestScope.selectType}" method="post">
						<button type="submit"  class="btn btn-default" id="pageNum" name="pageNum" value=${requestScope.finalPage} >尾页</button>
					</form>
				</li>

			</ul>
		</div>

<script type="text/javascript">
	function jump(){
		form1.action = "searchProduceParaByTime";
		document.form1.submit();
	}
</script>
	
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
