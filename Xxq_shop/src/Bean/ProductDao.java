package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.catalina.filters.AddDefaultCharsetFilter;

import Model.Product;
import Util.DBUtil;
import Util.UserException;

public class ProductDao {
	
	public void add(Product product){
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from s_user where pnum = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {

					
			sql = "insert into s_product(pname,pxinxi,pclass,price) values (?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, product.getPname());
			preparedStatement.setString(2, product.getPxinxi());
			preparedStatement.setString(3, product.getPclass());
			preparedStatement.setDouble(4, product.getPrice());
			preparedStatement.executeUpdate();	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			//�ر���Դ
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
	}
	public List<Product> load(String sqlli) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = sqlli;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Product> products = new ArrayList<Product>();
		Product product = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product = new Product();
				product.setPnum(resultSet.getInt("pnum"));
				product.setPname(resultSet.getString("pname"));
				product.setPrice(resultSet.getDouble("price"));
				product.setPxinxi(resultSet.getString("pxinxi"));
				product.setPclass(resultSet.getString("pclass"));
				products.add(product);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  products;
	}
	
	public Product loadone(String sqlli) {
		// TODO Auto-generated method stub
		
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql =sqlli;
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Product product = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				product = new Product();
				product.setPnum(resultSet.getInt("pnum"));
				product.setPname(resultSet.getString("pname"));
				product.setPrice(resultSet.getDouble("price"));
				product.setPxinxi(resultSet.getString("pxinxi"));
				product.setPclass(resultSet.getString("pclass"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return product;

	}

}
