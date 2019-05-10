<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link href="css/jquery-labelauty.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="js/jquery-labelauty.js" type="text/javascript"></script>
<title>发布商品</title>
</head>

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
<!--发布商品样式-->
<div class="Inside_pages clearfix">
 <div class="left_style">
<!--列表-->
  <div class="menu_style">
      <ul class="menu_list">

    <li ><em></em><a href="showguanli.jsp">订单专区</a></li>
    <li class="on"><em></em><a href="addproduct.jsp">店铺上新</a></li>
   </ul>
  </div>
</div>
<%
if(request.getAttribute("success")!=null){
	out.print("<script language='javaScript'>alert('添加商品成功');</script>");
	
}
%>
<form action="<%=request.getContextPath() %>/addproduct.product" id="sh" name="sh" method="post" enctype="multipart/form-data"> 

<div class="right_style">
  <!--内容详细-->
  
   <div class="title_style"><em></em>发布商品</div>
    <div class="content_style">
     <div class="Release_product_style" align="center">
     <form>
     
     <span style="font-size:50px">商品添加成功！</span>
     </form>
     </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(function(){
	$(':input').labelauty();
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