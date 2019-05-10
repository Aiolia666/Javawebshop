package Servlet;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import java.util.Map;
import org.json.JSONArray;
import org.json.JSONObject;



import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.RequestContext;
import org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory;
import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.json.*;
import jdk.nashorn.internal.runtime.JSONListAdapter;
import Bean.ProductDao;
import Bean.UserDao;
import Model.Product;
import Model.User;

/**
 * Servlet implementation class ProductServlet
 */
@WebServlet("*.product")

@MultipartConfig(location="D:/作业/jac/Xxq_shop/WebContent/user/products")
public class ProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		response.getHeader("Content-Disposition");
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
		if (actionUrl.equals("/user/list.product")) { // 访问主页请求
			String sql="select * from s_product ";
			String id=request.getParameter("id");
			if(id!=null)
				sql+="where pclass= '"+id+"'";
			//System.out.println(id);
			ProductDao productDao=new ProductDao();
			List<Product> list = productDao.load(sql);
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Product product = list.get(i);
				Map<String, Object> map =  new HashMap<String, Object>();
				map.put("pnum", product.getPnum());
				map.put("pname",  product.getPname());
				map.put("price", product.getPrice());
				map.put("pxinxi", product.getPxinxi());
				map.put("pclass", product.getPclass());
				JSONObject BookObj = new JSONObject(map);
				jsonArray.put(BookObj);
			}
			//System.out.println(jsonArray.toString()[0].pnum);
			response.getWriter().print(jsonArray.toString());	
			//System.out.println(jsonArray.toString());
				
		}else if (actionUrl.equals("/user/load.product")){
			
			String sql="select * from s_product ";
			String id=request.getParameter("id");
			if(id!=null)
				sql+="where pnum= '"+id+"'";
			System.out.println(sql);
			ProductDao productDao=new ProductDao();
			List<Product> list = productDao.load(sql);
			JSONArray jsonArray = new JSONArray();
			for (int i = 0; i < list.size(); i++) {
				Product product = list.get(i);
				Map<String, Object> map =  new HashMap<String, Object>();
				map.put("pnum", product.getPnum());
				map.put("pname",  product.getPname());
				map.put("price", product.getPrice());
				map.put("pxinxi", product.getPxinxi());
				map.put("pclass", product.getPclass());
				JSONObject BookObj = new JSONObject(map);
				jsonArray.put(BookObj);
			}
			//System.out.println(jsonArray.toString()[0].pnum);
			response.getWriter().print(jsonArray.toString());	
			//System.out.println(jsonArray.toString());
			
		}else if(actionUrl.equals("/addproduct.product")){
			String pname=request.getParameter("pname");
			String pxinxi=request.getParameter("pxinxi");
			String pclass=request.getParameter("pclass");
			Float price=Float.parseFloat(request.getParameter("price"));
			Product product=new Product();
			product.setPname(pname);
			product.setPxinxi(pxinxi);
			product.setPclass(pclass);
			product.setPrice(price);
			ProductDao productDao=new ProductDao();
			productDao.add(product);
			try{
				Part p = request.getPart("uploadDataField");
				
				//得到表头信息。
				//Content-Disposition: form-data; name="filename"; filename="1.jpg"
		 
				String header = p.getHeader("Content-Disposition");
				// form-data; name="filename"; filename="1.jpg"
//				System.out.println(header);
				
				//获取.jpg
				String sb = header.substring(header.lastIndexOf(".")).replace("\"","");
//				System.out.println(sb);
				
				String name =pname+sb;
				//将文件上传到指定目录下！
//				System.out.println(name);
				p.write(name);
				
				//解决乱码问题！最重要的是，要将文件上传到客户端网页中，须先将图片保存至本地中！利用p.write;
				response.setContentType("text/html;charset=utf-8");
				response.getWriter().write(String.format("<img src='%s'>", "/a/"+name));
			}catch(Exception e){
				//throw e;
				
			}
			
			request.setAttribute("success", "123");
			response.sendRedirect("guanli/addsuccess.jsp");

			
		}
	}

}
