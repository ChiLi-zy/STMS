<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no"/>
<link href="css/shop.css" type="text/css" rel="stylesheet" />
<link href="css/Sellerber.css" type="text/css"  rel="stylesheet" />
<link href="css/bkg_ui.css" type="text/css"  rel="stylesheet" />
<link href="font/css/font-awesome.min.css"  rel="stylesheet" type="text/css" />
<script src="js/jquery-1.9.1.min.js" type="text/javascript" ></script>
<script type="text/javascript" src="js/jquery.cookie.js"></script>
<script src="js/shopFrame.js" type="text/javascript"></script>
<script src="js/Sellerber.js" type="text/javascript"></script>
<script src="js/layer/layer.js" type="text/javascript"></script>

<title>编辑学生成绩</title>
</head>
<!--[if lt IE 9]>
  <script src="js/html5shiv.js"></script>
  <script src="js/respond.min.js"></script>
  <script src="js/css3-mediaqueries.js"  type="text/javascript"></script>
  <![endif]-->
<body>
${msg}
<!--添加分类-->
 <form action="ScoreServlet?action=admin_update_score&sid=${sid}" method="post" name="form1" id="form1">
<input type="hidden" value="${list[0].eid}" name="eid"/>
<input type="hidden" value="${list[0].headmaster}" name="headmaster"/>
<div id="ad_sort" >
 <div class="add_style">
  <ul>
   <li class="clearfix"><label class="label_name col-xs-2">学生：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="sname" id="name"type="text" readonly="readonly"  class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].sname}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">语文：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="chinese" id="chinese"type="text" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].chinese}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">数学：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="math" type="text" id="math" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].math}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">英语：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="english" type="text" id="english" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].english}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">物理：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="physics" type="text" id="physics" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].physics}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">化学：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="chemistry" type="text" id="chemistry" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].chemistry}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">政治：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="politics" type="text" id="politics" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].politics}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">历史：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="history" type="text" id="history" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].history}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">地理：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="geography" type="text" id="geography" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].geography}"/></span></li>
   <li class="clearfix"><label class="label_name col-xs-2">生物：&nbsp;&nbsp;</label><span class="cont_style col-xs-9"><input name="biology" type="text" id="biology" class="col-xs-10 col-sm-5" style="width:450px" value="${list[0].biology}"/></span></li>
         
   <li class="clearfix" style="margin-left:250px"><span class="cont_style col-xs-9"><input  onclick="submitClick()" value="保存" type="button" id="form-field-1" class="" />&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<input name="spwd" value="重置"type="reset" id="form-field-1" class="" /></span></li>
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

   if(chinese.value==""){
      alert("成绩不许为空！");
      chinese.focus();
      return;
   }
   else if(math.value==""){
    alert("成绩不许为空！");
      math.focus();
      return;
   }
   else if(english.value==""){
     alert("成绩不许为空！");
      english.focus();
      return;
   }
   else if(physics.value==""){
     alert("成绩不许为空！");
      physics.focus();
      return;
   }
   else if(chemistry.value==""){
    alert("成绩不许为空！");
      chemistry.focus();
      return;
   }
   else if(politics.value==""){
    alert("成绩不许为空！");
      politics.focus();
      return;
   }
   else if(history.value==""){
     alert("成绩不许为空！");
      history.focus();
      return;
   }
   else if(geography.value==""){
    alert("成绩不许为空！");
      geography.focus();
      return;
   }
  else if(biology.value==""){
     alert("成绩不许为空！");
      biology.focus();
      return;
   }
    $("#form1").submit();
    window.parent.location.href="ScoreServlet?action=adm_findAllScore";
    parent.layer.close(index);
}
</script>