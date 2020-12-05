<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
  <title>汉中锌业</title>
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
        <div class="navbar navbar-light" style="background-color:#ffffff;" role="navigation">               
      <div style="float:left;margin-left:10px;display:inline; "><h2 style="color:#F8F8FF;font-weight: bold;"><img alt="" src="images/jian.png" style="height:160px"></h2></div>
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
                    <h2 class="obtain"><a href="zaiuzuole.jsp" style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">铁水预处理</a><i></i></h2>
                </li>
                <li>
                    <h2 class="obtain"><a href="index.jsp" style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">转炉炼钢</a><i></i></h2>
                </li>
                <li>
                    <h2 class="obtain"><a href="zaiuzuole.jsp" style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">炉外精炼</a><i></i></h2>
                </li>
                <li>
                    <h2 class="obtain"><a href="zaiuzuole.jsp" style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">连续铸钢</a><i></i></h2>
                </li>
                <li>
                    <h2 class="obtain"><a href="zaiuzuole.jsp" style="text-decoration:none;font-size:17px;color:#d9d919;font-weight: bold;">辅助材料</a><i></i></h2>
                </li>                             
            </ul>
        </div>
    </div>
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