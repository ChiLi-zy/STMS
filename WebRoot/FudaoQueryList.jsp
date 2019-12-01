<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>管理员列表</title>

</head>
<body>
${msg}
<div class="margin Competence_style" id="page_style">
<div class="operation clearfix">
<a href="javascript:history.go(-1)"  class="btn button_btn bg-deep-blue" title="返回上一页"><i class="fa  fa-edit"></i>&nbsp;返回上一页</a>
     <label style="color:red"><i class="c-red">*</i>按<span style="color:blue">条件/辅导机构</span>查询：</label> 
  <div style="margin-left:25%;margin-top:-38px;width:80%">
   <form method="post" id="form3" name="form3" action="AdminServlet?action=query"> 
   <input id="Competence_sort" name="admin_query_org"type="text" placeholder="请输入想要查询的辅导机构关键字或全名！" class="col-xs-4"/>
   <button class="btn button_btn btn-danger" onclick="query()"  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
   </form>	
  </div> 
   <div class="search  clearfix">
  <form action="StudentServlet?action=admin_findbyId" name="form2" id="form2" method="post">
   <input id="sname" name="sname"type="text" placeholder="请输入想要查询的学生姓名！" class="form-control col-xs-8"/><button class="btn button_btn bg-deep-blue " onclick="chaxun()"  type="button"><i class="fa  fa-search"></i>&nbsp;搜索</button>
   </form>
</div>
</div>
</div>
<div align="center"><span style="color:red">特别声明：</span>凡[状态]显示 <span class="label label-success label-sm">NO</span> 是没有经过管理员审核的报考信息，请第一时间联系管理员进行审核，审核后显示 <span class="label label-success label-sm">YES</span></div></br>
<form action="<c:url value='/ListServlet'/>" method="post">
<div class="compete_list" style="width: 100%;overflow-x:scroll;">

       <table id="sample_table" class="table table_list table_striped table-bordered dataTable no-footer"style="width:1700px">
		 <thead>
			<tr>
			 
			  <th>编号</th>
			  <th>姓名</th>
			  <th>性别</th>
			  <th>年龄</th>
              <th>出生日期</th>
              <th>出生地</th>
              <th>学校名称</th>
              <th>辅导机构</th>
              <th>辅导教师</th>
              <th>家长姓名</th>
              <th>家长电话</th>
             
              <th>状态</th>         
              <th class="hidden-480">操作</th>  
             </tr>
		    </thead>
             <tbody>
            <c:forEach items="${list}" var="list">
			  <tr>
				
				<td>${list.id}</td>
				<td>${list.sname}</td>
				<td>${list.sex}</td>
				<td>${list.old}</td>
				<td>${list.born}</td>
				<td>${list.place}</td>
				<td>${list.schoolname}</td>
				<td>${list.fudaoclass}</td>
				<td>${list.fudaoteacher}</td>
				<td>${list.parentsname}</td>
				<td>${list.parentstel}</td>
				
                 <td class="td-status"><c:if test="${list.single=='通过'}"><span class="label label-success label-sm">YES</span></c:if><c:if test="${list.single=='不通过'}"><span class="label label-success label-sm">NO</span></c:if></td>
				<td><a title="编辑" onclick="myselfinfo(${list.id})" href="javascript:;" class="btn button_btn bg-deep-blue">编辑</a>        
                 <a title="删除" href="StudentServlet?action=deletestu&sname=${list.sname}"  class="btn button_btn btn-danger">删除</a></td>
			   </tr>
			  </c:forEach>
			  
			  
			 
			<tr >
				<td align="center" colspan="24" bgcolor="#ffffff" >	
		   	 <ul class="pagination">
	
			    <li <c:if test="${page.currPage eq '1'}"> class="disabled"</c:if>><a <c:if test="${page.currPage ne '1'}">href="AdminServlet?action=query&admin_query_org=${admin_query_org}&currPage=${page.currPage -1}"</c:if>>上一页</a></li>
			    <c:if test="${page.totalPage eq '0'}"><li><a href="AdminServlet?action=query&admin_query_org=${admin_query_org}&currPage=1">1</a></li></c:if>
			    <c:forEach begin="1" end="${page.totalPage }" var="var">
			    	<li <c:if test="${var eq page.currPage}"> class="active"</c:if>><a href="AdminServlet?action=query&admin_query_org=${admin_query_org}&currPage=${var}">${var}</a></li>
			    </c:forEach>
			    <li  <c:if test="${page.currPage eq page.totalPage }"> class="disabled"</c:if>><a <c:if test="${page.currPage ne page.totalPage }">href="AdminServlet?action=query&admin_query_org=${admin_query_org}&currPage=${page.currPage +1}"</c:if>>下一页</a></li>
			  </ul>	
         		</td>
			</tr>
			
		      </tbody>
	        </table>
	        
     </div>
     </form>
