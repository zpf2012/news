<<<<<<< HEAD
<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/announcement.css" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/plugins/code/prettify.js"></script>


<script>
var editor1;
KindEditor.ready(function(K) {
	editor1 = K.create('textarea[name="annContent"]', {
		cssPath : '<%=request.getContextPath() %>/kindeditor/plugins/code/prettify.css',
		uploadJson : '<%=request.getContextPath() %>/kindeditor/jsp/upload_json.jsp',
		fileManagerJson : '<%=request.getContextPath() %>/kindeditor/jsp/file_manager_json.jsp',
		allowFileManager : true,//是否允许文件被重新编辑
		afterBlur : function() {
			this.sync();
			K.ctrl(document, 13, function() {
				K('form[name=example]')[0].submit();
			});
			K.ctrl(this.edit.doc, 13, function() {
				K('form[name=example]')[0].submit();
			});
		}
	});
	prettyPrint();
});

</script>


<div class="zz_rele">
	<div class="zz_rele_a">

		<div class="zz_rele_d">

			<!-- 发布新闻 -->

			<!-- 发布通告 -->
			<div id="aa" class="zz_rele_d_3">
				<form id="form1" name="example" method="post" onsubmit="return checkAnn();" action="${editAnnounce }" enctype="multipart/form-data">
					<div class="zz_rele_d_3_a">文章标题</div>
					<div class="zz_rele_d_3_b">
						<input type="text" name="annTitle" id="annTitle" placeholder="*请输入文章标题（30字以内）必填" style="width: 686px; height: 30px;">
					</div>
					<div class="zz_rele_d_3_c">正文</div>
					<div style="margin-top: 20px;">
						<textarea name="annContent" id="annContent" cols="100" rows="8" style="width:696px; height:200px; visibility:hidden;"></textarea>
						<br />
						<input type="submit" id="annSubmit" value="发布通告" class="zz_sumbit" style="text-align: center; font-size:16px; width:100px; height:28px; padding-top: 2px; font-family: 黑体; margin-bottom: 40px;"/><span>${messageAnn }</span>
						<!-- <div class="zz_news" style="margin-bottom:40px; font-size: 16px; font-family: 黑体; border:0px red solid;">发布通告</div> -->
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
=======

<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/announcement.css" />

<link rel="stylesheet" href="<%=request.getContextPath() %>/WEB-/kindeditor/themes/default/default.css" />
<link rel="stylesheet" href="<%=request.getContextPath() %>/kindeditor/plugins/code/prettify.css" />
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/kindeditor.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/lang/zh_CN.js"></script>
<script charset="utf-8" src="<%=request.getContextPath() %>/kindeditor/plugins/code/prettify.js"></script>



发布新闻页面
>>>>>>> 9bc57f682c680163f024994a25baa52b39f66dca
