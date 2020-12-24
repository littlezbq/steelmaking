<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    pageContext.setAttribute("BasePath", request.getContextPath());
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Demo test page</title>
<script src="js/echarts.js"></script>
<script src="jquery/jquery.min.js"></script>
<script src="./res/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<!--------------------------------- CSS部分 ----------------------------->
<style>
ul {
/*             display: flex; */
/*             flex-flow: row nowrap; */
/* /*             整个li实现在page居中 */ */
/*             justify-content: center;  */
			list-style: none;
    }
ul li {
			float: left;
            list-style: none;
            border-left: 2px solid grey;
            border-top: 2px solid grey;
            border-bottom: 2px solid grey;
            text-align: center;
            line-height: 30px;
            padding: 10px;
            height: 30px;
            width: 100px;       
            font-size:18px;     
    }   
ul li:last-child {
        border-right: 2px solid grey;
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
	width: 1500px;
	display:inline-block;
}	
.disnone{
	display: none;
    }
select{
		margin-left:11px;
		margin-right:11px;
        height: 28px;
        width: 130px;
        font-size: 16px;
        font-weight: 700;
    }
/* #btn{ */
/* 		height:30px; */
/* 		weight:200px; */
/* } */
#btn:hover{
		cursor: pointer;
}

.to-con{
		margin-left:75px;
		margin-top:10px;
}
#btn-sub{
		font-size:17px;
		font-weight:700;
		height:40px;
		weight:200px;
		margin-left:75px;		
		margin-top:10px;
}
.select-one{
		margin-left:75px;
		margin-top:20px;
		height:30px;
		weight:200px;
}
</style>
<!--------------------------------- CSS部分 ----------------------------->



</head>
<body>
<%-- <jsp:include page="include.jsp" /> --%>
<div class="container">
	<div class="top-nav">
		<div class="select-one">
		<span><b>下拉选择钢种类型</b></span>
    	<select name="" id="btn">
        </select>
        </div>
        
        <div class="to-con">
        <span><b>下拉选择元素成分</b></span>
        <select name="" id="btn" class="select-two">
    	<option value="C">C</option>
        <option value="Si">Si</option>
        <option value="Mn">Mn</option>
        <option value="P">P</option>
        <option value="S">S</option>
        <option value="Als">Als</option>
        <option value="Ti">Ti</option>
        <option value="Nb">Nb</option>
        </select>

		</div>
		<button id="btn-sub">点击查询</button>	
		<a  class = "btn btn-primary btn-sm" href="${BasePath}/manageProducePara" style="font-size: 15px;" > 返回</a>	
	    </div>
	    
	<div id="e-container">
<!-- 	用于展示echarts的div盒子，分布直方图 -->
		<div id="myBarDiv1" class="Echart chart"></div>
<!-- 	用于展示echarts的div盒子，成分出现频次图 -->
<!-- 		<div id="myBarDiv2" class="Echart chart"></div> -->
	</div>	
</div>





<!-------------- JS主要部分-------------- -->

<script type="text/javascript">



//颜色数组  声明为全局给echarts中使用
var colors = ["#4169E1","#CD853F","#808000" ,"#5EBEFC"];
//all_alloy_sorts用来存所有的钢种类型    内容在后面由ajax读入到数组中
var all_alloy_sorts =[];


