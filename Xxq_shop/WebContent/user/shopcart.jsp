<%@page import="Model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Bean.ProductDao"%>
<%@page import="Model.Product"%>
<%@page import="Model.Shopcart"%>
<%@page import="java.util.List"%>
<%@page import="Bean.ShopcartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="css/common.css" rel="stylesheet" type="text/css" />
<link href="css/style.css" rel="stylesheet" type="text/css" />
<script src="js/jquery-1.8.3.min.js" type="text/javascript"></script>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript"></script>
<script src="js/common_js.js" type="text/javascript"></script>
<script src="js/footer.js" type="text/javascript"></script>
<script src="layer/layer.js" type="text/javascript"></script>
<script src="Plugins/laydate/laydate.js" type="text/javascript"></script>
<title>消息中心</title>
</head>
 <link rel="stylesheet" href="cart/css/reset.css">
    <link rel="stylesheet" href="cart/css/carts.css">
     <script src="cart/js/jquery.min.js"></script>
    <script src="cart/js/carts.js"></script>
<body>
<head>
<% 
User user=new User();
user=(User)session.getAttribute("user");
%>
 <div id="header_top">
  <div id="top">
    <div class="Inside_pages">
     <ul>
       <% 
      	 if(user==null){
       %>
                <li><a href="" target="_blank" class=" colororange">请登录</a></li>
                <li><a href="" target="_blank">注册会员</a></li>
       <%
         }else{
       %>
       		<li>欢迎<%=user.getUsername() %>登录<a href="productlist.html" target="_blank" class=" colororange">退出</a>   </li>
       <%
         }
       %>
            </ul>
	<div class="hd_top_manu clearfix">
	  <ul class="clearfix">
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="productlist.html">首页</a></li> 
	   <li class="hd_menu_tit" data-addclass="hd_menu_hover"> <a href="gerenzhongxin.jsp">个人中心</a> </li>

        <li class="hd_menu_tit" data-addclass="hd_menu_hover"><a href="shopcart.jsp">我的购物车<b></b></a></li>	
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
</div>
<!--菜单栏-->
	<div class="Navigation" id="Navigation">
		 <ul class="Navigation_name">
			<li><a href="productlist.html">首页</a></li>
			<li><a href="#"></a></li>
			<li><a href="#">预售专区</a><em class="hot_icon"></em></li>
			<li><a href="products_list.html">商城</a></li>
			<li><a href="#">半小时生活圈</a></li>
			<li><a href="#">好评商户</a></li>
			<li><a href="#">热销活动</a></li>
			<li><a href="Brands.html">联系我们</a></li>
		 </ul>			 
		</div>
	<script>$("#Navigation").slide({titCell:".Navigation_name li",trigger:"click"});</script>
    </div>
    
    
    <% 
    	ShopcartDao shopcartDao=new ShopcartDao();
    	String sql="select * from s_shopcart";
    	List<Shopcart> shopcarts=shopcartDao.load(sql);
    
    
    
    %>
    
    
    
    
    
    <section class="cartMain">
        <div class="cartMain_hd">
            <ul class="order_lists cartTop">
                <li class="list_chk">
                    <!--所有商品全选-->
                    <input type="checkbox" id="all" class="whole_check">
                    <label for="all"></label>
                    全选
                </li>
                <li class="list_con">商品信息</li>
                <li class="list_info">商品参数</li>
                <li class="list_price">单价</li>
                <li class="list_amount">数量</li>
                <li class="list_sum">金额</li>
                <li class="list_op">操作</li>
            </ul>
        </div>

        <div class="cartBox">
            <div class="shop_info">
                <div class="all_check">
                    <!--店铺全选-->
<!--                     <input  id="shop_a" class="shopChoice"> -->
                    <label for="shop_a" class="shop"></label>
                </div>
                <div class="shop_name">
                    店铺：<a href="javascript:;">搜猎人艺术生活</a>
                </div>
            </div>
            <div class="order_content">
            <form action="jiesuan.jsp" id="buy" method="post">
            <%
            	ArrayList ids=new ArrayList();
            	int i=0;
            	for(Shopcart shopcart:shopcarts){
            		i++;
            		String pnum=shopcart.getPnum();
            		Product product =new Product();
            		ProductDao productDao=new ProductDao();
            		String sqlli="select * from s_product where pnum='"+pnum+"'";
            		product=productDao.loadone(sqlli);
            		ids.add(shopcart.getId());
            %>
            
            	
                <ul class="order_lists" id="<%=shopcart.getId() %>">
                    <li class="list_chk">
                        <input type="checkbox" id="checkbox_<%=i %>"  name="choosebuy" value="<%=shopcart.getId() %>" class="son_check">
                        <label for="checkbox_<%=i %>"></label>
                    </li>
                    <li class="list_con">
                        <div class="list_img"><a href="javascript:;"><img src="products/<%=product.getPname() %>.jpg" alt=""></a></div>
                        <div class="list_text"><a href="javascript:;"><%=product.getPname() %></a></div>
                    </li>
                    <li class="list_info">
                        <p><%=product.getPxinxi()%></p>
<!--                         <p>尺寸：16*16*3(cm)</p> -->
                    </li>
                    <li class="list_price">
                        <p class="price">￥<%=product.getPrice() %></p>
                    </li>
                    <li class="list_amount">
                        <div class="amount_box">
                            <a href="javascript:;" class="reduce reSty">-</a>
                            <input type="text" value="<%=shopcart.getNum() %>" class="sum">
                            <a href="javascript:;" class="plus">+</a>
                        </div>
                    </li>
                    <li class="list_sum">
                        <p class="sum_price"><%=product.getPrice()*shopcart.getNum() %></p>
                    </li>
                    <li class="list_op">
                        <p class="del"><a href="javascript:;" class="delBtn" >移除商品</a></p>
                    </li>
                    
                </ul>
                <%
                
            	}
            	session.setAttribute("ids", ids);
                %>
                
               
            </div>
        </div>
       

        <div class="bar-wrapper">
            <div class="bar-right">
                <div class="piece">已选商品<strong class="piece_num">0</strong>件</div>
                <div class="totalMoney">共计: <strong class="total_text">0.00</strong></div>
                <div class="calBtn"><a  onclick="document.getElementById('buy').submit();">结算</a></div>
            </div>
        </div>
         </form>
    </section>
    <section class="model_bg"></section>
    <section class="my_model">
        <p class="title">删除宝贝<span class="closeModel">X</span></p>
        <p>您确认要删除该宝贝吗？</p>
        <div class="opBtn"><a href="javascript:;" class="dialog-sure">确定</a><a href="javascript:;" class="dialog-close">关闭</a></div>
    </section>
	
    <script src="js/jquery.min.js"></script>
    <script src="js/carts.js"></script>
	<div style="text-align:center;">
</div>
<script>

    
    
    
</script>
    
    
    
</head>

</html>