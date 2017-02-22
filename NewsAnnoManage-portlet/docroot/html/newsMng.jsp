<%@page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Map"%>
<%@page import="com.hand.eip.news.ReadConfigFile"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>

<portlet:defineObjects />
<%-- <script src="<%=request.getContextPath()%>/js/jquery-1.10.2.min.js"></script> --%>
<%-- <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script> --%>
<%-- <link href="<%=request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet"> --%>
<link href="<%=request.getContextPath()%>/css/NewsMng.css" rel="stylesheet">
<%
	Map<String, String> map = ReadConfigFile.getContent();
	//System.out.println(readConfigFile.getUrlPrefix());
%>
<script type="text/javascript">
	var urlPrefix = '<%=map.get("urlPrefix")%>';

	var head = '<thead class="table-columns"><tr><th><input id="selectAll" type="checkbox"/></th><th class="table-first-header" width="400px">标题</th><th width="200px">摘要</th><th>发布日期</th><th>新闻/通告</th><th>当前状态</th><th>操作</th></tr></thdea>';

	var options = '<a href="'+urlPrefix+'/view?id=##new_id##">预览</a>&nbsp;&nbsp;<a href="'+urlPrefix+'/edit?id=##new_id##">编辑</a>';
	//var options = '<a href="/view/##new_id##">预览</a>&nbsp;&nbsp;<a href="/edit/##new_id##">编辑</a>&nbsp;&nbsp;<a href="/delete/##new_id##">删除</a>';
	var template = '<tbody class="table-data"><tr><td><input id="new_id_##new_id##" type="checkbox"/></td><td>##title##</td><td>##summary##</td><td>##releaseDate##</td><td>##type##</td><td>##status##</td><td>';

	//初始化参数
	var page = 1;
	var pageSize = 15;		//每页显示条数：共有五种参数： 15， 30， 45， 60， 75
	var timeInterval = "month";  //查看区间：共有三种参数： month， year, all
	var pages = 0;
	$(function() {
		
		getData();

		$("#test").html('<a href="'+urlPrefix+'/eipNews/query">查看数据</a>');
		/*  $("#view").on('click', function() {
			$("#customerPage").show();
			return false;
		}); */

		$("#customerPage").hide();

		var getPageChildren =  $("#getPage").children('li');
		/* $("#getPage").children('li').children('a').on('click', function(){ 
		});*/
		page = getPageChildren.children('a').attr("id").substr(5);
		alert(page);
		
	});
	
	function getData(){
		$.ajax({
			//提交数据的类型 POST GET
			type : "GET",
			//表示同步	false true
			async : false,
			//提交的网址
			//url : "http://asc.hand-china.com/eip/api/public/employee/hrmsEmployeeV/queryEmp",
			//http://10.211.110.207:8080/api/public/news/eipNews/query
			url : urlPrefix + "/eipNews/query",
			data : {
				"page" : page ,
				"pageSize" : pageSize,
				"timeInterval": timeInterval
			},
			dataType : "jsonp", //"xml", "html", "script", "json", "jsonp", "text".
			//解决跨域问题
			jsonp : "callback",
			//jsonpCallback:"query",
			success : function(data) {
				//alert(JSON.stringify(data));
				var html = '';
				var htmlTemp = template;
				var optionsTemp = options;
				for ( var i in data) {
					pages = Math.ceil(data.length/pageSize) ;
					optionsTemp = optionsTemp.replace("##new_id##",
							data[i].newsId);
					optionsTemp = optionsTemp.replace("##new_id##",
							data[i].newsId);

					htmlTemp = htmlTemp.replace("##new_id##",
							data[i].newsId);
					//alert(options);
					if (data[i].newsType == 'HEIP_NEWSTYPE_NEWS') {
						htmlTemp = htmlTemp.replace("##type##", "新闻");
					} else {
						htmlTemp = htmlTemp.replace("##type##", "通告");
					}
					htmlTemp = htmlTemp.replace("##title##",
							data[i].title);
					htmlTemp = htmlTemp.replace("##summary##",
							data[i].summary == null ? ""
									: data[i].summary);
					htmlTemp = htmlTemp.replace("##releaseDate##",
							data[i].releaseDate);

					if (data[i].releaseStatus == 'NEWS_STATUS_SAVE') {
						htmlTemp = htmlTemp.replace("##status##", "保存");
					} else {
						htmlTemp = htmlTemp
								.replace("##status##", "已发布");
					}

					html = html + htmlTemp + optionsTemp
							+ '</td></tr></tbody>';
					optionsTemp = options;
					htmlTemp = template;
				}

				html = '<table id="myTable" border="1" class="table table-bordered table-hover table-striped">'
						+ head + html + '</table>';
				$("#container").html(html);
				$("#getEntryNums").html("总共的条目有"+data.length+"条，当前为第"+page+"页,当前每页显示条数为"+pageSize+"条");
				$("#getPageSize").html(pageSize);
				if(timeInterval=='month'){
					$("#getTimeInterval").html("显示最近一个月");
				}else if(timeInterval == 'year'){
					$("#getTimeInterval").html("显示本年内");
				}else{
					$("#getTimeInterval").html("显示所有");
				}
				
				var pageTemplate = '<li><a id="page_##page##">##page##</a></li>';
				var temp = pageTemplate;
				for(var i= 1; i < pages+1; i++){
					temp = temp.replace("##page##", i.toString());
					temp = temp.replace("##page##", i.toString());
					$("#getPage").html($("#getPage").html()+ temp) ;
					temp = pageTemplate;
				
				}
				
				$("#currentPage").html(page);
				
			},
			error : function(XMLHttpRequest, textStatus, errorThrown) {
				$("#container").html(
						"未查询到任何内容！！！" + "errorThrown:" + errorThrown);
			}
		});
	}
	
