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


<!--------------------------------- CSS部分 ----------------------------->
<style>
ul {
/*             display: flex; */
/*             flex-flow: row nowrap; */
/*              整个li实现在page居中 */ 
/*             justify-content: center;  */
			list-style: none;
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
		margin-top:12px;
		height:30px;
		weight:200px;
}
.time{
	margin-left:75px;
	margin-top:20px;
	font-weight:700;
}
.time input{
	height:24px;
	width:145px;
	font-weight:700;
	margin-left:11px;
	margin-right:11px;
	font-size:16px;
}
.top ul{
            list-style: none;
            padding-left:175px;
            height: 38px;
            
       }
#e-container{
		margin-top:30px;
}
.top ul li{
            height: 38px;            
/*             background-color: grey; */
            float: left;
            margin-right:30px;
            font-weight:500;
            font-size:18px;
            padding:7px;  
            line-height: 38px;
        }
.top ul li:hover{
			cursor: pointer;
}
.none{
            display: none;
        }
.block{
            display: block;
        }
.highlight{
            border-right: 2px solid grey;
            border-left: 2px solid grey;
		    border-top : 2px solid grey;  
		    border-bottom : 2px solid grey; 
		    border-radius :3px;
/* 		    padding:7px;   */
		    color:blue;
		    font-weight:700;
		    line-height: 38px;
		           
        }
.useborder{
/* 	border-top: 1px solid grey; */
}
</style>
<!--------------------------------- CSS部分 ----------------------------->



</head>
<body>
<%-- <jsp:include page="include.jsp" /> --%>
<div class="container">
	<div class="time">
        请选择起始时间点    <input type="date" name="" id="date1" value="">
        请选择结束时间点 <input type="date" name="" id="date2" value="">
    </div>
	<div class="top-nav">
	
	
		<div class="select-one">
		
		<span><b>下拉选择钢种类型</b></span>
    	<select name="" id="btn">
        </select>
        </div>
        
        <div class="select-one">
        <span><b>下拉选择班组名称</b></span>
    	<select name="" id="team" class="team">
    	<option value="甲">甲</option>
    	<option value="乙">乙</option>
    	<option value="丙">丙</option>
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
		<a  class = "btn btn-primary btn-sm" href="${BasePath}/manageProducePara" style="font-size: 16px;font-weight:700;" > 返回</a>	
	    </div>
	    
	<div id="e-container">
		<div class="top">
            <ul>
                <li id="shuju" class="highlight">数据展示</li>
                <li id="pinci">频次展示</li>
            </ul>
        </div>
<!-- 	用于展示echarts的div盒子，分布直方图 -->
		<div id="myBarDiv1" class="Echart chart block useborder"></div>
<!-- 	用于展示echarts的div盒子，成分出现频次图 -->
		<div id="myBarDiv2" class="Echart chart none useborder"></div>
	</div>	
</div>





<!-------------- JS主要部分-------------- -->

<script type="text/javascript">

//颜色数组  声明为全局给echarts中使用
var colors = ["#4169E1","#CD853F","#808000" ,"#5EBEFC"];
var colorss = ["red","grey" ,"red"];
//all_alloy_sorts用来存所有的钢种类型    内容在后面由ajax读入到数组中
var all_alloy_sorts =[];
//alldatas保存的是异步请求的全部数据
var alldatas = [];
//var fre_steel_c = [];
// var fre_steel_c_x = [];
// var fre_steel_c_time = [];



//把异步请求写在一个函数内 把请求到的结果全部保留在全局下  这样一次就只需要一次异步请求了
//coordinate函数返回值就是异步请求到的全部数据
var coordinates = (function() {
    var result;
    $.ajax({
        type:'post',
        url:"getData.do",
        dataType:'json',
        data:{},
        async:false,
        success:function(data){
            result = data;
        }
    });
    return result;
})();
//保存在全局下的alldatas中并且测试输出
alldatas = coordinates
//console.log(alldatas);
//coordinate函数结束-------------------------------------------





//频次表格函数
function frequency(alloy,com,time1,time2,team){
	var foption1;
	var foption2;
	var foption3;
	var foption4;
	var foption5;
	var foption6;
	var foption7;
	var foption8;


	var falloy_Adate = [];
	var falloy_Bdate = [];
	var falloy_Cdate = [];
	var falloy_Ddate = [];
	var falloy_Edate = [];
	var falloy_Fdate = [];
	var falloy_Gdate = [];
	var falloy_Hdate = [];
	
	var fre_steel_c = [];
	var fre_steel_si = [];
	var fre_steel_mn = [];
	var fre_steel_p = [];
	var fre_steel_s = [];
	var fre_steel_als = [];
	var fre_steel_ti = [];
	var fre_steel_nb = [];

	
	for (let i = 0; i < alldatas.length; i++) {  
        //-------------八个对应的时间筛选-----------              	
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_c") {
            falloy_Adate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_si") {
            falloy_Bdate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_mn") {
            falloy_Cdate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_p") {
            falloy_Ddate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_s") {
            falloy_Edate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_als") {
            falloy_Fdate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_ti") {
            falloy_Gdate.push(alldatas[i]);
        }
        if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_nb") {
            falloy_Hdate.push(alldatas[i]);
        }
	}
	//console.log(falloy_Adate);
