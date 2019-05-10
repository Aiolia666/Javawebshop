package Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Bean.UserDao;
import Model.User;

/**
 * Servlet implementation class UserServlet
 */

@WebServlet("*.useraction")
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
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
		if (actionUrl.equals("/user/zhuce.useraction")) { // 访问主页请求
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			String password2=request.getParameter("password2");
			System.out.println(username+password+password2);
			User user=new User();
			user.setUsername(username);
			user.setPassword(password);
			user.setType(1);
			UserDao userDao=new UserDao();
			int r=0;
			if(!password.equals(password2)){
				r=0;	
			}
			try {
				userDao.add(user);
				r=1;
			} catch (Exception e) {
				// TODO: handle exception
				r=0;
			}
			response.getWriter().print(r);
			
		}else if(actionUrl.equals("/user/login.useraction")){
			String username=request.getParameter("username");
			String password=request.getParameter("password");
			User user=new User();
			UserDao userDao=new UserDao();
			user=userDao.load(username);
			int r;
			if(user!=null){
				if(user.getPassword().equals(password)){
					HttpSession session=request.getSession(); 
					session.setAttribute("user", user);
					r=1;
					if(user.getType()==0)
						r=3;
					
				}else{
					r=0;
				}
			}else{
				r=0;
			}
			//System.out.println(r);
			response.getWriter().print(r);
		}else if(actionUrl.equals("/user/addplace.useraction")){
			String username=request.getParameter("username");
			String place=request.getParameter("place");
			String address=request.getParameter("address");
			String  phone=request.getParameter("phone");
			String sql="update  s_user set place='"+place+"' ,address='"+address+"' ,phone='"+phone+"' where username='"+username+"'";
			System.out.println(sql);
			UserDao userDao=new UserDao();
			int r=0;
			try {
				userDao.update(sql);
				r=1;
				
			} catch (Exception e) {
				// TODO: handle exception
				r=0;
			}
			response.getWriter().print(r);
			
			
		}
	}

}