function frequency(alloy,com){
	var option1;
	
	var x_steelc = [];
	var y_steelc = [];
	$.ajax({
        type:"post",
        async:false,
//         这个getData.do是在xml中起别名的   
        url:"getData.do",
        data :{},
        dataType:"json",
//         这里的result就是servlet中getData方法传递过来的json数据
        success:function(result){
            if (result) {
//             	遍历json来获取对应要的数据
                for (let i = 0; i < result.length; i++) {                	
//                 	根据钢种名称种类来添加横坐标的时间                    
                   if (result[i].steel_name == alloy && com=="steel_c") {
                	   if(x_steelc.indeOf(result[i].steel_c) != -1){
                		   x_steelc.push(result[i].steel_c);
                	   }
                    } 
                }
                x_steelc.sort(function(a, b){return a - b}); 
                console.log(x_steelc);
                
				var y_steelc = new Array(x_steelc.length).fill(0);
				console.log(y_steelc);
				for(let i = 0; i < result.length; i++){
					if(x_steelc.indeOf(result[i].steel_c) != -1){
						y_steelc[x_steelc.indeOf(result[i].steel_c)]++;
					}
				}
            }
        }
    });
	option1 = {
			color: colors,
			tooltip : {
				show : true,
                axisPointer: {
                    type: 'shadow'
                },
			},
			calculable : true,
			legend : {
				data : ['C出现频次'],
                left: 'center',
                y: '5%',
                itemWidth: 18,
                itemHeight: 12,
                textStyle: {
                    color: '#000000',
                    fontSize: 16
                },
			},
			grid: {
                left: '5%',
                top: '12%',
                bottom: '6%',
                right: "8%",
                containLabel: true
            },
//	            加入折线图和其他按钮的功能
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
                        lang: ['C出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"C出现频次",
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
				data :x_steelc
			
			} ],
			yAxis : [ {
				type : 'value',
				name : 'C出现频次'
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
				"name" : "C出现频次",
				"type" : "bar",
				"data" : y_steelc,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'#4169E1'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
          					itemStyle:{
          						normal:{
          							lineStyle: { 
          	                            type: 'dotted', 
          	                            width:3 
          	                        }, 
          							color:'#4169E1'
          						}
          					},

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:true,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			}					
			]            
		};
	if(com == "steel_c"){
		return option1;
	}
}


//  --------------------------------------------------------------------------------------------------------------
// 决定echarts内容的函数 setOption，第一个参数是钢种名称，第二个参数是想要查询的元素
//  --------------------------------------------------------------------------------------------------------------
function setOption(alloy,com) {	
	
// 	tabNoption是根据元素参数返回的不同option  用作echarts的参数
	var tab1option;
	var tab2option;
	var tab3option;
	var tab4option;
	var tab5option;
	var tab6option;
	var tab7option;
	var tab8option;
// 	alloy_data存横坐标的时间
// A B C对应班次的甲 乙 丙   再根据不同的元素分为3*8共24个数组   是echarts的纵坐标取值来源
// 如 alloy_Cc表示的是---班次丙的碳含量    会根据参数中钢种种类自己划分
	var alloy_date = [];
	var alloy_Ac = [];
	var alloy_Bc = [];
	var alloy_Cc = [];
	var alloy_Asi = [];
	var alloy_Bsi = [];
	var alloy_Csi = [];
	var alloy_Amn = [];
	var alloy_Bmn = [];
	var alloy_Cmn = [];
	var alloy_Ap = [];
	var alloy_Bp = [];
	var alloy_Cp = [];
	var alloy_As = [];
	var alloy_Bs = [];
	var alloy_Cs = [];
	var alloy_Aals = [];
	var alloy_Bals = [];
	var alloy_Cals = [];
	var alloy_Ati = [];
	var alloy_Bti = [];
	var alloy_Cti = [];
	var alloy_Anb = [];
	var alloy_Bnb = [];
	var alloy_Cnb = [];
    $(document).ready(function(){
//     	用JQ中的ajax先异步的把需要的各种数据进行分类添加到提前预设的数组中
	$.ajax({
        type:"post",
        async:false,
//         这个getData.do是在xml中起别名的   
        url:"getData.do",
        data :{},
        dataType:"json",
//         这里的result就是servlet中getData方法传递过来的json数据
        success:function(result){
            if (result) {
//             	遍历json来获取对应要的数据
                for (let i = 0; i < result.length; i++) {                	
//                 	根据钢种名称种类来添加横坐标的时间
                    if (result[i].steel_name == alloy && result[i].class_no == "甲") {
                        alloy_date.push(result[i].produce_date);
                    }
//                     根据函数参数和li中选定的钢种来对对应数组中添加对应的数据
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_c") {
                        alloy_Ac.push(result[i].steel_c);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_c") {
                        alloy_Bc.push(result[i].steel_c);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_c") {
                        alloy_Cc.push(result[i].steel_c);
                    } 
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_si") {
                        alloy_Asi.push(result[i].steel_si);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_si") {
                        alloy_Bsi.push(result[i].steel_si);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_si") {
                        alloy_Csi.push(result[i].steel_si);
                    }  
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_mn") {
                        alloy_Amn.push(result[i].steel_mn);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_mn") {
                        alloy_Bmn.push(result[i].steel_mn);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_mn") {
                        alloy_Cmn.push(result[i].steel_mn);
                    } 
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_p") {
                        alloy_Ap.push(result[i].steel_p);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_p") {
                        alloy_Bp.push(result[i].steel_p);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_p") {
                        alloy_Cp.push(result[i].steel_p);
                    }     
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_s") {
                        alloy_As.push(result[i].steel_s);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_s") {
                        alloy_Bs.push(result[i].steel_s);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_s") {
                        alloy_Cs.push(result[i].steel_s);
                    } 
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_als") {
                        alloy_Aals.push(result[i].steel_als);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_als") {
                        alloy_Bals.push(result[i].steel_als);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_als") {
                        alloy_Cals.push(result[i].steel_als);
                    }  
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_ti") {
                        alloy_Ati.push(result[i].steel_ti);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_ti") {
                        alloy_Bti.push(result[i].steel_ti);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_ti") {
                        alloy_Cti.push(result[i].steel_ti);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "甲" && com=="steel_nb") {
                        alloy_Anb.push(result[i].steel_nb);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "乙" && com=="steel_nb") {
                        alloy_Bnb.push(result[i].steel_nb);
                    }
                    if (result[i].steel_name == alloy && result[i].class_no == "丙" && com=="steel_nb") {
                        alloy_Cnb.push(result[i].steel_nb);
                    }
                    
                }                                
            }
        }
    })
