$(function(){
  $('.layui-nav-child').on({
    click:function(){
    	var  tag= $(this).text().replace(/\s*/g,"");
    	//console.log(tag);
      if(tag=="商机开发计划"){
        $('.layui-body').load('plans/findPlansByUserId/1');
       
      }
       if(tag=="销售商机管理"){
    	   $('.layui-body').load('sales/findSalesChance/1');
      }
       if(tag=="客户信息查询"){
//    	console.log("in 客户")
        $('.layui-body').load('customer/findAllCustomerByPage/1');
        
      }
      // if($(this).text()=="客户信息添加"){
      //   $('.layui-body').load('./pages/customer_add.html');
       
      // }
      if(tag=="服务反馈"){
        $('.layui-body').load('service/toFeedback/1');
        
      }
      if(tag=="服务处理"){
        $('.layui-body').load('service/findServiceByUsername/1');
       
      }
      if(tag=="客户贡献分析"){
        $('.layui-body').load('report/toContribution');
       
      }
       if(tag=="客户构成分析"){
        $('.layui-body').load('report/toCustConstitute');
        
      }
       if(tag=="角色管理"){
        $('.layui-body').load('role/toRoleManage');
        
      }
       if(tag=="用户管理"){
        $('.layui-body').load('user/toUserManage/1');
      }
      
    }
  },'dd');
});




