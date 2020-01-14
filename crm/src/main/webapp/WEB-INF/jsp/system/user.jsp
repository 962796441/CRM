<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 用户 -->
<div id="user">
	<div>
		<form class="form-inline">
			<div class="form-group">
				<select name="roleName_2" id="" class="form-control" >
					<option value="" disabled selected>请选择用户角色类型</option>
					<c:forEach items="${rolelist}" var="role">
						<option value="${role.roleName}">${role.roleName}</option>
					</c:forEach>
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
					<th>用户名</th>
					<th>角色名</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
			<c:forEach items="${sysuserInfo.list}" var="sysuser">
				<tr>
					<td>${sysuser.usrId}</td>
					<td>${sysuser.usrName}</td>
					<td>${sysuser.usrRoleName}</td>
					<c:if test="${sysuser.usrFlag==1}">
						<td>正常</td>
					</c:if>
					<c:if test="${sysuser.usrFlag==0}">
						<td>注销</td>
					</c:if>					
					<td><i class="layui-icon layui-icon-edit editUser" value='${sysuser.usrId}'></i> <i
						class="layui-icon layui-icon-delete deleteUser" value='${sysuser.usrId}'></i></td>
				</tr>			
			</c:forEach>

			</tbody>
		</table>
	</div>
	<div class="fenye">
		<nav aria-label="Page navigation">
			<ul class="pagination">
			<li> <span aria-hidden="true">共${sysuserInfo.total} 条记录</span></li>
			<%-- <li> <span aria-hidden="true">每页${sysuserInfo.size} 条</span></li> --%>
			
			<li><a href="javascript:void(0)" onclick="pageSelect7(1)"
				aria-label="Previous"> <span aria-hidden="true">首页</span>
			</a></li>			
				<c:choose>
					<c:when test="${sysuserInfo.hasPreviousPage }">
						<li><a href="javascript:void(0)"
							onclick="pageSelect7(${sysuserInfo.prePage})"
							aria-label="Previous"> <span aria-hidden="true">上一页</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:void(0)" disenable="true"
							onclick="pageSelect7(${sysuserInfo.prePage})"
							aria-label="Previous"> <span aria-hidden="true">上一页</span>
						</a></li>
					</c:otherwise>
				</c:choose>
				<li> <span aria-hidden="true">第${sysuserInfo.pageNum } 页</span></li>
<!-- 				<li class="active"><a href="#">1</a></li>
				<li><a href="#">2</a></li>
				<li><a href="#">3</a></li>
				<li><a href="#">4</a></li>
				<li><a href="#">5</a></li>
 -->
				<c:choose>
					<c:when test="${sysuserInfo.hasNextPage}">
						<li><a href="javascript:void(0)"
							onclick="pageSelect7(${sysuserInfo.nextPage})" aria-label="Next">
								<span aria-hidden="true">下一页</span>
						</a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:void(0)" disenable="true"
							onclick="pageSelect7(${sysuserInfo.nextPage})" aria-label="Next">
								<span aria-hidden="true">下一页</span>
						</a></li>						
					</c:otherwise>
				</c:choose>
			<li><a href="javascript:void(0)" onclick="pageSelect7(${sysuserInfo.lastPage})"
				aria-label="Previous"> <span aria-hidden="true">尾页</span>
			</a></li>				

			</ul>
		</nav>
	</div>
	<!-- 删除模态框 -->
	<div class="modal" id="deleteModal">
		<div class="modal-dialog" style="width: 350px;">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">是否确定删除</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default " data-dismiss="modal">取消</button>
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
							<label>用户名:</label> <input type="text" name="usrName_1"
								class="form-control">
						</div>
						<div class="form-group">
							<label>密码:</label> <input type="password" name="usrPassword_1"
								class="form-control">
						</div>
						<div class="form-group">
							<label>角色:</label> <select name="usrRoleId_1" id=""
								class="form-control">
								<option value="" disabled selected>请选择用户角色类型</option>
								<c:forEach items="${rolelist}" var="role">
									<option value="${role.roleId}">${role.roleName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>状态:</label> <select name="usrFlag_1" id=""
								class="form-control">
								<option value="1">正常</option>
								<option value="0">注销</option>
							</select>
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
#user {
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
	margin-left: 680px;
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
function pageSelect7(curPage){
	$('.layui-body').load('user/toUserManage/' + curPage);
}
function doClear(){
	$("input[name=usrName_1]").val("");
	$("input[name=usrPassword_1]").val("");
	$("select[name=usrRoleId_1]").val("");
	$("select[name=usrFlag_1]").val("");		
}
	$(function(){
	var usrId = null;
		// 显示删除模态框
		$('.deleteUser').click(function(){
			usrId = $(this).attr('value');
			$('#deleteModal').show();
		})
		// 关闭删除模态框
		$('.close').click(function(){
			usrId = null;
			doClear();
			$('#deleteModal').hide();
		})
		// 关闭删除模态框
		$('.btn-default').click(function(){
			usrId = null;
			doClear();
			$('#deleteModal').hide();
		})
		// 确定删除
		$('.btn-primary').click(function(){
			var url = "user/deleteUser";
			$.get(url,{usrId:usrId},function(data){
				alert(data);
				usrId = null;
				doClear();
				$('.layui-body').load('user/toUserManage/1');
			})

			$('#deleteModal').hide();
		})
		// 点击新增显示模态框
		$('#add').click(function(){
			$('#toAdd').show();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click',function(){
			usrId = null;
			doClear();
			$('#toAdd').hide();
		})
		// 新增模态框保存
		$('button:contains(保存)').on('click',function(){
			var usrName = $("input[name=usrName_1]").val();
			var usrPassword = $("input[name=usrPassword_1]").val();
			var usrRoleId = $("select[name=usrRoleId_1] option:selected").val();
			var usrFlag = $("select[name=usrFlag_1] option:selected").val();
			var data  = {
				"usrId":usrId,
				"usrName":usrName,
				"usrPassword":usrPassword,
				"usrRoleId":usrRoleId,
				"usrFlag":usrFlag
			}
			var url = "user/saveOrUpdateUser";
			$.post(url,data,function(msg){
				alert(msg);
				usrId = null;
				doClear();
				$('.layui-body').load('user/toUserManage/1');
			})
				$('#toAdd').hide();
		})	
		// 点击编辑显示模态框
		$('.editUser').click(function(){
			usrId = $(this).attr('value');
			var url = "user/findUserByUserId";
			$.get(url,{usrId:usrId},function(data){
				$("input[name=usrName_1]").val(data.usrName);
				$("input[name=usrPassword_1]").val(data.usrPassword);
				$("select[name=usrRoleId_1]").val(data.usrRoleId);
				$("select[name=usrFlag_1]").val(data.usrFlag);				
			})
			$('#toAdd').show();
		})
		// 查询
		$('.search').click(function(){
			var usrRoleName = $("select[name=roleName_2] option:selected").val();
			var url = "user/findUserByRolename/1";
			$('.layui-body').load(url,{usrRoleName:usrRoleName});
		})
	})
</script>