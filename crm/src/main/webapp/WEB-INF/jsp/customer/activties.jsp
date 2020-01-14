<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<div id="activities">
	<div>
		<form class="form-inline">
			<div class="form-group" style="padding-left: 10px;">
				<label style="font-size: 18px;">交往记录:</label>
			</div>
			<input class="btn btn-default" type="button" value="新增" id="add">

		</form>
	</div>

	<div>
		<table class="table table-hover">
			<thead>
				<tr style="background: #E8E8E8;">
					<th>地点</th>
					<th>概要</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
			<c:forEach  items="${actitiesinfo.list}" var="activtiy"> 
				<tr>	
					<td>${activtiy.atvPlace}</td>
					<td>${activtiy.atvTitle}</td>
					<td>${activtiy.atvMemo}</td>
					<td><i class="layui-icon layui-icon-edit editUser" title="编辑" value=${activtiy.atvId}></i>
						<i class="layui-icon layui-icon-delete deleteUser" title="删除" value=${activtiy.atvId}></i>
					</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="fenye">
		<table class="footTable">
			<tr>
				<td colspan="5">共${actitiesinfo.total} 条记录 每页${actitiesinfo.size} 条
					第${actitiesinfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect3(1)">首页</a> <c:choose>
						<c:when test="${actitiesinfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect3(${actitiesinfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${actitiesinfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect3(${actitiesinfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> <a href="javascript:void(0)"
					onclick="pageSelect3(${actitiesinfo.lastPage})">尾页</a>
				</td>
			</tr>

		</table>
	</div>
	<div class="back">
		<button class="btn" style="background: #ccc">返回</button>
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
		<div class="modal-dialog">
			<div class="modal-content">
				<form>
					<div class="modal-body">
						<div class="form-group">
							<label>地点:</label> <input type="text" name="atvPlace"
								class="form-control">
						</div>
						<div class="form-group">
							<label>概要:</label> <input type="text" name="atvTitle"
								class="form-control">
						</div>
						<div class="form-group">
							<label>备注:</label> <input type="textarea" name="atvMemo"
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
.pagination>.active>a, .pagination>.active>a:focus, .pagination>.active>a:hover,
	.pagination>.active>span, .pagination>.active>span:focus, .pagination>.active>span:hover
	{
	background-color: #ccc;
	border-color: #ccc;
}

.pagination>li>a, .pagination>li>span {
	color: black;
}

#activities {
	width: 1140px;
	overflow: hidden;
}

.fenye {
	margin-left: 400px;
}

.back {
	float: right;
}

.form-inline {
	margin-top: 15px;
	margin-left: 10px;
	margin-bottom: 20px;
}

input[type=submit] {
	margin-left: 50px;
}

#add {
	margin-left: 1050px;
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
var custId = ${custId};
var atvId;
function pageSelect3(curPage){
	$('.layui-body').load('Act/findActivtiesBycustId/' + custId +"/"+ curPage);
}


	$(function(){
		//分页
		
		// 显示删除模态框
		$('.deleteUser').click(function(){
			atvId = $(this).attr('value');
			$('#deleteModal').show();
		})
		// 关闭删除模态框
		$('.close').click(function(){
			atvId = null;
			$("input[name=atvPlace]").val("");
			$("input[name=atvTitle]").val("");
			$("input[name=atvMemo]").val("");
			$('#deleteModal').hide();
		})
		// 关闭删除模态框
		$('.btn-default').click(function(){
			atvId = null;
			$("input[name=atvPlace]").val("");
			$("input[name=atvTitle]").val("");
			$("input[name=atvMemo]").val("");
			$('#deleteModal').hide();
		})
		// 确定删除
		$('.btn-primary').click(function(){
			var url = "Act/deleteActivtiyById/" + atvId;
			$.get(url,function(data){
				alert(data);
				atvId = null;
				$('.layui-body').load("Act/findActivtiesBycustId/"+custId+"/1");
			})
			$('#deleteModal').hide();
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
			var atvPlace = $("input[name=atvPlace]").val();
			var atvTitle = $("input[name=atvTitle]").val();
			var atvMemo = $("input[name=atvMemo]").val();
			var data = {
				"atvId":atvId,
				"atvCustId":custId,
				"atvPlace":atvPlace,
				"atvMemo":atvMemo,
				"atvTitle":atvTitle
			}
			//console.log(data);
			var url = "Act/saveActivtiy";
			$.post(url,data,function(msg){
				alert(msg);
				$("input[name=atvPlace]").val("");
				$("input[name=atvTitle]").val("");
				$("input[name=atvMemo]").val("");
				$('.layui-body').load("Act/findActivtiesBycustId/"+custId+"/1");
				atvId = null;
			})
			$('#toAdd').hide();
		})	
		// 点击编辑显示模态框
		$('.editUser').click(function(){
			atvId = $(this).attr('value');
			var url = "Act/findActivtiyById/" + atvId;
			//console.log(atvId);
			$.get(url,function(data){
				$("input[name=atvPlace]").val(data.atvPlace);
				$("input[name=atvTitle]").val(data.atvTitle);
				$("input[name=atvMemo]").val(data.atvTitle);
			})
			$('#toAdd').show();
		})
		// 返回
		$('button:contains(返回)').on('click',function(){
			$('.layui-body').load('customer/findAllCustomerByPage/1');
		})
	})
</script>