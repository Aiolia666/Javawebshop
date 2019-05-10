package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import Model.User;
import Util.DBUtil;
import Util.UserException;



public class UserDao {
	public void add(User user) {
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from s_user where username = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			//���ս����
			resultSet = preparedStatement.executeQuery();
			//���������
			while(resultSet.next()) {
				if (resultSet.getInt(1) > 0) {
					throw new UserException("用户已存在") ;
				}
			}
			
			
			sql = "insert into s_user(username,password,type) values (?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, user.getUsername());
			preparedStatement.setString(2, user.getPassword());
			preparedStatement.setInt(3, user.getType());
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
	
	
	public User load(String username){
		
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = "select * from s_user  where username = ?";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		User user = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, username);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				user = new User();
				user.setUsername(username);
				user.setPassword(resultSet.getString("password"));
				user.setMoney(resultSet.getDouble("money"));
				user.setPhone(resultSet.getString("phone"));
				user.setPlace(resultSet.getString("place"));
				user.setAddress(resultSet.getString("address"));
				user.setType(resultSet.getInt("type"));
			}
		} catch (SQLException e) {
					// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return user;	
	}
	
	public void update(String sqlli) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql = sqlli;
		//������䴫�����
		PreparedStatement preparedStatement = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
			
	}
	

}
