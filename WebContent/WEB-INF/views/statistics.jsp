<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>test page</title>
<script src="js/echarts.js"></script>
<script src="jquery/jquery.min.js"></script>
<style>
ul {
            display: flex;
            flex-flow: row nowrap;
/*             整个li实现在page居中 */
/*             justify-content: center; */
    }
ul li {
            list-style: none;
            border-left: 2px solid #66ccff;
            border-top: 2px solid #66ccff;
            border-bottom: 2px solid #66ccff;
            text-align: center;
            line-height: 30px;
            padding: 10px;
            height: 30px;
            width: 100px;            
    }   
ul li:last-child {
        border-right: 2px solid #66ccff;
    }
ul li:hover{
        cursor: pointer;
        background-color: #B0C4DE;
    }
.active{
        background-color: #66ccff;
    }
.Echart{
	height: 600px; 
	width: 1600px;
	background-color: #66ccff;
	display:inline-block;
}	
.disnone{
	display: none;
    }
</style>
</head>
<body>
<h1>Demo01</h1>
<!-- <ul> -->
<!-- <!-- 点击后触发表格的按钮 --> 
<!-- <li class="active"><a style="font-weight:bolder;"href="#tab1" data-toggle="tab">演示效果test</a></li> -->
<!-- </ul> -->
<!-- 用于展示出数据  和上面的a标签呼应 -->
<div class="container">
<!-- 		第一个子div用于存放导航   内容为合金名称 -->
	<div class="top-nav">
		<p><b>用于选择合金的种类</b></p>
		<ul class="alloy-slect">
        	<li id="alloy1">Q195-Y</li>
        	<li id="alloy2">etc</li>
        	<li id="alloy3">etc</li>
       	 	<li id="alloy4">etc</li>
        	<li id="alloy5">etc</li>
    	</ul>
    	<p><b>用于选择合元素的种类</b></p>
    	<ul class="com-select">
        	<li id="com1">c</li>
        	<li id="com2">si</li>
        	<li id="com3">mn</li>
       	 	<li id="com4">p</li>
       	 	<li id="com5">s</li>
        	<li id="com6">als</li>
        	<li id="com7">ti</li>
        	<li id="com8">nb</li>
    	</ul>
	</div>
	<div id="e-container">
		<div id="myBarDiv1" class="Echart chart"></div>
		<div id="myBarDiv2" class="chart" ></div>
		<div id="myBarDiv3" class="chart" ></div>
		<div id="myBarDiv4" class="chart"></div>
		<div id="myBarDiv5" class="chart" ></div>
	</div>
	
</div>


<script type="text/javascript">
<!--这个是柱状图-->
function loadData(option) {
	$.ajax({
		type : 'post',	//传输类型
		async : false,	//同步执行
		url : 'getData.do',	//web.xml中注册的Servlet的url-pattern
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			if (result) {
// 				//初始化xAxis[0]的data
// 				option.xAxis[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.xAxis[0].data.push(result[i].produce_date);
// 				}
// 				//初始化series[0]的data
// 				option.series[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[0].data.push(result[i].steel_c);
// 				}
// 				option.series[1].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[1].data.push(result[i].steel_si);
// 				}
// 				option.series[2].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[2].data.push(result[i].steel_mn);
// 				}
// 				option.series[3].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[3].data.push(result[i].steel_p);
// 				}
// 				option.series[4].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[4].data.push(result[i].steel_s);
// 				}
// 				option.series[5].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[5].data.push(result[i].steel_als);
//  				option.series[0].data = [];
// 				option.xAxis[0].data = [];
// 				//初始化xAxis[0]的data
				//从传过来的json中查找合金名称为Q195-Y的json  把合金名称为Q195-Y的si数据给到option.series[0].data = []中作为对应纵坐标数据
// 				for(var i=0;i<result.length; i++){
// 					if (result[i].steel_name == 'Q195-Y'){
// 						option.series[0].data.push(result[i].steel_si);
// 					}
// 				}
// // 				option.xAxis[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					if(result[i].steel_name == 'Q195-Y'){
// 						option.xAxis[0].data.push(result[i].produce_date);
// 					}
// 				}												
                //把合金名称为Q195-Y的所有数据都显示出来展示在一个表格中
                //series是纵坐标的数据  xAxis是横坐标对应的时间
                option.xAxis[0].data = [];
                //这里再次筛选钢种和班组了
                	for (let i=0; i<result.length; i++) {
						if(result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
							option.xAxis[0].data.push(result[i].produce_date);
						}
                	}
                	option.series[0].data = [];
                	for (let i=0; i<result.length; i++) {
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[0].data.push(result[i].steel_c);    
    					}
                	}
                	option.series[1].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y' && result[i].class_no =="甲"){
    						option.series[1].data.push(result[i].steel_si);    			
    					}
                	}
                	option.series[2].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[2].data.push(result[i].steel_mn);   						 				
    					}
                	}
                	option.series[3].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[3].data.push(result[i].steel_p);   						 				
    					}
                	}
                	option.series[4].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[4].data.push(result[i].steel_s);   						 				
    					}
                	}
                	option.series[5].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[5].data.push(result[i].steel_als);   						 				
    					}
                	}
                	option.series[6].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[6].data.push(result[i].steel_ti);   						 				
    					}
                	}
                	option.series[7].data = [];
                	for(let i=0;i<result.length; i++){
                		if (result[i].steel_name == 'Q195-Y'  && result[i].class_no =="甲"){
    						option.series[7].data.push(result[i].steel_nb);   						 				
    					}
                	}
				}								
			},
		
		error : function(errorMsg) {
			alert("加载数据失败");
		}
	});//AJAX
}//loadData()

