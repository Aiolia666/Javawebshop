<%@page import="Bean.ProductDao"%>
<%@page import="Model.Product"%>
<%@page import="Model.Dingdan"%>
<%@page import="java.util.List"%>
<%@page import="Bean.DingdanDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="skins/all.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/iCheck.js" type="text/javascript"></script>
<script src="js/custom.js" type="text/javascript"></script>
<title>订单管理</title>
</head>
<script type="text/javascript">
$(document).ready(function () {
	
	$('#CheckedAll').on('ifChecked', function(event){
		$('input').iCheck('check');
	});
	$('#CheckedAll').on('ifUnchecked', function(event){
		$('input').iCheck('uncheck');
	});
   //全选
//   $("#CheckedAll").click(function () {
//	   if (this.checked) {                 //如果当前点击的多选框被选中
//		   $('ifChecked').attr("check", true);
//	   } else {
//		   $('ifUnchecked').attr("uncheck", false);
//	   }
//   });
//   $('input[type=checkbox][name=checkitems]').click(function () {
//	   var flag = true;
//	   $('input[type=checkbox][name=checkitems]').each(function () {
//		   if (!this.checked) {
//			   flag = false;
//		   }
//	   });
//
//	   if (flag) {
//		   $('#CheckedAll').attr('checked', true);
//	   } else {
//		   $('#CheckedAll').attr('checked', false);
//	   }
//   });
   //输出值
   $("#send").click(function () {
	      if($("input[type='checkbox'][name='checkitems']:checked").attr("checked")){
	   var str = "批量确认收货订单：\r\n";
	   $('input[type=checkbox][name=checkitems]:checked').each(function () {
		   str += $(this).val() + "\r\n";
	   })
	   alert(str);
		  }
		  else{
			   var str = "你未选中任何商品，请选择后在操作！"; 
			   alert(str);
       }
	   	    
   });
})
</script>
<body>
<head>
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
      <div class="Collection"><a href="#" class="green">请登录</a> <a href="#" class="green">免费注册</a></div>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">首页</a></li> 
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="#">我的小充</a> </li>
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">消息中心</a></li>
       <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">商品分类</a></li>
        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="#">我的购物车<b>(23)</b></a></li>	
	  </ul>
	</div>
    </div>
  </div>
  <div id="header"  class="header page_style">
  <div class="logo"><a href="index.html"><img src="images/logo.png" /></a></div>
  <!--结束图层-->
  <div class="Search">
        <div class="search_list">
            <ul>
                <li class="current"><a href="#">产品</a></li>
                <li><a href="#">信息</a></li>
            </ul>
        </div>
        <div class="clear search_cur">
           <input name="searchName" id="searchName" class="search_box" onkeydown="keyDownSearch()" type="text">
           <input name="" type="submit" value="搜 索"  class="Search_btn"/>
        </div>
        <div class="clear hotword">热门搜索词：香醋&nbsp;&nbsp;&nbsp;茶叶&nbsp;&nbsp;&nbsp;草莓&nbsp;&nbsp;&nbsp;葡萄&nbsp;&nbsp;&nbsp;菜油</div>
</div>
 <!--购物车样式-->

</div>
<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
			<li><a href="Home.html">首页</a></li>
            <li><span class="bg_muen"></span><a href="#">半小时生活圈</a></li>
			<li><a href="#">你身边的超市</a></li>
			<li><a href="#">预售专区</a><em class="hot_icon"></em></li>
			<li><a href="products_list.html">商城</a></li>
			
			<li><a href="#">好评商户</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="Brands.html">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
</head>
<div class="Inside_pages clearfix">
 <div class="left_style">
<!--列表-->
  <div class="menu_style">
      <ul class="menu_list">

    <li class="on"><em></em><a href="showguanli.jsp">订单专区</a></li>
    <li><em></em><a href="addproduct.jsp">店铺上新</a></li>
   </ul>
  </div>
</div>
 <% 
		DingdanDao dingdanDao=new DingdanDao();
		String sql="select * from s_dingdan";
		List<Dingdan> dingdans=dingdanDao.load(sql);
		int yichuli=0;
		int weichuli=0;
		for(Dingdan dingdan:dingdans){
			if(dingdan.getType()==0)
				weichuli+=1;
			else
				yichuli+=1;
		}