</script>
<!-- <div class="btn-group lfr-icon-menu current-page-menu">
<a class="dropdown-toggle direction-down max-display-items-15 btn" title="页码" aria-haspopup="true" role="button"><span class="lfr-icon-menu-text">页码</span><i class="caret"></i> </a>
</div> -->
<div style="width:50%;float:left;">
	<div class="btn-group" style="float:left; margin-top: 15px;">
		<button type="button" class="btn btn-info dropdown-toggle"
			data-toggle="dropdown">
			当前为第<span id="currentPage"></span>页 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" id="getPage">
		</ul>
	</div>
	
	<div class="btn-group" style="float:left; margin-top: 15px;">
		<button type="button" class="btn btn-info dropdown-toggle"
			data-toggle="dropdown">
			每页显示<span id="getPageSize"></span>条 <span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu">
			<li><a id="pageSize_15">15</a></li>
			<li><a id="pageSize_30">30</a></li>
			<li><a id="pageSize_45">45</a></li>
			<li><a id="pageSize_60">60</a></li>
			<li><a id="pageSize_75">75</a></li>
		</ul>
	</div>
	<div class="btn-group" style="float:left; margin-top: 15px;">
		<button type="button" class="btn btn-info dropdown-toggle"
			data-toggle="dropdown">
			<span id="getTimeInterval"></span><span class="caret"></span>
		</button>
		<ul class="dropdown-menu" role="menu" id="timeInterval">
			<li><a id="timeInterval_month">显示最近一个月</a></li>
			<li><a id="timeInterval_year">显示本年内</a></li>
			<li><a id="timeInterval_all">显示所有</a></li>
		</ul>
	</div>
	<div style="float:left; margin-top: 15px;"><span id="getEntryNums"></span></div>
</div>
<div style="width:50%; float:right;">
	<ul class="pager lfr-pagination-buttons" style="margin-bottom: 10px; margin-top: 10px;" id="getPagenations">
		<li><a href="" id="page_first">← 首页</a></li>
		<li><a href="" id="page_previous">上一页 </a></li>
		<li><a href="" id="page_next">下一页 </a></li>
		<li><a href="" id="page_last">尾页→ </a></li>
	</ul>

</div>


<div id="container"></div>
<div id="test"></div>
<div id="customerPage"
	class="yui3-widget modal yui3-widget-positioned yui3-widget-stacked yui3-widget-modal modal-focused yui3-dd-draggable yui3-resize"
	style="left: 280px; top: 4.31667px; z-index: 1201; height: 100%; width: 100%; display: none;"
	tabindex="0">
</div>