//  测试数组作用域
//  console.log("this is date : "+alloy_date);
// 	console.log("this is 甲的C : "+alloy_A);
// 	console.log("this is 乙的C : "+alloy_B);
// 	console.log("this is 丙的C : "+alloy_C);
// 	console.log("this is 甲的si : "+alloy_Asi);
// 	console.log("this is 乙的si : "+alloy_Bsi);
// 	console.log("this is 丙的si : "+alloy_Csi);
	
});
    
tab1option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['C含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"C含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'C含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Ac,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bc,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cc,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
			
//----------------------------------------------------
tab2option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['si含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"si含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'si含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Asi,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bsi,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Csi,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
			
//-----------------------------------------------------------

tab3option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['mn含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"mn含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'mn含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Amn,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bmn,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cmn,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
//-----------------------------------------------------------

tab4option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['p含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"p含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'p含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Ap,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bp,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cp,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
			
//-----------------------------------------------------------

tab5option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['s含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"s含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 's含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_As,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bs,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cs,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
			
//-----------------------------------------------------------

tab6option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['als含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"als含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'als含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Aals,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bals,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cals,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
//-----------------------------------------------------------

tab7option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['ti含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"ti含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'ti含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Ati,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bti,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cti,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};
//-----------------------------------------------------------

tab8option = {
				color: colors,
				tooltip : {
					show : true,
	                axisPointer: {
	                    type: 'shadow'
	                },
				},
				calculable : true,
				legend : {
					data : [ '班次甲' ,'班次乙','班次丙'],
	                left: 'center',
	                y: '5%',
	                itemWidth: 18,
	                itemHeight: 12,
	                textStyle: {
	                    color: '#000000',
	                    fontSize: 16
	                },
				},
				grid: {
	                left: '5%',
	                top: '12%',
	                bottom: '6%',
	                right: "8%",
	                containLabel: true
	            },
// 	            加入折线图和其他按钮的功能
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
	                        lang: ['nb含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"nb含量(%)",
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
					data :alloy_date
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'nb含量(%)'
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
					"name" : "班次甲",
					"type" : "bar",
					"data" : alloy_Anb,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#4169E1'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dotted', 
	          	                            width:3 
	          	                        }, 
	          							color:'#4169E1'
	          						}
	          					},

	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'begin',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	                            
				},
				{
					"name" : "班次乙",
					"type" : "bar",
					"data" : alloy_Bnb,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {
	          					itemStyle:{
	          						normal:{
	          							lineStyle: { 
	          	                            type: 'dashed', 
	          	                            width:3 
	          	                        }, 
	          							color:'#FF8C00'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
		          	                          show:true,
		          	                          position:'end',
		          	                          formatter: '{b}: {c}'	          	                          
		          	                      },
	          	                    }
	          	                ]
	          	            }	
				},
				{
					"name" : "班次丙",
					"type" : "bar",
					"data" : alloy_Cnb,
	          				  markPoint : {
	          					itemStyle:{
	          						normal:{
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'max', name: '最大值'},
	          	                    {type : 'min', name: '最小值'}
	          	                ]
	          	            },
	          	            markLine : {	          	            	
	          					itemStyle:{
	          						normal:{	          							
	          							lineStyle: { 
	          	                            type: 'solid', 
	          	                            width:3 
	          	                        }, 
	          							color:'#808000'
	          						}
	          					},
	          	                data : [
	          	                    {type : 'average', name: '平均值',
	          	                    	label:{
	          	                          show:true,
	          	                          position:'middle',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },	
	          	                    }
	          	                ]
	          	            }	
				}
				
				]
                
			};			
//根据参数返回指定的option，参数中成分不同来返回不同的option作为echarts显示数据的值
	if(com == "steel_c"){
		return tab1option;
	}
	if(com == "steel_si"){
		return tab2option;
	}	
	if(com == "steel_mn"){
		return tab3option;
	}
	if(com == "steel_p"){
		return tab4option;
	}	
	if(com == "steel_s"){
		return tab5option;
	}	
	if(com == "steel_als"){
		return tab6option;
	}	
	if(com == "steel_ti"){
		return tab7option;
	}	
	if(com == "steel_nb"){
		return tab8option;
	}	
}

