<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()+ path;
%>
<!DOCTYPE html>
<!-- http://localhost:8080/energon/b_ide/bootstrap/module/FileInput/fileInputDemo.jsp-->
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

<!-- JQUERY -->
<script type="text/javascript" src="<%@=basePath%>/b_base/jquery-2.0.0.min.js" charset="utf-8"></script>
<!-- /JQUERY -->

<!-- BOOTSTRAP -->
<link rel="stylesheet" type="text/css" href="css/default.css">
<link href="css/fileinput.css" media="all" rel="stylesheet" type="text/css" />	
<link type="text/css" rel="stylesheet"  href="<%@=basePath%>/b_base/bootstrap-3.3.5/css/bootstrap.css"/>
<link type="text/css" rel="stylesheet"  href="<%@=basePath%>/b_base/bootstrap-3.3.5/css/bootstrap-theme.min.css"/>
<!-- js -->
<link href="<%@=basePath%>/b_ide/bootstrap/module/FileInput/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="<%@=basePath%>/b_ide/bootstrap/module/FileInput/js/fileinput.js" type="text/javascript"></script>
<script src="<%@=basePath%>/b_ide/bootstrap/module/FileInput/js/fileinput_locale_zh.js" type="text/javascript"></script>
</head>
<body>

<%-- <form action="${pageContext.request.contextPath}/servlet/UploadHandleServlet" enctype="multipart/form-data" method="post">
         上传用户：<input type="text" name="username"><br/>
         上传文件1：<input type="file" name="file1"><br/>
        上传文件2：<input type="file" name="file2"><br/>
	<input type="submit" value="提交">
</form> --%>
	<div class="htmleaf-container">
		<div class="container kv-main">
            <!-- <div class="page-header">
            <h2>单张上传 <small></h2>
            </div> -->
            <!-- <form enctype="multipart/form-data" id="uploadForm"  method = "post"> -->
                <input id="fileUpload" class="file" type="file" name="fileUpload"  multiple  data-show-preview="true">
            <!-- </form> -->
        </div>
	</div>
	
    <script>
	    $("#fileUpload").fileinput({
	        language : "zh",//设置语言
	        uploadUrl: "${pageContext.request.contextPath}/fileUpload/UploadHandleServlet",//上传地址
	        uploadAsync: true,//同步还是异步
	        showCaption:false,//是否显示标题
	        showUpload: true,//是否显示上传按钮
	        browseClass: "btn btn-primary", //按钮样式 
	        allowedFileExtensions : ['jpg', 'png','gif'],//接收的文件后缀
	        allowedFileTypes: ['image', 'video', 'flash'],//接收的文件类型['image', 'html', 'text', 'video', 'audio', 'flash','object']
	        maxFileCount: 6,//最大上传文件数限制
	        overwriteInitial: false,
	        maxFileSize: 1000, 
	        msgFilesTooMany: "选择上传的文件数量({n}) 超过允许的最大数值{m}！",
	        previewFileIcon: '<i class="glyphicon glyphicon-file"></i>', 
	        enctype: 'multipart/form-data',
	        /* allowedPreviewTypes: null, */
	        previewFileIconSettings: {
                'docx': '<i class="glyphicon glyphicon-file"></i>',
                'xlsx': '<i class="glyphicon glyphicon-file"></i>',
                'pptx': '<i class="glyphicon glyphicon-file"></i>',
                'jpg': '<i class="glyphicon glyphicon-picture"></i>',
                'pdf': '<i class="glyphicon glyphicon-file"></i>',
                'zip': '<i class="glyphicon glyphicon-file"></i>'
            }
	        /* ,
            uploadExtraData: function() {
                var extraValue = null;
                var radios = document.getElementsByName('excelType');
                for(var i=0;i<radios.length;i++){
                    if(radios[i].checked){
                        extraValue = radios[i].value;
                    }
                }
                return {"excelType": extraValue};
            } */
	    /*     slugCallback: function(filename) {
	        	console.info(filename);
	            return filename.replace('(', '_').replace(']', '_');
	        }   */
		});
	            
		$("#fileUpload").on("fileuploaded", function(event, data, previewId, index) {
			console.info(event);
			console.info(data.response.obj);
			console.info(previewId);
			console.info(index);
		});
		
		/* $("#fileUpload").off("filepreupload", function(event, data, previewId, index) {
			console.info(event);
			console.info(data.response.obj);
			console.info(previewId);
			console.info(index);
		}); */
	            
		 </script>
	</body>
</html>
