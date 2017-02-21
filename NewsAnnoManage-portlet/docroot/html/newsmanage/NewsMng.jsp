<%@page import="java.util.Map"%>
<%@page import="com.hand.eip.news.ReadConfigFile"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<portlet:defineObjects />
<script src="<%=request.getContextPath() %>/js/jquery-1.10.2.min.js"></script>
<link href="<%=request.getContextPath() %>/css/NewsMng.css" rel="stylesheet">
<%
	Map<String, String> map = ReadConfigFile.getContent();
	//System.out.println(readConfigFile.getUrlPrefix());
	/* 测试协同工作 */
	
%>

<script type="text/javascript">
	var urlPrefix = '<%=map.get("urlPrefix") %>';
	
	var head = '<thead class="table-columns"><tr><th class="table-first-header" width="400px">标题</th><th width="200px">摘要</th><th>发布日期</th><th>新闻/通告</th><th>当前状态</th><th>操作</th></tr></thdea>';
	
	var options = '<a href="'+urlPrefix+'/view/##new_id##" id="view">预览</a>&nbsp;&nbsp;<a href="'+urlPrefix+'/edit/##new_id##">编辑</a>';
	//var options = '<a href="/view/##new_id##">预览</a>&nbsp;&nbsp;<a href="/edit/##new_id##">编辑</a>&nbsp;&nbsp;<a href="/delete/##new_id##">删除</a>';
	var template = '<tbody class="table-data"><tr><td>##title##</td><td>##summary##</td><td>##releaseDate##</td><td>##type##</td><td>##status##</td><td>';
    
    $(function(){
    	  $.ajax({
    		//提交数据的类型 POST GET
    		type : "GET",
    		//表示同步	false true
    		async : false,
    		//提交的网址
    		//url : "http://asc.hand-china.com/eip/api/public/employee/hrmsEmployeeV/queryEmp",
    		//http://10.211.110.207:8080/api/public/news/eipNews/query
    		url : urlPrefix+"/eipNews/query",
    		dataType : "jsonp", //"xml", "html", "script", "json", "jsonp", "text".
    		//解决跨域问题
    		jsonp: "callback",
        	//jsonpCallback:"query",
    		success : function(data) {
    			//alert(JSON.stringify(data));
    		 	var html = '';
   				var htmlTemp = template; 
    		 	var optionsTemp = options;
    			for(var i in data){
    				optionsTemp = optionsTemp.replace("##new_id##", data[i].newsId);
    				//alert(options);
    				if(data[i].newsType == 'HEIP_NEWSTYPE_NEWS'){
    					htmlTemp = htmlTemp.replace("##type##", "新闻");
    				}else{
    					htmlTemp = htmlTemp.replace("##type##", "通告");
    				}
    				htmlTemp = htmlTemp.replace("##title##", data[i].title);
    				htmlTemp = htmlTemp.replace("##summary##", data[i].summary==null?"":data[i].summary);
    				htmlTemp = htmlTemp.replace("##releaseDate##", data[i].releaseDate);
    				
    				if(data[i].releaseStatus == 'NEWS_STATUS_SAVE'){
    					htmlTemp = htmlTemp.replace("##status##", "保存");
    				}else{
    					htmlTemp = htmlTemp.replace("##status##", "已发布");
    				}
    				
    				html = html + htmlTemp + optionsTemp+'</td></tr></tbody>';
    				optionsTemp = options;
    				htmlTemp = template;
    			}
    			
    			html = '<table id="myTable" border="1" class="table table-bordered table-hover table-striped">'+head+html+'</table>';
    			$("#container").html(html);
    			
    		},
    		error : function(XMLHttpRequest, textStatus, errorThrown){
    			$("#container").html("未查询到任何内容！！！"+"errorThrown:"+errorThrown);
    		}
    	});
    	
    	
    	$("#test").html('<a href="'+urlPrefix+'/eipNews/query">查看数据</a>');
    	$("#view").on('click', function(){
    		$("#customerPage").show();
    		return false;
    	});
    	
    	$("#customerPage").hide();
    	
    });
</script>
<!-- <div class="btn-group lfr-icon-menu current-page-menu">
<a class="dropdown-toggle direction-down max-display-items-15 btn" title="页码" aria-haspopup="true" role="button"><span class="lfr-icon-menu-text">页码</span><i class="caret"></i> </a>
</div> -->
<div id="container"></div>

<div id="test"></div>
<div id="customerPage" 
	class="yui3-widget modal yui3-widget-positioned yui3-widget-stacked yui3-widget-modal modal-focused yui3-dd-draggable yui3-resize"
	style="left: 280px; top: 4.31667px; z-index: 1201; height: 100%; width: 100%;display: none;"
	tabindex="0">
</div>