//--------------------------------------直方图函数function--------------------------------------------
//--------------------------------------------------------------------------------------------------------------
//决定echarts内容的函数 setOption结束，第一个参数是钢种名称，第二个参数是想要查询的元素
//--------------------------------------------------------------------------------------------------------------








// 从HTML中选择并且初始化用于展示echarts的div
var tab1Table = echarts.init(document.getElementById('myBarDiv1'));
// var tab11Table = echarts.init(document.getElementById('myBarDiv2'));

//  用jQ来改变导航栏的选定情况  为后面的加载Echarts内容做引导
$(document).ready(function(){
	
	$.ajax({
        type : "post",
        async : false, //同步执行
        url : "getData.do",
        data : {},
        dataType : "json", //返回数据形式为json
        success : function(result) {
        if (result) {	  
        	var array = [];	                                        	 	                                        	                            	
        	for (let i=0; i<result.length; i++) {
        //这里下面的if条件判断把得到的json数据中所有的钢种都添加到数组all中  可以用于添加到下拉菜单中
        		if(all_alloy_sorts.indexOf(result[i].steel_name) == -1){
        			all_alloy_sorts.push(result[i].steel_name);
        	    }
        	}
//         	下面的clg是在控制台输出从json中得到的所有不重复的钢种名称，仅作为测试，可以删除或者注释掉。
//          	console.log(all_alloy_sorts);     	
        }        
    },
    error : function(errorMsg) {
        alert("不好意思，图表请求数据失败啦!");
        myChart1.hideLoading();
    }
   })
	
	
	//之前用ajax把json数据中所有钢种的名字都存在all_alloy_sorts数组中，现在要把钢种全部读入到select下拉的option中
	for (let index = 0; index < all_alloy_sorts.length; index++) {
	    $("#btn").append("<option value='"+all_alloy_sorts[index]+"'>"+all_alloy_sorts[index]+"</option>");
	}
  
	tab1Table.setOption(setOption("HPB300","steel_c")); 
// 	tab11Table.setOption(frequency("HPB300","steel_c")); 
// btn的点击功能  需要点击按钮才可以查询出来
	$("button").click(function(){
  	    var $op = $(".select-one").find("option:selected").attr("value");
// $op中存放的是 select下拉菜单中选定的钢种名称    再选择想要查询的合金点击查询按钮才能显示图表
// $op选择出来后会当做第一个参数来传给setOption函数
		if($(".select-two").find("option:selected").attr("value") == 'C'){
			tab1Table.dispose();
// 			document.getElementById('myBarDiv1')
// 			tab1Table.clear();
// 			tab11Table.clear();  如果不使用dispose会在console输出一个警告“已经有一个echart存在于dom中了”
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
// 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_c")); 
// 			tab11Table.setOption(frequency($op,"steel_c")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Si'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_si")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Mn'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_mn")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'P'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_p")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'S'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_s")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Als'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_als")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Ti'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_ti")); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Nb'){
			tab1Table.dispose();
// 			tab1Table.clear();
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
			tab1Table.setOption(setOption($op,"steel_nb")); 
		}
		
  	  })
});
</script>
</body>
</html>