var myChart1_1 = echarts.init(document.getElementById('myBarDiv1'));
var option1_1 = {		
	title: {
        text: 'Q195-Y的所有成分数据展示(%)'
    },    
	tooltip : {
		show : true,
		axisPointer: {
            type: 'shadow'
        },
	},
	calculable : true,
	legend : {
		data : [ 'c','si','mn','p','s','als','ti','nb'],
		left: "center",
   	 	y: "5%",
   	 	itemWidth: 18,
    	itemHeight: 12,
    	textStyle: {
        	color: "#000000",
        	fontSize: 16
    	},
	},
	grid: {
        left: '5%',
        top: "12%",
        bottom: "6%",
        right: "8%",
        containLabel: true
    },
//     加入折线图和其他按钮的功能
    toolbox: {
    	itemSize:20,
    	itemGap:20,
        orient: 'horizontal',
        right: '2.5%',
        top: '3%',
        iconStyle: {
            color: '#4169E1',
            textColor:'#FF69B4',
            textPosition:'left',
            borderColor: '#48D1CC',
            borderWidth: 1,
            emphasis:{
            	textPosition:'top'
            	}
        },
        feature: {	                	
            dataView : {                            //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新
                show: true,                         //是否显示该工具。
                title:"数据视图",

                readOnly: false,                    //是否不可编辑（只读）
                lang: ['成分含量', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                
                backgroundColor:"#ADD8E6",             //数据视图浮层背景色。
                textareaColor:"#fff",               //数据视图浮层文本输入区背景色
                textareaBorderColor:"#333",         //数据视图浮层文本输入区边框颜色
                textColor:"#000",                    //文本颜色。
                buttonColor:"#c23531",              //按钮颜色。
                buttonTextColor:"#fff",             //按钮文本颜色。
            },
            restore: { //重置
                show: true
            },
            dataZoom: { //数据缩放视图
                show: true
            },
            saveAsImage: {//保存图片
                show: true,
                name:"进渣用时",
                fontSize: 150
            },
            magicType: {
                // show: true,
                type: ['line','bar','stack','tiled']
            }
        }
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        },
    },
    dataZoom: [{
        type: 'inside',
        start: 0,
        end: 10
    }, {
        start: 0,
        end: 10,
        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        handleSize: '80%',
        handleStyle: {
            color: '#fff',
            shadowBlur: 3,
            shadowColor: 'rgba(0, 0, 0, 0.6)',
            shadowOffsetX: 2,
            shadowOffsetY: 2
        }
    }],
	xAxis : [ {
		type : 'category',
		name : '日期',
        axisLine: {
            show: true,
            lineStyle: {
                color: '#000000'
            }
        },
        axisLabel: {
            interval: 5,
            textStyle: {
                color: '#000000',
                fontSize: 15,
                fontFamily:'Times New Roman'
            }
        },
        axisTick: {
            show: false
        },
        data :(function(){
            var arr=[];
                $.ajax({
                type : "post",
                async : false, //同步执行
                url : "getData.do",
                data : {},
                dataType : "json", //返回数据形式为json
                success : function(result) {
                if (result) {
                       for(var i=0;i<result.length;i++){
                          console.log(result[i].produce_date);
                          arr.push(result[i].produce_date);
                        }    
                }
                
            },
            error : function(errorMsg) {
                alert("不好意思，图表请求数据失败啦!");
                myChart1.hideLoading();
            }
           })
           return arr;
        })() 


		
	} ],
	yAxis : [ {
		type : 'value',
		name : '成分含量'
	} ],
	axisTick: {
        show: false
    },
    splitLine: {
        show: false
    },
    axisLabel: {
        textStyle: {
            color: '#000000',
            fontSize: 15,
            fontFamily:'Times New Roman'
        }
    },
    axisLine: {
        show: true,
        lineStyle: {
            color: '#000000'
        }
    },
	series : [ {
		name : 'c',
		type : 'bar'
	},
	{
		name : 'si',
		type : 'bar'
	},
	{
		name : 'mn',
		type : 'bar'
	},
	{
		name : 'p',
		type : 'bar'
	},
	{
		name : 's',
		type : 'bar'
	},
	{
		name : 'als',
		type : 'bar'
	},
	{
		name : 'ti',
		type : 'bar'
	},
	{
		name : 'nb',
		type : 'bar'
	}
	]
};
// //加载数据到option
loadData(option1_1);
// //设置option
myChart1_1.setOption(option1_1);
</script>


