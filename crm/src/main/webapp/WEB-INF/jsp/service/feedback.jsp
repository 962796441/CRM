<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 服务反馈 -->
<div id="feedback">
	<div>
		<form class="form-inline">

			<div class="form-group">
				<select name="svrType_2" id="" class="form-control">
					<option value="">请选择服务类型</option>
					<option value="咨询">咨询</option>
					<option value="投诉">投诉</option>
					<option value="建议">建议</option>
				</select>
			</div>
			<div class="form-group">
				<select name="svrStatus_2" id="" class="form-control">
					<option value="">请选择服务状态</option>
					<option value="处理中">处理中</option>
					<option value="已处理">已处理</option>
					<option value="已反馈">已反馈</option>
				</select>
			</div>
			<input class="btn btn-default search" type="button" value="查询">
			<input class="btn btn-default" type="reset" value="重置">
		</form>
	</div>

	<div>
		<table class="table table-hover">
			<thead>
				<tr style="background: #E8E8E8;">
					<th>序号</th>
					<th>客户名称</th>
					<th>概要</th>
					<th>服务类型</th>
					<th>处理人</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ServiceInfo.list}" var="serv">
					<tr>
						<td class="servid" >${serv.svrId}</td>
						<td>${serv.svrCustName}</td>
						<td>${serv.svrTitle}</td>
						<td>${serv.svrType}</td>
						<td>${serv.svrDispose}</td>
						<td class="zhuangtai" >${serv.svrStatus}</td>
						<c:if test="${serv.svrStatus=='已处理'}">
							<td><i class="layui-icon layui-icon-circle-dot"
								title="点击进行服务反馈"></i></td>
						</c:if>
						<c:if test="${serv.svrStatus=='处理中'}">
							<td><i class="layui-icon layui-icon-circle-dot"
								title="点击进行服务反馈"></i></td>
						</c:if>
						<c:if test="${serv.svrStatus=='已反馈'}">
							<td><i class="layui-icon layui-icon-face-smile" title="已反馈"></i>
							</td>
						</c:if>
					</tr>
				</c:forEach>

			</tbody>
		</table>
	</div>
	<div class="fenye">
		<nav aria-label="Page navigation">
			<ul class="pagination">
			<li> <span aria-hidden="true">共${ServiceInfo.total} 条记录</span></li>
			<%-- <li> <span aria-hidden="true">每页${ServiceInfo.size} 条</span></li> --%>
			
			<li><a href="javascript:void(0)" onclick="pageSelect6(1)"
				aria-label="Previous"> <span aria-hidden="true">首页</span>
			</a></li>			
				<c:choose>
					<c:when test="${ServiceInfo.hasPreviousPage }">
						<li><a href="javascript:void(0)"
							onclick="pageSelect6(${ServiceInfo.prePage})"
							aria-label="Previous"> <span aria-hidden="true">上一页</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:void(0)" disenable="true"
							onclick="pageSelect6(${ServiceInfo.prePage})"
							aria-label="Previous"> <span aria-hidden="true">上一页</span>
						</a></li>
					</c:otherwise>
				</c:choose>
				<li> <span aria-hidden="true">第${ServiceInfo.pageNum } 页</span></li>