// 	console.log(falloy_Bdate);
// 	console.log(falloy_Cdate);
// 	console.log(falloy_Ddate);
// 	console.log(falloy_Edate);
// 	console.log(falloy_Fdate);
// 	console.log(falloy_Gdate);
// 	console.log(falloy_Hdate);

	

	for (let i=0; i<falloy_Adate.length; i++) {
		if(fre_steel_c.indexOf(falloy_Adate[i].steel_c) == -1){
			fre_steel_c.push(falloy_Adate[i].steel_c);
		}
	}
	for (let i=0; i<falloy_Bdate.length; i++) {
		if(fre_steel_si.indexOf(falloy_Bdate[i].steel_si) == -1){
			fre_steel_si.push(falloy_Bdate[i].steel_si);
		}
	}
	for (let i=0; i<falloy_Cdate.length; i++) {
		if(fre_steel_mn.indexOf(falloy_Cdate[i].steel_mn) == -1){
			fre_steel_mn.push(falloy_Cdate[i].steel_mn);
		}
	}
	for (let i=0; i<falloy_Ddate.length; i++) {
		if(fre_steel_p.indexOf(falloy_Ddate[i].steel_p) == -1){
			fre_steel_p.push(falloy_Ddate[i].steel_p);
		}
	}
	for (let i=0; i<falloy_Edate.length; i++) {
		if(fre_steel_s.indexOf(falloy_Edate[i].steel_s) == -1){
			fre_steel_s.push(falloy_Edate[i].steel_s);
		}
	}
	for (let i=0; i<falloy_Fdate.length; i++) {
		if(fre_steel_als.indexOf(falloy_Fdate[i].steel_als) == -1){
			fre_steel_als.push(falloy_Fdate[i].steel_als);
		}
	}
	for (let i=0; i<falloy_Gdate.length; i++) {
		if(fre_steel_ti.indexOf(falloy_Gdate[i].steel_ti) == -1){
			fre_steel_ti.push(falloy_Gdate[i].steel_ti);
		}
	}
	for (let i=0; i<falloy_Hdate.length; i++) {
		if(fre_steel_nb.indexOf(falloy_Hdate[i].steel_nb) == -1){
			fre_steel_nb.push(falloy_Hdate[i].steel_nb);
		}
	}
// 	console.log(fre_steel_c);
// 	console.log(fre_steel_si);
	fre_steel_c.sort(function(a, b){return a - b}); 
	fre_steel_si.sort(function(a, b){return a - b});
	fre_steel_mn.sort(function(a, b){return a - b});
	fre_steel_p.sort(function(a, b){return a - b});
	fre_steel_s.sort(function(a, b){return a - b});
	fre_steel_als.sort(function(a, b){return a - b});
	fre_steel_ti.sort(function(a, b){return a - b});
	fre_steel_nb.sort(function(a, b){return a - b});
	