<script type="text/javascript">
<!--这个是柱状图-->
function loadData(option) {
	$.ajax({
		type : 'post',	//传输类型
		async : false,	//同步执行
		url : 'getData.do',	//web.xml中注册的Servlet的url-pattern
		data : {},
		dataType : 'json', //返回数据形式为json
		success : function(result) {
			if (result) {
// 				//初始化xAxis[0]的data
// 				option.xAxis[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.xAxis[0].data.push(result[i].produce_date);
// 				}
// 				//初始化series[0]的data
// 				option.series[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[0].data.push(result[i].steel_c);
// 				}
// 				option.series[1].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[1].data.push(result[i].steel_si);
// 				}
// 				option.series[2].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[2].data.push(result[i].steel_mn);
// 				}
// 				option.series[3].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[3].data.push(result[i].steel_p);
// 				}
// 				option.series[4].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[4].data.push(result[i].steel_s);
// 				}
// 				option.series[5].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					option.series[5].data.push(result[i].steel_als);
//  				option.series[0].data = [];
// 				option.xAxis[0].data = [];
// 				//初始化xAxis[0]的data
				//从传过来的json中查找合金名称为Q195-Y的json  把合金名称为Q195-Y的si数据给到option.series[0].data = []中作为对应纵坐标数据
// 				for(var i=0;i<result.length; i++){
// 					if (result[i].steel_name == 'Q195-Y'){
// 						option.series[0].data.push(result[i].steel_si);
// 					}
// 				}
// // 				option.xAxis[0].data = [];
// 				for (var i=0; i<result.length; i++) {
// 					if(result[i].steel_name == 'Q195-Y'){
// 						option.xAxis[0].data.push(result[i].produce_date);
// 					}
// 				}												
                //把合金名称为Q195-Y的所有数据都显示出来展示在一个表格中
                //series是纵坐标的数据  xAxis是横坐标对应的时间
                option.xAxis[0].data = [];
                
                	for (let i=0; i<result.length; i++) {
						if(result[i].steel_name == 'Q195-Y'){
							option.xAxis[0].data.push(result[i].produce_date);
						}
                	}
                	option.series[0].data = [];
                	for (let i=0; i<result.length; i++) {
                		if (result[i].steel_name == 'Q195-Y'){
    						option.series[0].data.push(result[i].steel_c);    
    					}
                	}
                	
				}
				
				
			},
		
		error : function(errorMsg) {
			alert("加载数据失败");
		}
	});//AJAX
}//loadData()


