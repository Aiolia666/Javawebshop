package Servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import Bean.ProductDao;
import Bean.ShopcartDao;
import Model.Product;
import Model.Shopcart;

/**
 * Servlet implementation class ShopcartServlet
 */
@WebServlet("*.shopcart")
public class ShopcartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopcartServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String actionUrl = request.getServletPath(); // 获取用户请求的路径
		System.out.println(actionUrl);
		if (actionUrl.equals("/user/add.shopcart")) { // 访问主页请求
			String username=request.getParameter("username");
			String pnum=request.getParameter("pnum");
			int num=Integer.parseInt(request.getParameter("num"));
			if(username==null){
				response.sendRedirect("productlist.jsp");
			}
			//System.out.println(username+pnum+num);
			Shopcart shopcart=new Shopcart();
			shopcart.setUsername(username);
			shopcart.setPnum(pnum);
			shopcart.setNum(num);
			ShopcartDao shopcartDao=new ShopcartDao();
			shopcartDao.add(shopcart);
			response.getWriter().print(1);	
//			//System.out.println(jsonArray.toString());
				
		}
	}

}
