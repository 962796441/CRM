<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!-- 客户信息查询 -->
<div id="customer">
	<div>
		<form class="form-inline">
			<div class="form-group">
				<input type="text" class="form-control" id="custName1Input" name="custName2"
					placeholder="请输入客户名称">
			</div>
			<!-- <div class="form-group">
    <input type="text" class="form-control" id="exampleInputPassword3" placeholder="请输入客户经理">
  </div> -->
			<div class="form-group">
				<select name="city2" id="" class="form-control">
					<option value="">请选择所属地区</option>
					<option value="华中">华中</option>
					<option value="华北">华北</option>
					<option value="华南">华南</option>
					<option value="华东">华东</option>
				</select>
			</div>
			<div class="form-group">
				<select name="level2" id="" class="form-control">
					<option value="">请选择客户等级</option>
					<option value="普通客户">普通客户</option>
					<option value="客户">大客户</option>
					<option value="重点开发客户">重点开发客户</option>
					<option value="合作伙伴">合作伙伴</option>
					<option value="战略合作伙伴">战略合作伙伴</option>
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
					<th>客户经理</th>
					<th>所属地区</th>
					<th>客户等级</th>
					<th>操作</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${customerinfo.list}" var="customer">
				<tr>
					<td>${customer.custId}</td>
					<td>${customer.custName}</td>
					<td>${customer.custManagerName}</td>
					<td>${customer.custRegion}</td>
					<td>${customer.custLevelLabel}</td>
					<td class="test">
					<i class="layui-icon layui-icon-edit first" title="编辑客户信息" value="${customer.custId}"></i> 
					<i class="layui-icon layui-icon-username user" value="${customer.custId}"title="编辑联系人信息"></i>
					<i class="layui-icon layui-icon-read editRecord" title="编辑交往记录" value="${customer.custId}"></i>
					<i value="${customer.custId}" class="layui-icon layui-icon-delete deletee" title="删除客户记录"></i>
					</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="fenye">
		<table class="footTable">
			<tr>
				<td colspan="5">共${customerinfo.total} 条记录 每页5条
					第${customerinfo.pageNum } 页 <a href="javascript:void(0)"
					onclick="pageSelect(1)">首页</a> <c:choose>
						<c:when test="${customerinfo.hasPreviousPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${customerinfo.prePage})">上一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">上一页</font>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${customerinfo.hasNextPage }">
							<a href="javascript:void(0)"
								onclick="pageSelect(${customerinfo.nextPage})">下一页</a>
						</c:when>
						<c:otherwise>
							<font color="#ABA8AB">下一页</font>
						</c:otherwise>
					</c:choose> <a href="javascript:void(0)"
					onclick="pageSelect(${customerinfo.lastPage})">尾页</a>
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
							<label>客户姓名:</label> <input type="text" name="lmName"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户经理:</label> <input type="text" name="msName"
								class="form-control">
						</div>
						<div class="form-group">
							<label>所属地区:</label> <select name="region" id=""
								class="form-control">
								<option value="">请选择所属地区</option>
								<option value="华中">华中</option>
								<option value="华北">华北</option>
								<option value="华南">华南</option>
								<option value="华东">华东</option>
							</select>
						</div>
						<div class="form-group">
							<label>客户等级:</label> <select name="level" id=""
								class="form-control">
								<option value="">请选择客户等级</option>
								<option value="普通客户">普通客户</option>
								<option value="大客户">大客户</option>
								<option value="重点开发客户">重点开发客户</option>
								<option value="合作伙伴">合作伙伴</option>
								<option value="战略合作伙伴">战略合作伙伴</option>
							</select>
						</div>
						<div class="form-group">
							<label>客户地址:</label> <input type="text" name="addr"
								class="form-control">
						</div>
						<div class="form-group">
							<label>邮政编码:</label> <input type="text" name="zip"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户电话:</label> <input type="text" name="tel"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户传真:</label> <input type="text" name="fax"
								class="form-control">
						</div>
						<div class="form-group">
							<label>客户网址:</label> <input type="text" name="website"
								class="form-control">
						</div>
						<div class="form-group">
							<label>营业执照注册号:</label> <input type="text" name="licence_no"
								class="form-control">
						</div>
						<div class="form-group">
							<label>法人:</label> <input type="text" name="chieftain"
								class="form-control">
						</div>
						<div class="form-group">
							<label>注册资金（万元）:</label> <input type="text" name="bankroll"
								class="form-control">
						</div>
						<div class="form-group">
							<label>年营业额:</label> <input type="text" name="turnover"
								class="form-control">
						</div>
						<div class="form-group">
							<label>开户银行:</label> <input type="text" name="bank"
								class="form-control">
						</div>
						<div class="form-group">
							<label>银行账号:</label> <input type="text" name="account"
								class="form-control">
						</div>
						<div class="form-group">
							<label>地税登记号:</label> <input type="text" name="local_tax_no"
								class="form-control">
						</div>
						<div class="form-group">
							<label>国税登记号:</label> <input type="text" name="national_tax_no"
								class="form-control">
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
#customer {
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

