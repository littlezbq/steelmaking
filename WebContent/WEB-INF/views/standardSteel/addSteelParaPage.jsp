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
		
		if(steelName.value.length > 15){
			alert("钢种名称需小于15位");
			return false;
		}
		if(steelName.value==""){
			alert("钢种名称不能为空");
			return false;
		}
		if(c.value.length > 1){
			alert("碳含量需小于1位");
			return false;
		}
		
		if(si.value.length > 1){
			alert("硅含量需小于1位");
			return false;
		}	
		
		if(mn.value.length > 1){
			alert("锰含量需小于1位");
			return false;
		}
			
		if(p.value.length > 1){
			alert("磷含量需小于1位");
			return false;
		}	
			
		if(s.value.length > 1){
			alert("硫硅含量需小于1位");
			return false;
		}	
			
		if(als.value.length > 1){
			alert("酸溶铝硅含量需小于1位");
			return false;
		}	
			
		if(cu.value.length > 1){
			alert("铜硅含量需小于1位");
			return false;
		}	
			
		if(ni.value.length > 1){
			alert("镍含量需小于1位");
			return false;
		}	
			
		if(cr.value.length > 1){
			alert("铬含量需小于1位");
			return false;
		}	
			
		if(v.value.length > 1){
			alert("钒含量需小于1位");
			return false;
		}	
			
		if(ti.value.length > 1){
			alert("钛含量需小于1位");
			return false;
		}	
			
		if(nb.value.length > 1){
			alert("鈮含量需小于1位");
			return false;
		}	

		if(as.value.length > 1){
			alert("砷含量需小于1位");
			return false;
		}	
			
			
		if(sn.value.length > 1){
			alert("锡含量需小于1位");
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
					
					&nbsp;&nbsp;<a  class = "btn btn-primary btn-sm" href="${BasePath}/manageSteelPara" style="font-size: 15px;" > 返回</a>
				</h4>
			</div>
			<div class="panel-body">
			<form  id="form1" method="post" name="form1"  onsubmit= "return check()">
				<table class="table table-bordered" style="width: 80%; margin: auto">
					<tr class="success">
						<th style="text-align: center; height: 15px">钢种名称（*）</th>
						<th style="text-align: center; height: 15px">碳含量</th>
						<th style="text-align: center; height: 15px">硅含量</th>
						<th style="text-align: center; height: 15px">锰含量</th>
						<th style="text-align: center; height: 15px">磷含量</th>
						<th style="text-align: center; height: 15px">硫含量</th>

				
					</tr>
					<tbody>
						<tr align="center">
							<td style="height: 20px"><input type="date"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 150px; height: 30px"
								name="steelName" id="steelName"class="form-control" ></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="c" id="c" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="si" id="si" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="mn" id="mn"class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="p" id="p" class="form-control"></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">硫含量</th>
							<th style="text-align: center; height: 15px">酸溶铝含量</th>
							<th style="text-align: center; height: 15px">铜含量</th>
							<th style="text-align: center; height: 15px">镍含量</th>
							<th style="text-align: center; height: 15px">铬含量</th>

						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="s" id = "s" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="als" id = "als" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="cu" id = "cu" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ni" id = "ni" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="cr" id="cr" class="form-control"></td>

						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">钒含量</th>
							<th style="text-align: center; height: 15px">钛含量</th>
							<th style="text-align: center; height: 15px">鈮含量</th>
							<th style="text-align: center; height: 15px">砷含量</th>
							<th style="text-align: center; height: 15px">锡含量</th>
						
						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="v" id="v" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="ti" id="ti" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="nb" id="nb" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="as" id="as" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="sn" id="sn" class="form-control"></td>

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
				
	<!-- 查询操作 -->
	<!-- <form action="searchProducePara" method="post" name="form2" id="form2">
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			属性选择：<select id = "NAME" name="NAME"
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
				<option value="12">12</option>

			</select> 输入关键字：<input type="text"
				style="width: 50px; height: 25px; font-size: 13px; border: #CCCCCC 1px solid;"
				id="VALUE" name="VALUE">
			&nbsp;&nbsp;
			<button class="btn btn-success btn-sm" type="submit">
				<i class="fa fa-search" aria-hidden="true" ></i>查询
			</button>
		</div>
	</form> -->
	
	
	<!-- 删除操作 -->
	<!-- <form action="deleteMaterials" method="post" name="form3" id="form3">
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
	
			<!-- <table class="table table-bordered"
				style="border: 1px #CCCCCC solid; width: 80%; margin: auto">
				<thead>
					<tr class="success">
						<th colspan="56" style="text-align: center; height: 20px">钢种类别成分表
						</th>
					</tr>
					<tr>
						<th colspan="2" bgcolor="FFD700" style="text-align: center;">操作<br>方法
						</th>
						<th bgcolor="ADD8E6" style="text-align: center;">班别</th>
						<th bgcolor="ADD8E6" style="text-align: center;">炉次</th>
						<th bgcolor="ADD8E6" style="text-align: center;">炉龄</th>
						<th bgcolor="ADD8E6" style="text-align: center;">C(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Si(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Mn(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">P(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">S(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Al(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">AlS(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Cu(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Ni(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Cr(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">V(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Ti(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Nb(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">N(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">O(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Mo(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">W(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">As(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">B(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Sn(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Sb(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">An(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Co(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Pb(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Bi(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Ca(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Ceq(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">SiO2(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">Al2O3(%)</th>
						<th bgcolor="ADD8E6" style="text-align: center;">A类<br>个数</th>
					    <th bgcolor="ADD8E6" style="text-align: center;">A类<br>尺寸</th>
						<th bgcolor="ADD8E6" style="text-align: center;">D类<br>个数</th>
						<th bgcolor="ADD8E6" style="text-align: center;">D类<br>尺寸</th>
                        <th bgcolor="ADD8E6" style="text-align: center;">备注</th>
  				</tr>
				</thead>
				<tbody>
				</tbody>
			</table> -->
		</div>

</div>
<!-- 添加和更新分辨跳转的函数 -->
	<script type="text/javascript">
	
		function add(){
			form1.action = "addSteelPara";
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
					url:"addSteelPara",//请求函数
					/* data:JSON.stringify(form1), */
					data:$("#form1").serialize(),
					success:function(data){
							alert(data);
							window.location.href="manageSteelPara";
							
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