</div>

</body>
</html>
<script>
  function query(){
         var Competence_sort=document.getElementById("Competence_sort");
         if(Competence_sort.value==""){
         alert("请输入所要查询的辅导机构！");
         Competence_sort.focus();
         return;
      }	
   document.getElementById("form3").submit();  
 }
  function chaxun(){
         var sname=document.getElementById("sname");
         if(sname.value=="" || sname.value==null){
           alert("请输入要查询的学生姓名！");
         sname.focus();
         return;
      }	
   document.getElementById("form2").submit();  
 }
$(function(){
	$("#Competence_sort").click(function(){
		var option=$(this).find("option:selected").text();
		var value=$(this).val();
		if(value==0){
			  
			$("#sample_table tbody tr").show()
			}
			else{
		$("#sample_table tbody tr").hide().filter(":contains('"+(option)+"')").show();	
			}
		}).click();	
	});

/*******滚动条*******/
$("body").niceScroll({  
	cursorcolor:"#888888",  
	cursoropacitymax:1,  
	touchbehavior:false,  
	cursorwidth:"5px",  
	cursorborder:"0",  
	cursorborderradius:"5px"  
});
/*管理员-停用*/
function Competence_close(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_start(this,id)" href="javascript:;" title="启用">启用</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success label-sm">已停用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}
//删除
function Competence_delete(obj,id){
	layer.confirm('确认要删除吗？',function(index){
		$(obj).parents("tr").find(".btn button_btn btn-danger").prepend('<a style="text-decoration:none" class="btn button_btn btn-gray" onClick="Competence_delete(this,id)" href="" title="删除">已删除</a>');
		$(obj).remove();
		layer.msg('已删除!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function Competence_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		$(obj).parents("tr").find(".td-manage").prepend('<a style="text-decoration:none" class="btn button_btn  btn-Dark-success" onClick="Competence_close(this,id)" href="javascript:;" title="停用">停用</a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success label-sm">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!',{icon: 6,time:1000});	
	});
}
/***************添加分类***********/
function add_AD_sort( ){
	  layer.open({
        type: 1,
        title: '添加分类',
		maxmin: false, 
		shadeClose: false, //点击遮罩关闭层
        area : ['600px' , ''],
        content:'<%=basePath%>StudentServlet?action=updatebefore',
		btn:['添加','取消'],
		yes:function(index,layero){	
		 var num=0;
		 var str="";
		  $(".add_style input[type$='text']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
		  if(num>0){  return false;}	 	
          else{
			  layer.alert('添加成功！',{
               title: '提示框',				
			icon:1,		
			  });
			   layer.close(index);	
		  }	
		 
		 }
	  })
	}
	function myselfinfo(id){
	layer.open({
		type: 2,
		area: ['800px','500px'],
		fix: false, //不固定
		maxmin: true,
		shade:0.4,
		title: '查看信息',
		//content: '<table style="text-align:center;"><th style="text-align:center;"><h5 >个人信息</h5></th><tr><td>姓&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp名：<input type="" name="" value=""></td></tr><tr><td>联系方式：<input type="text" name="" value=""></td></tr><tr><td>所在职责：<input type="text" name="" value=""></td></tr><tr><td>所管机房：<input type="text" name="" value=""></td></tr></table>'
		content:'<%=basePath%>StudentServlet?action=updatebefore&id='+id
	});
}


function resetPicture(photo){
	layer.open({
    type: 1,
	title:'重传照片',
	area: ['500px','500px'],
	shadeClose: true,
	content:'<img src="images/${list[0].photo}" />',
	btn:['确认修改'],
	yes:function(index, layero){		
	 var num=0;
     var str="";
	 var $paddword=/^[a-z0-9_-]{5,18}$/;
	
     $("input[type$='password']").each(function(n){
          if($(this).val()=="")
          {
               
			   layer.alert(str+=""+$(this).attr("data-name")+"不能为空！\r\n",{
                title: '提示框',				
				icon:0,								
          }); 
		    num++;
            return false;            
          } 
		 });
	       if(num>0){  return false;}	
	      if(!$("#c_mew_pas").val || $("#c_mew_pas").val() != $("#Nes_pas").val() )
        {
            layer.alert('密码不一致!',{
              title: '提示框',				
				icon:0,
			    
			 });
			 return false;
        }   
		 else{	
		 document.getElementById("form2").submit();
			  layer.alert('修改成功！',{
               title: '提示框',				
			icon:1,		
			  }); 
			  layer.close(index);      
		  }	 
	}
    });
}

/****复选框选中******/
$('table th input:checkbox').on('click' , function(){
					var that = this;
					$(this).closest('table').find('tr > td:first-child input:checkbox')
					.each(function(){
						this.checked = that.checked;
						$(this).closest('tr').toggleClass('selected');
					});
						
				});
</script>