optionxx = {
    xAxis: {
        type: 'category',
        boundaryGap: false,
        data: ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    },
    yAxis: {
        type: 'value'
    },
    series: [{
        data: [820, 932, 901, 934, 1290, 1330, 1320],
        type: 'line',
        areaStyle: {}
    }]
};

var myChart1_2 = echarts.init(document.getElementById('myBarDiv2'));
var option1_2 = {		
	title: {
        text: 'Q195-Y的C数据展示(%)'
    },    
	tooltip : {
		show : true,
		axisPointer: {
            type: 'shadow'
        },
	},
	calculable : true,
	legend : {
		data : ['c','si','mn','p','s','als','ti','nb'],
		left: "center",
   	 	y: "5%",
   	 	itemWidth: 18,
    	itemHeight: 12,
    	textStyle: {
        	color: "#000000",
        	fontSize: 16
    	},
	},
	grid: {
        left: '5%',
        top: "12%",
        bottom: "6%",
        right: "8%",
        containLabel: true
    },
//     加入折线图和其他按钮的功能
    toolbox: {
    	itemSize:20,
    	itemGap:20,
        orient: 'horizontal',
        right: '2.5%',
        top: '3%',
        iconStyle: {
            color: '#4169E1',
            textColor:'#FF69B4',
            textPosition:'left',
            borderColor: '#48D1CC',
            borderWidth: 1,
            emphasis:{
            	textPosition:'top'
            	}
        },
        feature: {	                	
            dataView : {                            //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新
                show: true,                         //是否显示该工具。
                title:"数据视图",

                readOnly: false,                    //是否不可编辑（只读）
                lang: ['成分含量', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                
                backgroundColor:"#ADD8E6",             //数据视图浮层背景色。
                textareaColor:"#fff",               //数据视图浮层文本输入区背景色
                textareaBorderColor:"#333",         //数据视图浮层文本输入区边框颜色
                textColor:"#000",                    //文本颜色。
                buttonColor:"#c23531",              //按钮颜色。
                buttonTextColor:"#fff",             //按钮文本颜色。
            },
            restore: { //重置
                show: true
            },
            dataZoom: { //数据缩放视图
                show: true
            },
            saveAsImage: {//保存图片
                show: true,
                name:"c",
                fontSize: 150
            },
            magicType: {
                // show: true,
                type: ['line','bar','stack','tiled']
            }
        }
    },
    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'shadow'
        },
    },
    dataZoom: [{
        type: 'inside',
        start: 0,
        end: 10
    }, {
        start: 0,
        end: 10,
        handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
        handleSize: '80%',
        handleStyle: {
            color: '#fff',
            shadowBlur: 3,
            shadowColor: 'rgba(0, 0, 0, 0.6)',
            shadowOffsetX: 2,
            shadowOffsetY: 2
        }
    }],
	xAxis : [ {
		type : 'category',
		name : '日期',
        axisLine: {
            show: true,
            lineStyle: {
                color: '#000000'
            }
        },
        axisLabel: {
            interval: 5,
            textStyle: {
                color: '#000000',
                fontSize: 15,
                fontFamily:'Times New Roman'
            }
        },
        axisTick: {
            show: false
        },
        data :(function(){
            var arr=[];
                $.ajax({
                type : "post",
                async : false, //同步执行
                url : "getData.do",
                data : {},
                dataType : "json", //返回数据形式为json
                success : function(result) {
                if (result) {
                       for(var i=0;i<result.length;i++){
                          console.log(result[i].produce_date);
                          arr.push(result[i].produce_date);
                        }    
                }
                
            },
            error : function(errorMsg) {
                alert("不好意思，图表请求数据失败啦!");
                myChart1.hideLoading();
            }
           })
           return arr;
        })() 


		
	} ],
	yAxis : [ {
		type : 'value',
		name : '成分含量'
	} ],
	axisTick: {
        show: false
    },
    splitLine: {
        show: false
    },
    axisLabel: {
        textStyle: {
            color: '#000000',
            fontSize: 15,
            fontFamily:'Times New Roman'
        }
    },
    axisLine: {
        show: true,
        lineStyle: {
            color: '#000000'
        }
    },
    series : [ {
		name : 'c',
		type : 'bar'
	},
	{
		name : 'si',
		type : 'bar'
	},
	{
		name : 'mn',
		type : 'bar'
	},
	{
		name : 'p',
		type : 'bar'
	},
	{
		name : 's',
		type : 'bar'
	},
	{
		name : 'als',
		type : 'bar'
	},
	{
		name : 'ti',
		type : 'bar'
	},
	{
		name : 'nb',
		type : 'bar'
	}
	]
	
};
// //加载数据到option
loadData(option1_1);
// //设置option
myChart1_2.setOption(option1_1);
</script>



