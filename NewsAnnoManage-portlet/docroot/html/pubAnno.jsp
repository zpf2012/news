<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>


<div class="zz_rele">
	<div class="zz_rele_a">
		<div class="zz_rele_b">
			<b>新闻/通告发布</b>
		</div>
		<div class="zz_rele_c">
			请选择发布类型：
		</div>
		<div class="zz_rele_d">
			<div class="zz_rele_d_1">
				<div id="zz_news" class="zz_news">新闻动态</div>
				<div id="zz_ann" class="zz_ann">通知公告</div>
				<div style="clear:both;"></div>
			</div>


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