// 	console.log(fre_steel_c);
// 	console.log(fre_steel_si);
// 	console.log(fre_steel_mn);
// 	console.log(fre_steel_p);


	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_c_data = new Array(fre_steel_c.length);
	for(let num=0;num<fre_steel_c_data.length;num++){
		fre_steel_c_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Adate.length;t++){
		for(let tt=0;tt<fre_steel_c_data.length;tt++){
			if(falloy_Adate[t].steel_c == fre_steel_c[tt]){
				fre_steel_c_data[tt]++;
			}
		}
	}


	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_si_data = new Array(fre_steel_si.length);
	for(let num=0;num<fre_steel_si_data.length;num++){
		fre_steel_si_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Bdate.length;t++){
		for(let tt=0;tt<fre_steel_si_data.length;tt++){
			if(falloy_Bdate[t].steel_si == fre_steel_si[tt]){
				fre_steel_si_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_mn_data = new Array(fre_steel_mn.length);
	for(let num=0;num<fre_steel_mn_data.length;num++){
		fre_steel_mn_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Cdate.length;t++){
		for(let tt=0;tt<fre_steel_mn_data.length;tt++){
			if(falloy_Cdate[t].steel_mn == fre_steel_mn[tt]){
				fre_steel_mn_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_p_data = new Array(fre_steel_p.length);
	for(let num=0;num<fre_steel_p_data.length;num++){
		fre_steel_p_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Ddate.length;t++){
		for(let tt=0;tt<fre_steel_p_data.length;tt++){
			if(falloy_Ddate[t].steel_p == fre_steel_p[tt]){
				fre_steel_p_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_s_data = new Array(fre_steel_s.length);
	for(let num=0;num<fre_steel_s_data.length;num++){
		fre_steel_s_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Edate.length;t++){
		for(let tt=0;tt<fre_steel_s_data.length;tt++){
			if(falloy_Edate[t].steel_s == fre_steel_s[tt]){
				fre_steel_s_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_als_data = new Array(fre_steel_als.length);
	for(let num=0;num<fre_steel_als_data.length;num++){
		fre_steel_als_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Fdate.length;t++){
		for(let tt=0;tt<fre_steel_als_data.length;tt++){
			if(falloy_Fdate[t].steel_als == fre_steel_als[tt]){
				fre_steel_als_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_ti_data = new Array(fre_steel_ti.length);
	for(let num=0;num<fre_steel_ti_data.length;num++){
		fre_steel_ti_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Gdate.length;t++){
		for(let tt=0;tt<fre_steel_ti_data.length;tt++){
			if(falloy_Gdate[t].steel_ti == fre_steel_ti[tt]){
				fre_steel_ti_data[tt]++;
			}
		}
	}

	//-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
	let fre_steel_nb_data = new Array(fre_steel_nb.length);
	for(let num=0;num<fre_steel_nb_data.length;num++){
		fre_steel_nb_data[num]=0;
	}
	//-----遍历所有原始数据，每一个数再和
	for(let t=0;t<falloy_Hdate.length;t++){
		for(let tt=0;tt<fre_steel_nb_data.length;tt++){
			if(falloy_Hdate[t].steel_nb == fre_steel_nb[tt]){
				fre_steel_nb_data[tt]++;
			}
		}
	}
	
	

	foption1 = {
			color: colorss,			
			calculable : true,
			legend : {
				data : ['C出现频次直方图','C出现频次频次图'],
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
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_c
			
			} ],
							
// 			yAxis : [{
// 				type : 'value',
// 				name : 'C出现频次直方图'								   								
// 			},
// 			{
// 				type : 'value',
// 				name : 'C出现频次频次图'								   								
// 			}] ,
			yAxis : {
 				type : 'value',
 				name : 'C出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "C出现频次频次图",
				"type" : "line",
				"data" : fre_steel_c_data,
				smooth: true,
           				  markPoint : {
//           					itemStyle:{
//           						normal:{
//           							color:'#4169E1'
//           						}
//           					},
//
//                               在数据中标注出最大值和最小值
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {
//           					itemStyle:{
//           						normal:{
//           							lineStyle: { 
//           	                            type: 'dotted', 
//           	                            width:3 
//           	                        }, 
//           							color:'grey'
//           						}
//           					},

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "C出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_c_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
//           					itemStyle:{
//           						normal:{
//           							lineStyle: { 
//           	                            type: 'dotted', 
//           	                            width:3 
//           	                        }, 
// //           							color:'#000'
//           						}
//           					},

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



	foption2 = {
			color: colorss,
			calculable : true,
			legend : {
				data : ['Si出现频次直方图','Si出现频次频次图'],
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
                        lang: ['Si出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"Si出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_si
			
			} ],
							
			yAxis : {
 				type : 'value',
 				name : 'Si出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "Si出现频次频次图",
				"type" : "line",
				"data" : fre_steel_si_data,
				smooth: true,
           				  markPoint : {
//           					itemStyle:{
//           						normal:{
//           							color:'#4169E1'
//           						}
//           					},
//
//                               在数据中标注出最大值和最小值
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {
//           					itemStyle:{
//           						normal:{
//           							lineStyle: { 
//           	                            type: 'dotted', 
//           	                            width:3 
//           	                        }, 
//           							color:'grey'
//           						}
//           					},

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "Si出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_si_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {

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



	foption3 = {
			color: colorss,			
			calculable : true,
			legend : {
				data : ['Mn出现频次直方图','Mn出现频次频次图'],
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
                        lang: ['Mn出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"Mn出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_mn
			
			} ],
							
			yAxis : {
 				type : 'value',
 				name : 'Mn出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "Mn出现频次频次图",
				"type" : "line",
				"data" : fre_steel_mn_data,
				smooth: true,
           				  markPoint : {
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {
          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "Mn出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_mn_data,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
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



	foption4 = {
			color: colorss,		
			calculable : true,
			legend : {
				data : ['P出现频次直方图','P出现频次频次图'],
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
                        lang: ['P出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"P出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_p
			
			} ],						
			yAxis : {
 				type : 'value',
 				name : 'P出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "P出现频次频次图",
				"type" : "line",
				"data" : fre_steel_p_data,
				smooth: true,
           				  markPoint : {
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {


          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "P出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_p_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {

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



	foption5 = {
			color: colorss,			
			calculable : true,
			legend : {
				data : ['S出现频次直方图','S出现频次频次图'],
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
                        lang: ['S出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"S出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_s
			
			} ],
							
			yAxis : {
 				type : 'value',
 				name : 'S出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "S出现频次频次图",
				"type" : "line",
				"data" : fre_steel_s_data,
				smooth: true,
           				  markPoint : {

          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {
          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "S出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_s_data,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
//           					itemStyle:{
//           						normal:{
//           							lineStyle: { 
//           	                            type: 'dotted', 
//           	                            width:3 
//           	                        }, 
// //           							color:'#000'
//           						}
//           					},

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



	foption6 = {
			color: colorss,			
			calculable : true,
			legend : {
				data : ['Als出现频次直方图','Als出现频次频次图'],
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
                        lang: ['Als出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"Als出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_als
			
			} ],
							

			yAxis : {
 				type : 'value',
 				name : 'Als出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "Als出现频次频次图",
				"type" : "line",
				"data" : fre_steel_als_data,
				smooth: true,
           				  markPoint : {
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "Als出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_als_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {

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



	foption7 = {
			color: colorss,			
			calculable : true,
			legend : {
				data : ['Ti出现频次直方图','Ti出现频次频次图'],
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
                        lang: ['Ti出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"Ti出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_ti
			
			} ],
							
			yAxis : {
 				type : 'value',
 				name : 'Ti出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "Ti出现频次频次图",
				"type" : "line",
				"data" : fre_steel_ti_data,
				smooth: true,
           				  markPoint : {

          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "Ti出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_ti_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {
			

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



	foption8 = {
			color: colorss,
			calculable : true,
			legend : {
				data : ['Nb出现频次直方图','Nb出现频次频次图'],
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
                        lang: ['Nb出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
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
                        name:"Nb出现频次",
                        fontSize: 150
                    },
                    magicType: {
                        // show: true,
                        type: ['line','bar']
                    }
                }
            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {
                    type: 'cross',
                    label: {
                        backgroundColor: '#283b56'
                    }
                }
           },
			dataZoom: [{
               
                    color: '#fff',
                    shadowBlur: 3, type: 'inside', //inside
                start: 0,
                end: 100
            }, {
                start: 0,
                end: 10,
                handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
                handleSize: '80%',
                handleStyle: {
                    shadowColor: 'rgba(0, 0, 0, 0.6)',
                    shadowOffsetX: 2,
                    shadowOffsetY: 2
                }
            }],
			xAxis : [ {
				type : 'category',
				name : '出现过的数据',
                axisLine: {
                    show: true,
                    lineStyle: {
                        color: '#000000'
                    }
                },
                axisLabel: {
                    interval: 0,
                    rotate:0,
                    textStyle: {
                        color: '#000000',
                        fontSize: 15,
                        fontFamily:'Times New Roman'
                    }
                },
                axisTick: {
                    show: false
                },
				data :fre_steel_nb
			
			} ],
							

			yAxis : {
 				type : 'value',
 				name : 'Nb出现频次图'								   								
 			},
 			
            axisTick: {
                show: false
            },
            splitLine: {
                show: false
            },
            axisLabel: {
                textStyle: {
                    color: 'grey',
                    fontSize: 15,
                    fontFamily:'Times New Roman'
                }
            },
            axisLine: {
                show: true,
                lineStyle: {
                    color: '#grey'
                }
            },
			series : [ {
				"name" : "Nb出现频次频次图",
				"type" : "line",
				"data" : fre_steel_nb_data,
				smooth: true,
           				  markPoint : {
          	                data : [
           	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
           	                ]
           	            },
          	            markLine : {

          	                data : [
          	                    {type : 'average', name: '平均值',
          	                    	label:{
	          	                          show:false,
	          	                          position:'begin',
	          	                          formatter: '{b}: {c}'	          	                          
	          	                      },
          	                    }
          	                ]
          	            }	                            
			},
			{
				"name" : "Nb出现频次直方图",
				"type" : "bar",
				"data" : fre_steel_nb_data,
// 				smooth: true,
          				  markPoint : {
          					itemStyle:{
          						normal:{
          							color:'grey'
          						}
          					},
          	                data : [
          	                    {type : 'max', name: '最大值'},
          	                    {type : 'min', name: '最小值'}
          	                ]
          	            },
          	            markLine : {


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
		return foption1;
	}
	if(com == "steel_si"){
		return foption2;
	}
	if(com == "steel_mn"){
		return foption3;
	}
	if(com == "steel_p"){
		return foption4;
	}
	if(com == "steel_s"){
		return foption5;
	}
	if(com == "steel_als"){
		return foption6;
	}
	if(com == "steel_ti"){
		return foption7;
	}
	if(com == "steel_nb"){
		return foption8;
	}
}

//统计出c含量所有出现过的含量数据
// for (let i=0; i<alldatas.length; i++) {
// 	if(fre_steel_c.indexOf(alldatas[i].steel_c) == -1){
// 		fre_steel_c.push(alldatas[i].steel_c);
// 	}
// }
//  //console.log(fre_steel_c);

// //对统计出的数据进行从小到大的排序 便于展示在横坐标
// fre_steel_c.sort(function(a, b){return a - b}); 
// //console.log(fre_steel_c);

// //-----创建一个长度和fre_steel_c数组长度相同的数组，所有值初始未0
// let fre_arr = new Array(fre_steel_c.length);
// for(let num=0;num<fre_arr.length;num++){
// 	fre_arr[num]=0;
// }
// //-----遍历所有原始数据，每一个数再和
// for(let t=0;t<alldatas.length;t++){
// 	for(let tt=0;tt<fre_arr.length;tt++){
// 		if(alldatas[t].steel_c == fre_steel_c[tt]){
// 			fre_arr[tt]++;
// 		}
// 	}
// }
// console.log(fre_arr)

//---------------------------------------------



//频度图像对应的那个option
// option1 = {
// 			color: colorss,
// 			tooltip : {
// 				show : true,
//                 axisPointer: {
//                     type: 'shadow'
//                 },
// 			},
// 			calculable : true,
// 			legend : {
// 				data : ['C出现频次直方图','C出现频次频次图'],
//                 left: 'center',
//                 y: '5%',
//                 itemWidth: 18,
//                 itemHeight: 12,
//                 textStyle: {
//                     color: '#000000',
//                     fontSize: 16
//                 },
// 			},
// 			grid: {
//                 left: '5%',
//                 top: '12%',
//                 bottom: '6%',
//                 right: "8%",
//                 containLabel: true
//             },
// //	            加入折线图和其他按钮的功能
//             toolbox: {
//             	itemSize:20,
//             	itemGap:20,
//                 orient: 'horizontal',
//                 right: '2.5%',
//                 top: '3%',
//                 iconStyle: {
//                     color: '#4169E1',
//                     textColor:'#FF69B4',
//                     textPosition:'left',
//                     borderColor: '#48D1CC',
//                     borderWidth: 1,
//                     emphasis:{
//                     	textPosition:'top'
//                     	}
//                 },
//                 feature: {	                	
//                     dataView : {                            //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新
//                         show: true,                         //是否显示该工具。
//                         title:"数据视图",

//                         readOnly: false,                    //是否不可编辑（只读）
//                         lang: ['C出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
//                         backgroundColor:"#ADD8E6",             //数据视图浮层背景色。
//                         textareaColor:"#fff",               //数据视图浮层文本输入区背景色
//                         textareaBorderColor:"#333",         //数据视图浮层文本输入区边框颜色
//                         textColor:"#000",                    //文本颜色。
//                         buttonColor:"#c23531",              //按钮颜色。
//                         buttonTextColor:"#fff",             //按钮文本颜色。
//                     },
//                     restore: { //重置
//                         show: true
//                     },
//                     dataZoom: { //数据缩放视图
//                         show: true
//                     },
//                     saveAsImage: {//保存图片
//                         show: true,
//                         name:"C出现频次",
//                         fontSize: 150
//                     },
//                     magicType: {
//                         // show: true,
//                         type: ['line','bar']
//                     }
//                 }
//             },
// 			tooltip: {
//                 trigger: 'axis',
//                 axisPointer: {
//                     type: 'shadow'
//                 },
//             },
// 			dataZoom: [{
               
//                     color: '#fff',
//                     shadowBlur: 3, type: 'inside', //inside
//                 start: 0,
//                 end: 70
//             }, {
//                 start: 0,
//                 end: 10,
//                 handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
//                 handleSize: '80%',
//                 handleStyle: {
//                     shadowColor: 'rgba(0, 0, 0, 0.6)',
//                     shadowOffsetX: 2,
//                     shadowOffsetY: 2
//                 }
//             }],
// 			xAxis : [ {
// 				type : 'category',
// 				name : '出现过的数据',
//                 axisLine: {
//                     show: true,
//                     lineStyle: {
//                         color: '#000000'
//                     }
//                 },
//                 axisLabel: {
//                     interval: 0,
//                     rotate:0,
//                     textStyle: {
//                         color: '#000000',
//                         fontSize: 15,
//                         fontFamily:'Times New Roman'
//                     }
//                 },
//                 axisTick: {
//                     show: false
//                 },
// 				data :fre_steel_c
			
// 			} ],							
// 			yAxis : {
//  				type : 'value',
//  				name : 'C出现频次图'								   								
//  			},
 			
//             axisTick: {
//                 show: false
//             },
//             splitLine: {
//                 show: false
//             },
//             axisLabel: {
//                 textStyle: {
//                     color: 'grey',
//                     fontSize: 15,
//                     fontFamily:'Times New Roman'
//                 }
//             },
//             axisLine: {
//                 show: true,
//                 lineStyle: {
//                     color: '#grey'
//                 }
//             },
// 			series : [ {
// 				"name" : "C出现频次频次图",
// 				"type" : "line",
// 				"data" : fre_arr,
// 				smooth: true,
//            				  markPoint : {
// //           					itemStyle:{
// //           						normal:{
// //           							color:'#4169E1'
// //           						}
// //           					},
// //
// //                               在数据中标注出最大值和最小值
//           	                data : [
//            	                    {type : 'max', name: '最大值'},
//           	                    {type : 'min', name: '最小值'}
//            	                ]
//            	            },
//           	            markLine : {
// //           					itemStyle:{
// //           						normal:{
// //           							lineStyle: { 
// //           	                            type: 'dotted', 
// //           	                            width:3 
// //           	                        }, 
// //           							color:'grey'
// //           						}
// //           					},

//           	                data : [
//           	                    {type : 'average', name: '平均值',
//           	                    	label:{
// 	          	                          show:false,
// 	          	                          position:'begin',
// 	          	                          formatter: '{b}: {c}'	          	                          
// 	          	                      },
//           	                    }
//           	                ]
//           	            }	                            
// 			},
// 			{
// 				"name" : "C出现频次直方图",
// 				"type" : "bar",
// 				"data" : fre_arr,
// // 				smooth: true,
//           				  markPoint : {
//           					itemStyle:{
//           						normal:{
//           							color:'grey'
//           						}
//           					},
//           	                data : [
//           	                    {type : 'max', name: '最大值'},
//           	                    {type : 'min', name: '最小值'}
//           	                ]
//           	            },
//           	            markLine : {
// //           					itemStyle:{
// //           						normal:{
// //           							lineStyle: { 
// //           	                            type: 'dotted', 
// //           	                            width:3 
// //           	                        }, 
// // //           							color:'#000'
// //           						}
// //           					},

//           	                data : [
//           	                    {type : 'average', name: '平均值',
//           	                    	label:{
// 	          	                          show:true,
// 	          	                          position:'begin',
// 	          	                          formatter: '{b}: {c}'	          	                          
// 	          	                      },
//           	                    }
//           	                ]
//           	            }	                            
// 			}										
// 			]            
// 		};

 
//-------------------------------------------

//频次表格函数
// function frequency(alloy,com){
// 	var option1;
	
// 	var x_steelc = [];
// 	var y_steelc = [];

// // 	for (let i = 0; i < alldatas.length; i++) {                	
// // //                 	根据钢种名称种类来添加横坐标的时间                    
// // 	if (alldatas[i].steel_name == alloy && com=="steel_c") {
// // 		if(x_steelc.indeOf(alldatas[i].steel_c) != -1){
// // 			x_steelc.push(alldatas[i].steel_c);
// // 		}
// // 	}
// // 	x_steelc.sort(function(a, b){return a - b}); 
// //     console.log(x_steelc);

// //                 for (let i = 0; i < result.length; i++) {                	
// // //                 	根据钢种名称种类来添加横坐标的时间                    
// //                    if (result[i].steel_name == alloy && com=="steel_c") {
// //                 	  	if(x_steelc.indeOf(result[i].steel_c) != -1){
// //                 		   x_steelc.push(result[i].steel_c);
// //                 	   }
// //                     } 
// //                 }
// //                 x_steelc.sort(function(a, b){return a - b}); 
// //                 console.log(x_steelc);
                
// // 				var y_steelc = new Array(x_steelc.length).fill(0);
// // 				console.log(y_steelc);
// // 				for(let i = 0; i < result.length; i++){
// // 					if(x_steelc.indeOf(result[i].steel_c) != -1){
// // 						y_steelc[x_steelc.indeOf(result[i].steel_c)]++;
// // 					}
// // 				}
// //             }
// //         }

// 	option1 = {
// 			color: colors,
// 			tooltip : {
// 				show : true,
//                 axisPointer: {
//                     type: 'shadow'
//                 },
// 			},
// 			calculable : true,
// 			legend : {
// 				data : ['C出现频次'],
//                 left: 'center',
//                 y: '5%',
//                 itemWidth: 18,
//                 itemHeight: 12,
//                 textStyle: {
//                     color: '#000000',
//                     fontSize: 16
//                 },
// 			},
// 			grid: {
//                 left: '5%',
//                 top: '12%',
//                 bottom: '6%',
//                 right: "8%",
//                 containLabel: true
//             },
// //	            加入折线图和其他按钮的功能
//             toolbox: {
//             	itemSize:20,
//             	itemGap:20,
//                 orient: 'horizontal',
//                 right: '2.5%',
//                 top: '3%',
//                 iconStyle: {
//                     color: '#4169E1',
//                     textColor:'#FF69B4',
//                     textPosition:'left',
//                     borderColor: '#48D1CC',
//                     borderWidth: 1,
//                     emphasis:{
//                     	textPosition:'top'
//                     	}
//                 },
//                 feature: {	                	
//                     dataView : {                            //数据视图工具，可以展现当前图表所用的数据，编辑后可以动态更新
//                         show: true,                         //是否显示该工具。
//                         title:"数据视图",

//                         readOnly: false,                    //是否不可编辑（只读）
//                         lang: ['C出现频次', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
                        
//                         backgroundColor:"#ADD8E6",             //数据视图浮层背景色。
//                         textareaColor:"#fff",               //数据视图浮层文本输入区背景色
//                         textareaBorderColor:"#333",         //数据视图浮层文本输入区边框颜色
//                         textColor:"#000",                    //文本颜色。
//                         buttonColor:"#c23531",              //按钮颜色。
//                         buttonTextColor:"#fff",             //按钮文本颜色。
//                     },
//                     restore: { //重置
//                         show: true
//                     },
//                     dataZoom: { //数据缩放视图
//                         show: true
//                     },
//                     saveAsImage: {//保存图片
//                         show: true,
//                         name:"C出现频次",
//                         fontSize: 150
//                     },
//                     magicType: {
//                         // show: true,
//                         type: ['line','bar','stack','tiled']
//                     }
//                 }
//             },
// 			tooltip: {
//                 trigger: 'axis',
//                 axisPointer: {
//                     type: 'shadow'
//                 },
//             },
// 			dataZoom: [{
//                 type: 'inside',
//                 start: 0,
//                 end: 10
//             }, {
//                 start: 0,
//                 end: 10,
//                 handleIcon: 'M10.7,11.9v-1.3H9.3v1.3c-4.9,0.3-8.8,4.4-8.8,9.4c0,5,3.9,9.1,8.8,9.4v1.3h1.3v-1.3c4.9-0.3,8.8-4.4,8.8-9.4C19.5,16.3,15.6,12.2,10.7,11.9z M13.3,24.4H6.7V23h6.6V24.4z M13.3,19.6H6.7v-1.4h6.6V19.6z',
//                 handleSize: '80%',
//                 handleStyle: {
//                     color: '#fff',
//                     shadowBlur: 3,
//                     shadowColor: 'rgba(0, 0, 0, 0.6)',
//                     shadowOffsetX: 2,
//                     shadowOffsetY: 2
//                 }
//             }],
// 			xAxis : [ {
// 				type : 'category',
// 				name : '日期',
//                 axisLine: {
//                     show: true,
//                     lineStyle: {
//                         color: '#000000'
//                     }
//                 },
//                 axisLabel: {
//                     interval: 5,
//                     textStyle: {
//                         color: '#000000',
//                         fontSize: 15,
//                         fontFamily:'Times New Roman'
//                     }
//                 },
//                 axisTick: {
//                     show: false
//                 },
// 				data :fre_steel_c
			
// 			} ],
// 			yAxis : [ {
// 				type : 'value',
// 				name : 'C出现频次'
// 			} ],
//             axisTick: {
//                 show: false
//             },
//             splitLine: {
//                 show: false
//             },
//             axisLabel: {
//                 textStyle: {
//                     color: '#000000',
//                     fontSize: 15,
//                     fontFamily:'Times New Roman'
//                 }
//             },
//             axisLine: {
//                 show: true,
//                 lineStyle: {
//                     color: '#000000'
//                 }
//             },
// 			series : [ {
// 				"name" : "C出现频次",
// 				"type" : "bar",
// 				"data" : fre_arr,
//           				  markPoint : {
//           					itemStyle:{
//           						normal:{
//           							color:'#4169E1'
//           						}
//           					},
//           	                data : [
//           	                    {type : 'max', name: '最大值'},
//           	                    {type : 'min', name: '最小值'}
//           	                ]
//           	            },
//           	            markLine : {
//           					itemStyle:{
//           						normal:{
//           							lineStyle: { 
//           	                            type: 'dotted', 
//           	                            width:3 
//           	                        }, 
//           							color:'#4169E1'
//           						}
//           					},

//           	                data : [
//           	                    {type : 'average', name: '平均值',
//           	                    	label:{
// 	          	                          show:true,
// 	          	                          position:'begin',
// 	          	                          formatter: '{b}: {c}'	          	                          
// 	          	                      },
//           	                    }
//           	                ]
//           	            }	                            
// 			}					
// 			]            
// 		};
// 	if(com == "steel_c"){
// 		return option1;
// 	}
// }











//  --------------------------------------------------------------------------------------------------------------
// 决定echarts内容的函数 setOption，五个参数分别是 合金名称，成分名称，起始时间，终止时间，班组名
//  --------------------------------------------------------------------------------------------------------------
//  ----------------------五个参数分别是 合金名称，成分名称，起始时间，终止时间，班组名-------------------------------
function setOption(alloy,com,time1,time2,team) {	

//  因为成分是写死的只有 c si mn p s als ti nb一共八种 所以是根据成分来返回对应的option
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

// 如 alloy_Cc表示的是---班次丙的碳含量    会根据参数中钢种种类自己划分

//  根据选的不同成分会有8个横坐标时间   保存在一下的8个数组data中
	var alloy_Adate = [];
	var alloy_Bdate = [];
	var alloy_Cdate = [];
	var alloy_Ddate = [];
	var alloy_Edate = [];
	var alloy_Fdate = [];
	var alloy_Gdate = [];
	var alloy_Hdate = [];

//  下面的8个数组是根据读到的条件来保存符合条件的数据
	var alloy_Ac = [];
	var alloy_Asi = [];
	var alloy_Amn = [];
	var alloy_Ap = [];
	var alloy_As = [];
	var alloy_Aals = [];
	var alloy_Ati = [];
	var alloy_Anb = [];



//---------------------对所有的原始数据按照选择的条件进行筛选----------------------------------
                for (let i = 0; i < alldatas.length; i++) {  
                    //-------------八个对应的时间筛选-----------              	
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_c") {
                        alloy_Adate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_si") {
                        alloy_Bdate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_mn") {
                        alloy_Cdate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_p") {
                        alloy_Ddate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_s") {
                        alloy_Edate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_als") {
                        alloy_Fdate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_ti") {
                        alloy_Gdate.push(alldatas[i].produce_date);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_nb") {
                        alloy_Hdate.push(alldatas[i].produce_date);
                    }
                  //-------------八个对应的成分数据筛选----------- 
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_c") {
                        alloy_Ac.push(alldatas[i].steel_c);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com =="steel_si") {
                    	alloy_Asi.push(alldatas[i].steel_si);
                    }
                  
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_mn") {
                    	alloy_Amn.push(alldatas[i].steel_mn);
                    }               
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_p") {
                    	alloy_Ap.push(alldatas[i].steel_p);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_s") {
                    	alloy_As.push(alldatas[i].steel_s);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_als") {
                    	alloy_Aals.push(alldatas[i].steel_als);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_ti") {
                    	alloy_Ati.push(alldatas[i].steel_ti);
                    }
                    if (alldatas[i].steel_name == alloy && alldatas[i].class_no == team && alldatas[i].produce_date > time1 && alldatas[i].produce_date <time2 && com=="steel_nb") {
                    	alloy_Anb.push(alldatas[i].steel_nb);
                    }                
                }                                
                  
          


//-------------下面是八个option 根据选择的成分返回不同的option来作为echarts的参数
tab1option = {
				color: colors,
				calculable : true,
				legend : {
					data : [ '所选班次的C含量' ],
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
	            //datazoom是下面横坐标可以拖动的工具
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
		                //interval指的是横坐标数据隔多少个显示一次 因为数据太多会挤在一起
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
	                //横坐标的数据来源就是下面的这个data
					data :alloy_Adate
				
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
				series :  {
					"name" : "所选班次的C含量",
					"type" : "bar",
					//对应纵坐标的数据来源是下面的这个data
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
				}
                
			};
			
//----------------------------------------------------
tab2option = {
				color: colors,
				calculable : true,
				legend : {
					data : [ '所选班次的Si含量' ],
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
	                        lang: ['Si含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"Si含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Bdate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'Si含量(%)'
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
				series :  {
					"name" : "所选班次的Si含量",
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
				}
                
			};
			
//-----------------------------------------------------------

tab3option = {
				color: colors,				
				calculable : true,
				legend : {
					data : [ '所选班次的Mn含量' ],
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
	                        title:"所选班次的Mn含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['Mn含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"Mn含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Cdate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'Mn含量(%)'
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
				series :  {
					"name" : "所选班次的Mn含量",
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
				}
                
			};
//-----------------------------------------------------------

tab4option = {
				color: colors,				
				calculable : true,
				legend : {
					data : [ '所选班次的P含量' ],
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
	                        title:"所选班次的P含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['P含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"P含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Ddate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'P含量(%)'
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
				series :  {
					"name" : "所选班次的P含量",
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
				}
                
			};
//-----------------------------------------------------------

tab5option = {
				color: colors,			
				calculable : true,
				legend : {
					data : [ '所选班次的S含量' ],
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
	                        title:"所选班次的S含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['S含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"S含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Edate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'S含量(%)'
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
				series :  {
					"name" : "所选班次的S含量",
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
				}
                
			};
//-----------------------------------------------------------

tab6option = {
				color: colors,
				calculable : true,
				legend : {
					data : [ '所选班次的Als含量' ],
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
	                        title:"所选班次的Als含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['Als含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"Als含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Fdate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'Als含量(%)'
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
				series :  {
					"name" : "所选班次的Als含量",
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
				}
                
			};
//-----------------------------------------------------------

tab7option = {
				color: colors,
				calculable : true,
				legend : {
					data : [ '所选班次的Ti含量' ],
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
	                        title:"所选班次的Ti含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['Ti含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"Ti含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Gdate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'Ti含量(%)'
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
				series :  {
					"name" : "所选班次的Ti含量",
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
				}
                
			};
//-----------------------------------------------------------

tab8option = {
				color: colors,
				calculable : true,
				legend : {
					data : [ '所选班次的Nb含量' ],
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
	                        title:"所选班次的Nb含量",

	                        readOnly: false,                    //是否不可编辑（只读）
	                        lang: ['Nb含量(%)', '关闭', '刷新'],  //数据视图上有三个话术，默认是['数据视图', '关闭', '刷新']
	                        
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
	                        name:"Nb含量(%)",
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
	                    type: 'cross',
	                    label: {
	                        backgroundColor: '#283b56'
	                    }
	                }
	           },
				dataZoom: [{
	                type: 'inside',
	                start: 0,
	                end: 20
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
	                    interval: 3,
	                    textStyle: {
	                        color: '#000000',
	                        fontSize: 15,
	                        fontFamily:'Times New Roman'
	                    }
	                },
	                axisTick: {
	                    show: false
	                },
					data :alloy_Hdate
				
				} ],
				yAxis : [ {
					type : 'value',
					name : 'Nb含量(%)'
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
				series :  {
					"name" : "所选班次的Nb含量",
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
				}
                
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
var tab11Table = echarts.init(document.getElementById('myBarDiv2'));
//tab11Table.setOption(foption1); 
// var tab11Table = echarts.init(document.getElementById('myBarDiv2'));

//  用jQ来改变导航栏的选定情况  为后面的加载Echarts内容做引导
$(document).ready(function(){


// 	之前一次异步读取数据已经全部保留在全局下的alldatas下了  就不需要再次异步请求了  直接用alldatas即可
                                 	 	                                        	                            	
        	for (let i=0; i<alldatas.length; i++) {
        //这里下面的if条件判断把得到的json数据中所有的钢种都添加到数组all中  可以用于添加到下拉菜单中
        		if(all_alloy_sorts.indexOf(alldatas[i].steel_name) == -1){
        			all_alloy_sorts.push(alldatas[i].steel_name);
        	    }
        	}
//         	下面的clg是在控制台输出从json中得到的所有不重复的钢种名称，仅作为测试，可以删除或者注释掉。
//          	console.log(all_alloy_sorts);     	
//         }        
//     },
//     error : function(errorMsg) {
//         alert("不好意思，图表请求数据失败啦!");
//         myChart1.hideLoading();
//     }
//    })
	
	
	//之前用ajax把json数据中所有钢种的名字都存在all_alloy_sorts数组中，现在要把钢种全部读入到select下拉的option中
	for (let index = 0; index < all_alloy_sorts.length; index++) {
	    $("#btn").append("<option value='"+all_alloy_sorts[index]+"'>"+all_alloy_sorts[index]+"</option>");
	}
  
//	tab1Table.setOption(setOption($op,"steel_c",time1,time2,team)); 
//	tab11Table.setOption(frequency("HPB300","steel_c")); 
// btn的点击功能  需要点击按钮才可以查询出来


	//-------------------切换按钮-----------------
	
	$("#shuju").click(function(){ 
                $("#myBarDiv2").addClass("none").removeClass("block");
                $("#myBarDiv1").addClass("block").removeClass("none");
                $("#shuju").addClass("highlight");
                $("#pinci").removeClass("highlight");
            })
            $("#pinci").click(function(){ 
                $("#myBarDiv1").addClass("none").removeClass("block");
                $("#myBarDiv2").addClass("block").removeClass("none");
                $("#pinci").addClass("highlight");
                $("#shuju").removeClass("highlight");
            })
	
	//----------------------------------------
	$("button").click(function(){
  	    
// $op中存放的是 select下拉菜单中选定的钢种名称    再选择想要查询的合金点击查询按钮才能显示图表
// $op选择出来后会当做第一个参数来传给setOption函数
		var $op = $(".select-one").find("option:selected").attr("value");
			//team保存的是选择的班组信息   time1和time2分别保存的是  input：data中选择的起始时间和终止时间   这三个都会被作为函数的参数
			let time1 = $("#date1").val();
            let time2 = $("#date2").val();
            let team = $("#team").val();
		if($(".select-two").find("option:selected").attr("value") == 'C'){

			tab1Table.dispose();
 			tab11Table.dispose();
// 			document.getElementById('myBarDiv1')
// 			tab11Table.clear();  如果不使用dispose会在console输出一个警告“已经有一个echart存在于dom中了” 被dispose后的echarts对象需要重新初始化
		 	tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_c",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_c",time1,time2,team)); 

		}
		if($(".select-two").find("option:selected").attr("value") == 'Si'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_si",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_si",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Mn'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_mn",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_mn",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'P'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_p",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_p",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'S'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_s",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_s",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Als'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_als",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_als",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Ti'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_ti",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_ti",time1,time2,team)); 
		}
		if($(".select-two").find("option:selected").attr("value") == 'Nb'){
			tab1Table.dispose();
 			tab11Table.dispose();
 			tab1Table = echarts.init(document.getElementById('myBarDiv1'));
 		 	tab11Table = echarts.init(document.getElementById('myBarDiv2'));
			tab1Table.setOption(setOption($op,"steel_nb",time1,time2,team)); 
 			tab11Table.setOption(frequency($op,"steel_nb",time1,time2,team)); 
		}
		
  	  })
});
</script>
</body>
</html>