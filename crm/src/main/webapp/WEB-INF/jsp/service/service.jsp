<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 服务处理 -->
<div id="service">
	<div>
		<form class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control" id="exampleInputEmail3" name="svrCustName1"
					placeholder="请输入客户名称">
			</div>

			<div class="form-group">
				<select name="svrType1" id="" class="form-control">
					<option value="">请选择服务类型</option>
					<option value="咨询">咨询</option>
					<option value="投诉">投诉</option>
					<option value="建议">建议</option>
				</select>
			</div>
			<input class="btn btn-default search" type="button" value="查询">
			<input class="btn btn-default" type="reset" value="重置"> <input
				class="btn btn-default" type="button" value="新增" id="add">

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
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${ServiceInfo.list}" var="serv">
					<tr>
						<td>${serv.svrId}</td>
						<td>${serv.svrCustName}</td>
						<td>${serv.svrTitle}</td>
						<td>${serv.svrType}</td>
						<td class="zhuangtai">${serv.svrStatus}</td>
						<c:if test="${serv.svrStatus=='已反馈'}">
							<td>
							<i class="layui-icon layui-icon-face-smile" title="详情" value="${serv.svrId}"></i>
							</td>
						</c:if>
						<c:if test="${serv.svrStatus=='已处理'}">
							<td>
							<i class="layui-icon layui-icon-edit editUser" title="编辑" value="${serv.svrId}"></i> 
							<i class="layui-icon layui-icon-ok updata" title="更新" value="${serv.svrId}"></i></td>
						</c:if>
						<c:if test="${serv.svrStatus=='处理中'}">
							<td>
							<i class="layui-icon layui-icon-edit editUser" title="编辑" value="${serv.svrId}"></i>
							 <i class="layui-icon layui-icon-ok updata" title="更新" value="${serv.svrId}"></i></td>
						</c:if>


					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<!-- 	<div class="fenye">
		<nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="#" aria-label="Previous"> <span
						aria-hidden="true">上一页</span>
				</a></li>
				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
				<li><a href="#" aria-label="Next"> <span aria-hidden="true">下一页</span>
				</a></li>
			</ul>
		</nav>
	</div> -->
		<div class="fenye">
		<table class="footTable">
			<tr>
				<td colspan="5">共${ServiceInfo.total} 条记录 每页${ServiceInfo.size} 条
					第${ServiceInfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect5(1)">首页</a> <c:choose>
						<c:when test="${ServiceInfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect5(${ServiceInfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> 
					<c:choose>
						<c:when test="${ServiceInfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect5(${ServiceInfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> 
					
					<a href="javascript:void(0)"
					onclick="pageSelect5(${ServiceInfo.lastPage})">尾页</a>
				</td>
			</tr>

		</table>
	</div>

	<!-- 新增模态框 -->
	<div class="modal" id="toAdd">
		<div class="modal-dialog" style="height: 400px; overflow: auto;">
			<div class="modal-content">
				<form>
					<div class="modal-body">
						<div class="form-group">
							<label>服务类型:</label> <select name="svrType" id=""
								class="form-control">
								<option value="">请选择服务类型</option>
								<option value="咨询">咨询</option>
								<option value="投诉">投诉</option>
								<option value="建议">建议</option>
							</select>
						</div>
						<div class="form-group">
							<label>概要:</label> <input type="text" name="svrTitle"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户名称:</label> <input type="text" name=svrCustName
								class="form-control">
						</div>
						<div class="form-group">
							<label>状态:</label> <select name="svrStatus" id="" class="form-control">
								<option value="">请选择状态</option>
								<option value="处理中">处理中</option>
								<option value="已处理">已处理</option>
								<option value="已反馈">已反馈</option>
							</select>
						</div>
						<div class="form-group">
							<label>处理人:</label> <input type="text" name="svrDispose"
								class="form-control">
						</div>
						<div class="form-group">
							<label>服务请求:</label> <input type="textarea" name="svrRequest"
								style="height: 60px" class="form-control">
						</div>
						<div class="form-group">
							<label>服务处理过程:</label> <input type="textarea" name="svrHandle"
								style="height: 60px" class="form-control">
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
#service {
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

#deleteModal {
	margin-top: 100px;
}

#toAdd {
	margin-top: 50px;
}
</style>
<script type="text/javascript">
/* var URL = ;
var DATA = null; */
function pageSelect5(curPage){
		$('.layui-body').load('service/findServiceByUsername/' + curPage);
}
	$(function(){
		var svrId = null;
		URL = ${sessionScope.URL}
		$('.layui-icon-face-smile').click(function(){
			svrId = $(this).attr('value');
			 $('.layui-body').load('service/toServiceDetail/'+svrId);  
		})
		// 点击新增显示模态框
		$('#add').click(function(){
			$('#toAdd').show();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click',function(){
			$('button[type=reset]').trigger('click');
				$('#toAdd').hide();
		})
		// 新增模态框保存
		$('button:contains(保存)').on('click',function(){
			var svrType =  $("select[name=svrType] option:selected").val();
			var svrTitle =  $("input[name=svrTitle]").val();
			var  svrCustName =  $("input[name=svrCustName]").val();
			var svrStatus =  $("select[name=svrStatus] option:selected").val();
			var svrDispose =  $("input[name=svrDispose]").val();
			var svrRequest =  $("input[name=svrRequest]").val();
			var svrHandle =  $("input[name=svrHandle]").val();
			var data = {
					"svrType":svrType,
					"svrTitle":svrTitle,
					"svrCustName":svrCustName,
					"svrStatus":svrStatus,
					"svrDispose":svrDispose,
					"svrRequest":svrRequest,
					"svrHandle":svrHandle,
					"svrId":svrId
			}
			var url = "service/saveOrUpdateService";
			$.post(url,data,function(data){
				alert(data);
				$('.layui-body').load('service/findServiceByUsername/1');
				svrId = null;
			})
			$('#toAdd').hide();
			
		})	
		// 点击编辑显示模态框
		$('.editUser').click(function(){
			svrId = $(this).attr('value');
			var url = "service/findServiceById/" + svrId;
			$.post(url,function(data){
				//console.log(data);
				$("select[name=svrType] ").val(data.svrType);
				$("input[name=svrTitle]").val(data.svrTitle);
				$("input[name=svrCustName]").val(data.svrCustName);
				$("select[name=svrStatus] ").val(data.svrStatus);
				$("input[name=svrDispose]").val(data.svrDispose);
				$("input[name=svrRequest]").val(data.svrRequest);
				$("input[name=svrHandle]").val(data.svrHandle);
			})
			$('#toAdd').show();
		})
		// 点击更新
		$('.updata').click(function(){
			var status = $(this).closest('tr').find('.zhuangtai').text();
			svrId = $(this).attr('value');
			// console.log(status)
			if (status=='处理中') {
				status = '已处理';
				var data = {
					"svrId":svrId,
					"svrStatus":status
				}
				var url = "service/saveOrUpdateService";
				$.post(url,data,function(data){
					alert(data);
					$('.layui-body').load('service/findServiceByUsername/1');
					svrId = null;
				})
			}

		})
		// 查询
		$('.search').click(function(){
			var svrCustName = $("input[name=svrCustName1]").val();
			var svrType = $("select[name=svrType1]").val();
			var data = {
				"svrCustName":svrCustName,
				"svrType":svrType
			}
 			var url = "service/findServiceLike/1";
			 $('.layui-body').load(url,data); 
		})
		
	})
</script>