<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>
<script src="js/jquery.dataTables.min.js"></script>
<script src="js/jquery.dataTables.bootstrap.js"></script>
<title>修改报考</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
<!--添加分类-->
 <form action="../ExaminationServlet?action=update_baokao&id=${list[0].id}" method="post" name="form1" id="form1">
   <%--  <input type="hidden" name="sno" value="${list.sno}"/> --%>
<div id="ad_sort" >
 <div class="add_style">
  <ul>
   <li class="clearfix"><label class="label_name col-xs-3">修改报考年级：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
   
				<select class="col-xs-10 col-sm-5" style="width:450px" name="myclass" size="1">
					<option>${list[0].myclass}</option>
					<c:forEach items="${list2}" var="record">
					<option>${record.classname}</option>
					</c:forEach>
				</select>
				</span>
   </li>
   <li class="clearfix"><label class="label_name col-xs-3">修改学校：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="school" type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"value="${list[0].school}"></span></li>
     <li class="clearfix"><label class="label_name col-xs-3">修改所在地：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="place" value="${list[0].place}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"></span></li>
     <li class="clearfix"><label class="label_name col-xs-3">修改培训机构：&nbsp;&nbsp;</label><span class="cont_style col-xs-9">
     <select class="col-xs-10 col-sm-5" style="width:450px" name="fudaoclass" size="1">
					<option>${list[0].fudaoclass}</option>
					<c:forEach items="${list3}" var="record">
					<option>${record.organizationname}</option>
					</c:forEach>
	</select>
     </span>
     </li>
     
      <li class="clearfix"><label class="label_name col-xs-3">修改辅导教师：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="fudaoteacher" value="${list[0].fudaoteacher}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"/></span></li>
    <li class="clearfix"><label class="label_name col-xs-3">修改家长姓名：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="parentsname" value="${list[0].parentsname}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"/></span></li>
    <li class="clearfix"><label class="label_name col-xs-3">修改家长电话：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="parentstel" value="${list[0].parentstel}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"/></span></li>
    <li class="clearfix"><label class="label_name col-xs-3">修改意向院校1：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="intentionalschool1" value="${list[0].intentionalschool}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"/></span></li>
    <li class="clearfix"><label class="label_name col-xs-3">修改意向院校2：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="intentionalschool" value="${list[0].school2}"type="text" id="form-field-1" class="col-xs-10 col-sm-5" style="width:450px"/></span></li>
   
    <li class="clearfix" style="margin-left:250px"><span class="cont_style col-xs-9"><input  value="保存"type="button" onclick="submitClick()"id="form-field-1" class="" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="reset" value="重置"type="reset" id="form-field-1" class="" /></span></li>
    
<!--       
<li class="clearfix"><label class="label_name col-xs-2">描&nbsp;&nbsp;述：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><textarea name="权限描述" class="form-control col-xs-12 col-sm-5" id="form_textarea" placeholder="" onkeyup="checkLength(this);"></textarea><span class="wordage">剩余字数：<span id="sy" style="color:Red;">200</span>字</span></span></li>
 --> 
  </ul>
 </div>
</div>
</form>
</body>
</html>
<script>
/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
function submitClick() {
    $("#form1").submit();
    window.parent.location.href="../StudentServlet?action=findAll_baokao&headmaster=${tname}&role=${role}";
    parent.layer.close(index);
}
</script>
