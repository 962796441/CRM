<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<!-- 销售商机 -->
<div id="sales">
	<div>
		<form class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control"  name= "chcCustName"
					placeholder="请输入客户名称">
			</div>

			<div class="form-group">
				<select name="city" id="" class="form-control" >
					<option value="">请选择所属地区</option>
					<option value="华中">华中</option>
					<option value="华北">华北</option>
					<option value="华南">华南</option>
					<option value="华东">华东</option>
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
					<th>联系人</th>
					<th>联系电话</th>
					<th>商机指派</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${pageInfo.list}" var="chance">
					<tr>
						<td>${chance.chcId}</td>
						<td>${chance.chcCustName}</td>
						<td>${chance.chcTitle}</td>
						<td>${chance.chcLinkman}</td>
						<td>${chance.chcTel}</td>
						<td>${chance.chcDueTo}</td>
						<td><i class="layui-icon layui-icon-edit editUser" title="" value=${chance.chcId}></i> <i
							class="layui-icon layui-icon-delete deleteUser" title="" value=${chance.chcId}></i></td>
					</tr>

				</c:forEach>



			</tbody>
		</table>
	</div>
	<div class="fenye">
		<table class="footTable">
			<tr>
				<td colspan="5">共${pageInfo.total} 条记录 每页${pageInfo.size} 条
					第${pageInfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect4(1)">首页</a> <c:choose>
						<c:when test="${pageInfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect4(${pageInfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${pageInfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect4(${pageInfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> <a href="javascript:void(0)"
					onclick="pageSelect4(${pageInfo.lastPage})">尾页</a>
				</td>
			</tr>

		</table>
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
							<label>商机来源:</label> <input type="text" name="chcSource"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户名称:</label> <input type="text" name="chcCustName1"
								class="form-control">
						</div>
						<div class="form-group">
							<label>成功几率:</label> <input type="text" name="chcRate"
								class="form-control">
						</div>
						<div class="form-group">
							<label>商机概要:</label> <input type="text" name="chcTitle"
								class="form-control">
						</div>
						<div class="form-group">
							<label>所属地区:</label> <select name="chcAddr" id=""
								class="form-control">
								<option value="">请选择所属地区</option>
								<option value="华中">华中</option>
								<option value="华北">华北</option>
								<option value="华南">华南</option>
								<option value="华东">华东</option>
							</select>
						</div>
						<div class="form-group">
							<label>联系人:</label> <input type="text" name="chcLinkman"
								class="form-control">
						</div>
						<div class="form-group">
							<label>联系电话:</label> <input type="text" name="chcTel"
								class="form-control">
						</div>
						<div class="form-group">
							<label>创建人:</label> <input type="text" name="chcCreateBy"
								class="form-control">
						</div>
						<div class="form-group">
							<label>处理人:</label> <select name="chcDueTo" id=""
								class="form-control">
								<option value="">请选择处理人</option>
								<c:forEach items="${sys_user}" var="s_user">
									<option value='${s_user.usrName}'>${s_user.usrName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label>商机描述:</label> <input type="textarea" name="chcDesc"
								style="height: 60px" class="form-control">
						</div>
					</div>
				</form>
				<div class="modal-footer">
					<button class="btn" style="background: #ccc">取消</button>
					<button class="btn" style="background: #ccc" >保存</button>
				</div>
			</div>
		</div>
	</div>

</div>
<style>
#sales {
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
function pageSelect4(curPage){
	$('.layui-body').load('sales/findSalesChance/'+ curPage);
}
function doClear(){
	$("input[name=chcSource]").val("");
	$("input[name=chcCustName1]").val("");
	$("input[name=chcRate]").val("");
	$("input[name=chcTitle]").val("");
	$("select[name=chcAddr] ").val("");
	$("input[name=chcTel]").val("");
	$("select[name=chcDueTo] ").val("");
	$("input[name=chcDesc]").val("");
	$("input[name=chcCreateBy]").val("");
	$("input[name=chcLinkman]").val("");
}
	$(function() {
		var chcId = null;
		// 显示删除模态框
		$('.deleteUser').click(function() {
			chcId = $(this).attr('value');
			$('#deleteModal').show();
		})
		// 关闭删除模态框
		$('.close').click(function() {
			$(".form-group").val("");
			$('#deleteModal').hide();
		})
		// 关闭删除模态框
		$('.btn-default').click(function() {
			$(".form-group").val("");
			$('#deleteModal').hide();
		})
		// 确定删除
		$('.btn-primary').click(function() {
			var url = "sales/deleteChanceById/" + chcId;
			$.get(url,function(msg){
				alert(msg);
				chcId = null;
				$('.layui-body').load('sales/findSalesChance/1');
			})
			$('#deleteModal').hide();
		})
		// 点击新增显示模态框
		$('#add').click(function() {
			$('#toAdd').show();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click', function() {
			doClear();
			$('#toAdd').hide();
		})
				// 新增模态框关闭

		// 新增模态框保存
		$('button:contains(保存)').on('click', function() {
			var chcSource = $("input[name=chcSource]").val()
			var chcCustName = $("input[name=chcCustName1]").val()
			var chcRate = $("input[name=chcRate]").val()
			var chcTitle = $("input[name=chcTitle]").val()
			var chcAddr = $("select[name=chcAddr] option:selected").val()
			var chcTel = $("input[name=chcTel]").val()
			var chcDueTo = $("select[name=chcDueTo] option:selected").val()
			var chcDesc = $("input[name=chcDesc]").val()
			var chcCreateBy = $("input[name=chcCreateBy]").val()
			var chcLinkman = $("input[name=chcLinkman]").val()
			var data = {
				"chcId":chcId,
				"chcSource":chcSource,
				"chcCustName":chcCustName,
				"chcRate":chcRate,
				"chcTitle":chcTitle,
				"chcAddr":chcAddr,
				"chcTel":chcTel,
				"chcDueTo":chcDueTo,
				"chcDesc":chcDesc,
				"chcCreateBy":chcCreateBy,
				"chcLinkman":chcLinkman,
			}			
			var url = "sales/saveOrUpdata";
			$.get(url,data,function(msg){
				alert(msg);
				chcId = null;
				$(".form-group").val("");
				$('.layui-body').load('sales/findSalesChance/1');
			})
			$('#toAdd').hide();
		})
		// 点击编辑显示模态框
		$('.editUser').click(function() {
			chcId = $(this).attr('value');
			var url = "sales/findChanceById/" + chcId;
			$.get(url,function(data){
				$("input[name=chcSource]").val(data.chcSource)
				$("input[name=chcCustName1]").val(data.chcCustName)
				$("input[name=chcRate]").val(data.chcRate)
				$("input[name=chcTitle]").val(data.chcTitle)
				$("select[name=chcAddr] ").val(data.chcAddr)
				$("input[name=chcTel]").val(data.chcTel)
				$("select[name=chcDueTo] ").val(data.chcDueTo)
				$("input[name=chcDesc]").val(data.chcDesc)
				$("input[name=chcCreateBy]").val(data.chcCreateBy)
				$("input[name=chcLinkman]").val(data.chcLinkman)
			})
			$('#toAdd').show();
		})
		// 查询
		$('.search').click(function() {
			var chcCustName = $("input[name=chcCustName]").val();
			var chcAddr = $("select[name=city] option:selected").val();
			var data = {
				"chcCustName":chcCustName,
				"chcAddr":chcAddr
			}
			var url = "sales/findChanceLike/1";
			$('.layui-body').load(url,data);
		})
	})
</script>