<script type="text/javascript">
// 此script中存放的是用jQ来改变导航栏的选定情况  为后面的加载Echarts内容做引到
$(document).ready(function(){
// 	给点击到的li标签添加一个active类，同时取消一个ul下其他li的active类
        $(".alloy-slect li").click(function(){
        $(this).addClass("active");
        $(".alloy-slect li").eq($(this).index()).addClass("active").siblings().removeClass("active");
  });
//     	（和上面的不是一个ul）给点击到的li标签添加一个active类，同时取消一个ul下其他li的active类
  		$(".com-select li").click(function(){
        $(this).addClass("active");
        $(".com-select li").eq($(this).index()).addClass("active").siblings().removeClass("active");
  });	
  		$(".e-container #myBarDiv1").click(function(){
    	$(this).addClass(".activeEchart");
    	$("#myBarDiv1").eq($(this).index()).addClass(".activeEchart").siblings().removeClass(".activeEchart");    
  });
//		切换nav的时候触发事件
  		$(".top-nav li").click(function(){
  		    if ($("#alloy1").hasClass('active') && $("#com1").hasClass('active')) {
  		    	alert(' all 的 c');
  		     	$(".chart").addClass("disnone"); 
  		     	$("#myBarDiv2").removeClass("disnone");
  		     	$("#myBarDiv2").addClass("Echart");		
  		     	echarts.dispose(document.getElementById('myBarDiv2'));
  		      	loadData(option1_1);
  		      	//设置option  		 
  		      	myChart1_2.setOption(optionxx);
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com2").hasClass('active')) {
  		        alert(' all 的 si');
  		      	$(".chart").addClass("disnone"); 
  		      	$("#myBarDiv3").removeClass("disnone");
		     	$("#myBarDiv3").addClass("Echart");
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com3").hasClass('active')) {
  		        alert(' all 的 mn');
  		      	$(".chart").addClass("disnone"); 
		      	$("#myBarDiv4").removeClass("disnone");
		     	$("#myBarDiv4").addClass("Echart");
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com4").hasClass('active')) {
  		        alert(' all 的 p');
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com5").hasClass('active')) {
  		        alert(' all 的 s');
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com6").hasClass('active')) {
  		        alert(' all 的 als');
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com7").hasClass('active')) {
  		        alert(' all 的 ti');
  		    }
  		    if ($("#alloy1").hasClass('active') && $("#com8").hasClass('active')) {
  		        alert(' all 的 nb');
  		    }


  		    if ($("#alloy2").hasClass('active') && $("#com1").hasClass('active')) {
  		        alert(' Q195-Y 的 c');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com2").hasClass('active')) {
  		        alert(' Q195-Y 的 si');
  		      	loadData(option2_1);
  		     	myChart1_1.setOption(option2_1);
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com3").hasClass('active')) {
  		        alert(' Q195-Y 的 mn');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com4").hasClass('active')) {
  		        alert(' Q195-Y 的 p');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com5").hasClass('active')) {
  		        alert(' Q195-Y 的 s');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com6").hasClass('active')) {
  		        alert(' Q195-Y 的 als');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com7").hasClass('active')) {
  		        alert(' Q195-Y 的 ti');
  		    }
  		    if ($("#alloy2").hasClass('active') && $("#com8").hasClass('active')) {
  		        alert(' Q195-Y 的 nb');
  		    }

  		  });
});
</script>
</body>
</html>