<!-- 				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
 -->
				<c:choose>
					<c:when test="${ServiceInfo.hasNextPage}">
						<li><a href="javascript:void(0)"
							onclick="pageSelect6(${ServiceInfo.nextPage})" aria-label="Next">
								<span aria-hidden="true">下一页</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:void(0)" disenable="true"
							onclick="pageSelect6(${ServiceInfo.nextPage})" aria-label="Next">
								<span aria-hidden="true">下一页</span>
						</a></li>						
					</c:otherwise>
				</c:choose>
			<li><a href="javascript:void(0)" onclick="pageSelect6(${ServiceInfo.lastPage})"
				aria-label="Previous"> <span aria-hidden="true">尾页</span>
			</a></li>				

			</ul>
		</nav>
	</div>
	<!-- 提示模态框 -->
	<div class="modal" id="tishi">
		<div class="modal-dialog" style="width: 350px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">服务正在处理中,无法反馈</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary">确定</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 新增模态框 -->
	<div class="modal" id="toAdd">
		<div class="modal-dialog" style="height: 400px; overflow: auto;">
			<div class="modal-content">
				<form>
					<div class="modal-body">

						<div class="form-group">
							<label>服务反馈结果:</label> <input type="text" name="svrResult_1"
								class="form-control">
						</div>

						<div class="form-group">
							<label>客户满意度:</label> <select name="svrSatisfy_1" id=""
								class="form-control">
								<option value="一星">请选择客户满意度</option>
								<option value="一星">一星</option>
								<option value="二星">二星</option>
								<option value="三星">三星</option>
								<option value="四星">四星</option>
								<option value="五星">五星</option>
							</select>
						</div>
						<div class="form-group">
							<label>状态:</label> <input type="text" name="status_1"
								class="form-control" value="处理" disabled>
							<!-- <select name="city" id="" class="form-control">
							<option value="">请选择状态</option>
					        <option value="0">处理中</option>
					        <option value="1">已处理</option>
					        <option value="2">未处理</option>
					        </select> -->
						</div>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn" style="background: #ccc">取消</button>
					<button class="btn" style="background: #ccc">保存</button>
				</div>
			</div>
		</div>
	</div>

</div>
<style>
#feedback {
	width: 1140px;
	overflow: hidden;
}

.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	background-color: #ccc;
	border-color: #ccc;
}

.pagination>li>a, .pagination>li>span {
	color: black;
}

.fenye {
	margin-left: 400px;
}

.form-inline {
	margin-top: 15px;
	margin-left: 10px;
	margin-bottom: 20px;
}

.search {
	margin-left: 50px;
}

#add {
	margin-left: 560px;
}

.table th, td {
	text-align: center;
}

#tishi {
	margin-top: 100px;
}

#toAdd {
	margin-top: 50px;
}
</style>
<script type="text/javascript">
function pageSelect6(curPage){
	$('.layui-body').load('service/toFeedback/' + curPage);
}
	$(function(){
		var servId = null;
		// 查询
		$('.search').click(function(){
			var svrType = $("select[name=svrType_2] option:selected").val();
			var svrStatus =  $("select[name=svrStatus_2] option:selected").val();
			var data = {
				"svrType":svrType,
				"svrStatus":svrStatus
			}
			var url = "service/findServiceByTypeAndStatus/1";
			$('.layui-body').load(url,data);
		})
		$('.layui-icon-circle-dot').click(function(){
			var status = $(this).closest('tr').find('.zhuangtai').text();
			servId = $(this).closest('tr').find('.servid').text();
			if(status=='已处理') {
				$('#toAdd').show();
			} else if(status=='处理中'){
				$('#tishi').show();
			}
			
		})
		// 服务详细信息
		$('.layui-icon-face-smile').click(function(){
			$('.layui-body').load('./pages/serviceDetails.html');
		})
		// 关闭提示模态框
		$('.close').click(function(){
			$('#tishi').hide();
		})
		$('.btn-primary').click(function(){
			$('#tishi').hide();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click',function(){
			$('button[type=reset]').trigger('click');
				$('#toAdd').hide();
		})
		// 新增模态框保存
		$('button:contains(保存)').on('click',function(){
				var svrSatisfy = $("select[name=svrSatisfy_1] option:selected").val();
				var svrResult = $("input[name=svrResult_1]").val();
				var data = {
					"svrId":servId,
					"svrSatisfy":svrSatisfy,
					"svrResult":svrResult
				}
				var url = "service/saveFeedback"; 		
				$.post(url,data,function(msg){
					alert(msg); 						
					$('.layui-body').load('service/toFeedback/1');
					servId = null;
				})
				$('#toAdd').hide();
		})	
	})
</script>