.table th, td {
	text-align: center;
}

#add {
	margin-left: 250px;
}

#toAdd {
	margin-top: 50px;
}

#deleteModal {
	margin-top: 100px;
}
</style>
<script type="text/javascript">
	function pageSelect(curPage){
		$('.layui-body').load('customer/findAllCustomerByPage/' + curPage);
	}
	var custId = null;

	
	
	$(function(){
		
		function doClear(){
			$("input[name=lmName]").val("");
			$("input[name=msName]").val("");
			$("select[name=region]").val("");
			$("select[name=level]").val("");
			$("input[name=addr]").val("");
			$("input[name=zip]").val("");
			$("input[name=tel]").val("");
			$("input[name=fax]").val("");
			$("input[name=website]").val("");
			$("input[name=licence_no]").val("");
			$("input[name=chieftain]").val("");
			$("input[name=bankroll]").val("");
			$("input[name=turnover]").val("");
			$("input[name=bank]").val("");
			$("input[name=account]").val("");
			$("input[name=local_tax_no]").val("");
			$("input[name=national_tax_no]").val("");
		}
/**
		$('.user').on('click',function(){
			$('.layui-body').load('./pages/linkman.html');  
		})
		$('.editRecord').on('click',function(){
			$('.layui-body').load('./pages/activities.html');  
		})
**/
		$(".editRecord").on('click',function(){
			custId = $(this).attr("value")
			//console.log(custId);
			$('.layui-body').load("Act/findActivtiesBycustId/"+custId+"/1");
		})


		// 点击新增显示模态框
		$('#add').click(function(){
			$('#toAdd').show();
		})
		// 新增模态框关闭
		$('button:contains(取消)').on('click',function(){
			custId = null;
			$('button[type=reset]').trigger('click');
				$('#toAdd').hide();
		})
		// 新增模态框保存
		$('button:contains(保存)').on('click',function(){
				$('#toAdd').hide();
				var url = 'customer/SaveCustomer';
				
				var custName = $("input[name=lmName]").val();
				var custManagerName = $("input[name=msName]").val();
				var custRegion = $("select[name=region] option:selected").val();
				var custLevelLabel = $("select[name=level] option:selected").val();
				var custAddr = $("input[name=addr]").val();
				var custZip = $("input[name=zip]").val();
				var custTel = $("input[name=tel]").val();
				var custFax = $("input[name=fax]").val();
				var custWebsite = $("input[name=website]").val();
				var custLicenceNo = $("input[name=licence_no]").val();
				var custChieftain = $("input[name=chieftain]").val();
				var custBankroll = $("input[name=bankroll]").val();
				var custTurnover = $("input[name=turnover]").val();
				var custBank = $("input[name=bank]").val();
				var custBankAccount = $("input[name=account]").val();
				var custLocalTaxNo = $("input[name=local_tax_no]").val();
				var custNationalTaxNo = $("input[name=national_tax_no]").val();
				
				var data = {
						"custId":custId,
						"custName":custName,
						"custManagerName":custManagerName,
						"custRegion":custRegion,
						"custAddr":custAddr,
						"custLevelLabel":custLevelLabel,
						"custTel":custTel,
						"custZip":custZip,
						"custFax":custFax,
						"custWebsite":custWebsite,
						"custLicenceNo":custLicenceNo,
						"custChieftain":custChieftain,
						"custBankroll":custBankroll,
						"custTurnover":custTurnover,
						"custBank":custBank,
						"custBankAccount":custBankAccount,
						"custLocalTaxNo":custLocalTaxNo,
						"custNationalTaxNo":custNationalTaxNo
				}
				
				$.post(url,data,function(data){
					alert(data);
					$('.layui-body').load('customer/findAllCustomerByPage/1');
					doClear()
				});
		})	
		// 显示编辑模态框
		$('.first').click(function(){
			custId = $(this).attr("value")
			//console.log(custId);
			var url = 'customer/findCustomerById/'+ custId;
			//alert(url);
			$.get(url,function(data){
				$("input[name=lmName]").val(data.custName);
				$("input[name=msName]").val(data.custManagerName);
				$("select[name=region]").val(data.custRegion);
				$("select[name=level]").val(data.custLevelLabel);
				$("input[name=addr]").val(data.custAddr);
				$("input[name=zip]").val(data.custZip);
				$("input[name=tel]").val(data.custTel);
				$("input[name=fax]").val(data.custFax);
				$("input[name=website]").val(data.custWebsite);
				$("input[name=licence_no]").val(data.custLicenceNo);
				$("input[name=chieftain]").val(data.custChieftain);
				$("input[name=bankroll]").val(data.custBankroll);
				$("input[name=turnover]").val(data.custTurnover);
				$("input[name=bank]").val(data.custBank);
				$("input[name=account]").val(data.custBankAccount);
				$("input[name=local_tax_no]").val(data.custLocalTaxNo);
				$("input[name=national_tax_no]").val(data.custNationalTaxNo);
			});
			$('#toAdd').show();
		})
		// 显示删除模态框
		
		$('.deletee').click(function(){
			$('#deleteModal').show();
			custId = $(this).attr("value")
			//console.log(custId);
			//alert(custId);
		})
		// 关闭删除模态框
		$('.close').click(function(){
			custId = null;
			$('#deleteModal').hide();
			doClear();
		})
		// 关闭删除模态框
		$('.btn-default').click(function(){
			custId = null;
			$('#deleteModal').hide();
			doClear();
		})
		// 确定删除
		$('.btn-primary').click(function(){
			var url = 'customer/deleteCustomerById/'+ custId;
			$.get(url,function(data){
				//alert(data);
				$(".layui-nav-item dd:contains('客户信息查询')").trigger("click");
			});
			$('#deleteModal').hide();
			
		})
		// 查询
		$('.search').click(function(){
			var custName1 = $("input[name=custName2]").val();
			var custRegion1 = $("select[name=city2] option:selected").val();
			var custLevelLabel1 = $("select[name=level2] option:selected").val();
			var data = {
					"CustName":custName1,
					"CustRegion":custRegion1,
					"CustLevelLabel":custLevelLabel1
			}
			//console.log(data);
			$('.layui-body').load('customer/findCustomerLike/1',data);
		})
		
		$('.user').click(function (){
			custId = $(this).attr('value');
			//console.log(custId);
			//alert(custId);
			var  url = 'linkMan/findLinkManById/' + custId + '/1';
			$('.layui-body').load(url);
			
		})
	})
	
</script>