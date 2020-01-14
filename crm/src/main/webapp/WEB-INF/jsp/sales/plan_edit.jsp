<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<div id="plan_edit">
	<div class="foot">
		<form>
			<div class="form-group">
				<label>商机详情:</label>
			</div>
		</form>
	</div>

	<div style="margin-bottom: 50px; margin-top: -30px;">
		<table class="table table-hover">
			<thead>
				<tr style="background: #E8E8E8;">
					<th>商机来源</th>
					<th>成功几率</th>
					<th>商机指派</th>
					<th>所属地区</th>
					<th>创建人</th>
					<th>商机描述</th>
				</tr>
			</thead>

			<tbody>
				<tr>
					<td>${chanceExtend.chcSource}</td>
					<td>${chanceExtend.chcRate}</td>
					<td>${chanceExtend.chcDueTo}</td>
					<td>${chanceExtend.chcAddr}</td>
					<td>${chanceExtend.chcCustName}</td>
					<td>${chanceExtend.chcDesc}</td>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="foot">
		<form class="form-inline">
			<div class="form-group">
				<label>开发计划:</label>
			</div>
			<input class="btn btn-default" type="button" value="新增" id="add"
				style="margin-left: 900px;">
		</form>
	</div>
	<div class="kaifa"
		style="margin-bottom: 30px; margin-top: -30px; height: 200px; overflow: auto;">
		<table class="table table-hover">
			<thead>
				<tr style="background: #E8E8E8;">
					<th>序号</th>
					<th>计划内容</th>
					<th>计划结果</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${chanceExtend.plans}" var="plan">
					<tr>
						<td>${plan.plaId}</td>
						<td>${plan.plaTodo}</td>
						<td>${plan.plaResult}</td>
						<td><i class="layui-icon layui-icon-edit editUser" value='${plan.plaId}'></i> <i
							class="layui-icon layui-icon-delete deleteUser" value='${plan.plaId}'></i></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div>
		<form>
			<div class="form-group" style="margin-left: 500px;">
				<input class="btn btn-default tijiao" type="button" value="开发成功">
				<input class="btn btn-default back" type="button"
					value="返&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;回">
			</div>
		</form>
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
							<label>计划内容:</label> <input type="textarea" name="plaTodo"
								style="height: 60px" class="form-control">
						</div>
						<div class="form-group">
							<label>计划结果:</label> <select name="plaResult" id=""
								class="form-control">
								<option value="">请选择计划结果</option>
								<option value="执行中">执行中</option>
								<option value="成功">成功</option>
								<option value="失败">失败</option>
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
#plan_edit {
	width: 1140px;
	overflow: hidden;
}

.kaifa tr td:first-child, th:first-child {
	width: 100px;
}

.foot {
	/*margin-top: 150px;*/
	padding: 10px;
}

.foot label {
	font-size: 18px;
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
	margin-left: 550px;
	width: 100px;
}

.table {
	margin-top: 10px;
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

	$(function(){
		var plaId = null;
	    $('.back').on('click',function(){
	    	$('.layui-body').load('plans/findPlansByUserId/1');
		})		
		//开发成功按钮
		$('.tijiao').on('click',function(){
			var url = "sales/chanceSucceedById";
			$('.layui-body').load(url);
		})
			// 显示删除模态框
		$('.deleteUser').click(function(){
			plaId = $(this).attr('value');
			$('#deleteModal').show();
		})
		// 关闭删除模态框
		$('.close').click(function(){
			plaId = null;	
			$('#deleteModal').hide();
		})
		// 关闭删除模态框
		$('.btn-default').click(function(){
			plaId = null;
			$('#deleteModal').hide();
		})
		// 确定删除
		$('.btn-primary').click(function(){
			var url = "plans/deletPlanByPlaId/" + plaId;
			$.post(url,function(msg){
				$('.layui-body').load(msg);  
			})
			$('#deleteModal').hide();
			plaId = null;	
		})
		// 点击新增显示模态框
		$('#add').click(function(){
			$('#toAdd').show();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click',function(){
			$('button[type=reset]').trigger('click');
			plaId = null;
				$('#toAdd').hide();
		})
		// 新增模态框保存
		$('button:contains(保存)').on('click',function(){
			var plaTodo= $('input[name=plaTodo]').val();
			var plaResult= $("select[name=plaResult] option:selected").val();
			var data = {
				"plaId":plaId,
				"plaTodo":plaTodo,
				"plaResult":plaResult
			}
			//console.log(data);
			var url = "plans/saveOrUpdatePlan";
			$.post(url,data,function(msg){
				$('.layui-body').load(msg);  
			})
				$('#toAdd').hide();
		})	
		// 点击编辑显示模态框
		$('.editUser').click(function(){
			plaId = $(this).attr('value');
			var url = "plans/findPlanByPlanId/" + plaId;
			$.post(url,function(data){
				$('input[name=plaTodo]').val(data.plaTodo);
				$("select[name=plaResult]").val(data.plaResult);
			})
			$('#toAdd').show();
		})

	})
</script>