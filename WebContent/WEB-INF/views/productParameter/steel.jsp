<span style="font-size:12px;"><span style="font-size:12px;">
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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




	<!-- 添加（录入）钢种成分面板 -->
	<form action="addsteel" method="post" name="form1">
		<div class="panel panel-info">
			<div class="panel-heading" style="text-align: center;">
				<h4 style="font-weight: bolder;">
					添加钢种类别 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;
					
					&nbsp;&nbsp;<a href="index.jsp" style="font-size: 15px;"> 返回</a>
				</h4>
			</div>
			<div class="panel-body">

				<table class="table table-bordered" style="width: 80%; margin: auto">
					<tr class="success">
						<th style="text-align: center; height: 15px">样品类别</th>
						<th style="text-align: center; height: 15px">取样地点</th>
						<th style="text-align: center; height: 15px">样品编号</th>
						<th style="text-align: center; height: 15px">C(%)</th>
						<th style="text-align: center; height: 15px">Si(%)</th>
						<th style="text-align: center; height: 15px">Mn(%)</th>
						<th style="text-align: center; height: 15px">P(%)</th>
						<th style="text-align: center; height: 15px">S(%)</th>
						<th style="text-align: center; height: 15px">Al(%)</th>
						<th style="text-align: center; height: 15px">AlS(%)</th>
					</tr>
					<tbody>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="demotype" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="demoplace" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="demonum" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="c" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="si" id="si" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="mn" id="mn" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="p" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="s" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="al" id="al" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="als" id="als" class="form-control""></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">Cu(%)</th>
							<th style="text-align: center; height: 15px">Ni(%)</th>
							<th style="text-align: center; height: 15px">Cr(%)</th>
							<th style="text-align: center; height: 15px">V(%)</th>
							<th style="text-align: center; height: 15px">Ti(%)</th>
							<th style="text-align: center; height: 15px">Nb(%)</th>
							<th style="text-align: center; height: 15px">N(%)</th>
							<th style="text-align: center; height: 15px">O(%)</th>
							<th style="text-align: center; height: 15px">Mo(%)</th>
							<th style="text-align: center; height: 15px">W(%)</th>
						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Cu" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Ni" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Cr" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="V" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Ti" id="Ti" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="Nb" id="Nb" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="N" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="O" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Mo" id="Mo" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="W" id="W" class="form-control""></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">As(%)</th>
							<th style="text-align: center; height: 15px">B(%)</th>
							<th style="text-align: center; height: 15px">Sn(%)</th>
							<th style="text-align: center; height: 15px">Sb(%)</th>
							<th style="text-align: center; height: 15px">An(%)</th>
							<th style="text-align: center; height: 15px">Co(%)</th>
							<th style="text-align: center; height: 15px">Pb(%)</th>
							<th style="text-align: center; height: 15px">Bi(%)</th>
							<th style="text-align: center; height: 15px">Ca(%)</th>
							<th style="text-align: center; height: 15px">Ceq(%)</th>
						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="As" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="B" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Sn" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Sb" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="An" id="An" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="Co" id="Co" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Pb" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Bi" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Ca" id="Ca" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="Ceq" id="Ceq" class="form-control""></td>
						</tr>
						<tr class="success">
							<th style="text-align: center; height: 15px">SiO2(%)</th>
							<th style="text-align: center; height: 15px">Al2O3(%)</th>
							<th style="text-align: center; height: 15px">A类夹杂个数</th>
							<th style="text-align: center; height: 15px">A类夹杂尺寸</th>
							<th style="text-align: center; height: 15px">D类夹杂个数</th>
							<th style="text-align: center; height: 15px">D类夹杂尺寸</th>
							<th style="text-align: center; height: 15px">备注</th>
							<th style="text-align: center; height: 15px">  </th>
							<th style="text-align: center; height: 15px">  </th>
						</tr>
						<tr align="center">
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="SiO2" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="Al2O3" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="a_num" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="a_size" class="form-control"></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="d_num" id="Ti" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 120px; height: 30px"
								name="d_size" id="d_size" class="form-control""></td>
							<td style="height: 20px"><input type="text"
								style="font-size: 15px; border: none; text-align: center; display: inline; width: 80px; height: 30px"
								name="remark" class="form-control"></td>
							<td style="height: 20px"><button
									class="btn btn-primary btn-sm" type="button" onclick="submit()">
									提交 <i class="fa fa-plus" style="font-size: 15px;"></i>
								</button></td>
							<td><button class="btn btn-warning btn-sm" type="reset">
								重置<i class="fa fa-refresh" style="font-size: 15px;"></i>
							</button></td>

						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</form>
	<form action="searchsteel" method="post" name="form2">
		<div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			属性选择：<select name="searchid"
				class="selectpicker show-tick form-control"
				style="font-size: 15px; text-align: center; display: inline; vertical-align: middle; width: 160px; height: 30px; border: none">
				<option value="1">按类别查询</option>
				<option value="2">按取样地点查询</option>
				<option value="3">3</option>
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
				id="mindata" name="mindata" value="${param.mindata }">
			&nbsp;&nbsp;
			<button class="btn btn-success btn-sm" type="submit">
				<i class="fa fa-search" aria-hidden="true"></i>查询
			</button>
		</div>
	</form>
	<div class="table-responsive">
			<table class="table table-bordered"
				style="border: 1px #CCCCCC solid; width: 80%; margin: auto">
				<thead>
					<tr class="success">
						<th colspan="56" style="text-align: center; height: 20px">钢种类别成分表
						</th>
					</tr>
					<tr>
						<th colspan="2" bgcolor="FFD700" style="text-align: center;">操作<br>方法
						</th>
						<th bgcolor="ADD8E6" style="text-align: center;">样品类别</th>
						<th bgcolor="ADD8E6" style="text-align: center;">取样地点</th>
						<th bgcolor="ADD8E6" style="text-align: center;">样号</th>
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


			</table>
		</div>
	

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
		</html></span><span style="font-size:24px;color: rgb(255, 0, 0);">
</span></span>
