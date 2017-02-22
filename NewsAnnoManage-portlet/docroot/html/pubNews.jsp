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
			<!-- 发布新闻 -->
			<div id ="nn" class="zz_rele_d_2">
				<form id="form2" name="newExample" method="post" onsubmit="return checkNews();" action="${editNews }" enctype="multipart/form-data">
					<div class="zz_rele_d_2_a">文章标题</div>
					<div class="zz_rele_d_2_b">
						<input type="text" id="moreTitle" name="newTitle" placeholder="*请输入文章标题（30字以内）必填" style="width: 686px; height: 30px;">
					</div>
					<div class="zz_rele_d_2_c">文章作者</div>
					<div class="zz_rele_d_2_d">
						<input type="text" id="moreAuthor" name="newSignatureName" placeholder="*请输入文章作者（10字以内）选填" style="width: 686px; height: 30px;">
					</div>
					<div class="zz_rele_d_2_e">
						<div class="zz_rele_d_2_e_1">
							<div style=" float: left;">展示图片&nbsp;<span style="font-size: 12px; color :#333333;">作为新闻列表展示用&nbsp;必填一张&nbsp;小于2M</span></div>
							<div class="zz_news" style="padding-top: 4px; background-color:#ccc; margin-left: 320px;" onclick="getElementById('picturePath').click()">上传</div>
							<div style="clear:both;"></div>
						</div>
						
						<div class="zz_rele_d_2_e_2">
							<span id="uploadImg"> 
								<input  type="file" size="1" id="picturePath" name="morePicture" style="position:absolute; z-index:100; font-size:0px; opacity:0; filter:alpha(opacity=0); height:170px; width:300px;">
								<img style="width:300px; height:170px;" id="picturePath0" name="picturePath0" src="<%=request.getContextPath() %>/images/clickNews.png">
							</span>	
						</div>
					</div>
					
					<div class="zz_rele_d_2_f">摘要</div>
					<div style="margin-top: 20px;">
						<textarea id="moreSummary" name="newSummary" cols="100" rows="4" style="width:686px; height:100px;" placeholder="*请输入摘要80字以内（选填）    若不填写则从正文中摘取前50字"></textarea>
					</div>
					<div class="zz_rele_d_2_g">正文</div>
					<div style="margin-top: 20px;">
						<textarea id="moreContent" name="newContent" cols="100" rows="8" style="width:696px; height:200px; visibility:hidden;"></textarea>
						<br />
						<input type="submit" id="newSubmit" value="发表新闻" class="zz_sumbit" style="text-align: center; font-size:16px; width:100px; height:28px; padding-top: 2px; font-family: 黑体; margin-bottom: 40px;"/><span>${messageNews }</span>
					</div>
				</form>
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