%>    



 <div class="right_style">
  <div class="title_style"><em></em>已处理订单管理</div> 
   <div class="Order_form_style">
      <div class="Order_form_filter">
       <a href="showguanli.jsp" class="">全部订单<%=dingdans.size() %></a>
       <a href="weichuli.jsp" class="">未处理<%=weichuli %></a>
       <a href="yichuli.jsp" class="on">已处理<%=yichuli %></a>

      </div>
      <div class="Order_Operation">
     <div class="left"> <label><input name="" type="checkbox" value=""  class="checkbox"/>全选</label> <input name="" type="submit" value="批量确认收货"  class="confirm_Order"/></div>
     <div class="right_search"><input name="" type="text"  class="add_Ordertext" placeholder="请输入产品标题或订单号进行搜索"/><input name="" type="submit" value="搜索订单"  class="search_order"/></div>
      </div>
  
  
      <div class="Order_form_list">
         <table>
         <thead>
          <tr><td class="list_name_title0">商品</td>
          <td class="list_name_title1">单价(元)</td>
          <td class="list_name_title2">数量</td>
          <td class="list_name_title4">实付款(元)</td>
          <td class="list_name_title5">订单状态</td>
          <td class="list_name_title6">操作</td>
         </tr>
         </thead> 
         <%
         
         	for (Dingdan dingdan:dingdans){
         		if(dingdan.getType()==0)
         			continue;
         		Product product=new Product();
         		ProductDao productDao=new ProductDao();
         		String sqlli="select * from s_product where pnum='"+dingdan.getPnum()+"'";
         		product=productDao.loadone(sqlli);
         %>
         <tbody>       
           <tr class="Order_info"><td colspan="6" class="Order_form_time"><input name="" type="checkbox" value=""  class="checkbox"/> 订单号：<%=dingdan.getDingdannum() %> <em></em></td></tr>
           <tr class="Order_Details">
           <td colspan="3">
           <table class="Order_product_style">
           <tbody>
           <tr>
           <td>
            <div class="product_name clearfix">
            <a href="#" class="product_img"><img src="../user/products/<%=product.getPname() %>.jpg" width="80px" height="80px"></a>
            <a href="3" class="p_name"><%=product.getPname() %></a>
            <p class="specification">礼盒装20个/盒</p>
            </div>
            </td>
            <td><%=product.getPrice() %></td>
           <td><%=dingdan.getNum() %></td>
            </tr>
            </tbody>
            </table>
           </td>   
           <td class="split_line"><%=product.getPrice()*dingdan.getNum() %></td>
           <%
           		if(dingdan.getType()==0){
           	%>
           		<td class="split_line"><p style="color:#F30">未发货</p></td>
           		<td class="operating">
            	 <a href="#">发货</a>
           		</td>
           	<%
           		}else{
           %>
           <td class="split_line"><p style="color:#F30">已发货，待收货</p></td>
           <td class="operating">
             <a href="#"></a>
           </td>
           <%
           		}
           %>
           
           </tr>
           </tbody>
            
           <%
         	}
           %>
           
            
         </table>
    </div>
     </div>
   </div>
</div>
   <script>
            $(document).ready(function(){
              $('.Order_form_style input').iCheck({
                checkboxClass: 'icheckbox_flat-green',
                radioClass: 'iradio_flat-green'
              });
            });
            </script>
<!--网站地图-->
<div class="fri-link-bg clearfix">
    <div class="fri-link">
        <div class="logo left margin-r20"><img src="images/fo-logo.jpg" width="152" height="81" /></div>
        <div class="left"><img src="images/qd.jpg" width="90"  height="90" />
            <p>扫描下载APP</p>
        </div>
       <div class="">
    <dl>
	 <dt>新手上路</dt>
	 <dd><a href="#">售后流程</a></dd>
     <dd><a href="#">购物流程</a></dd>
     <dd><a href="#">订购方式</a> </dd>
     <dd><a href="#">隐私声明 </a></dd>
     <dd><a href="#">推荐分享说明 </a></dd>
	</dl>
	<dl>
	 <dt>配送与支付</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
	<dl>
	 <dt>售后保障</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
	<dl>
	 <dt>支付方式</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>	
    <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
     <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>
     <dl>
	 <dt>帮助中心</dt>
	 <dd><a href="#">保险需求测试</a></dd>
     <dd><a href="#">专题及活动</a></dd>
     <dd><a href="#">挑选保险产品</a> </dd>
     <dd><a href="#">常见问题 </a></dd>
	</dl>	   
   </div>
    </div>
</div>
<!--网站地图END-->
<!--网站页脚-->
<div class="copyright">
    <div class="copyright-bg">
        <div class="hotline">为生活充电在线 <span>招商热线：****-********</span> 客服热线：400-******</div>
        <div class="hotline co-ph">
            <p>版权所有Copyright ©***************</p>
            <p>*ICP备***************号 不良信息举报</p>
            <p>总机电话：****-*********/194/195/196 客服电话：4000****** 传 真：********
                
                <a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
        </div>
    </div>
</div>
</body>
</html>
