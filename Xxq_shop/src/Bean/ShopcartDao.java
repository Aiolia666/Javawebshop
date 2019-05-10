package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sun.swing.internal.plaf.synth.resources.synth_zh_HK;

import Model.Product;
import Model.Shopcart;
import Model.User;
import Util.DBUtil;
import Util.UserException;

public class ShopcartDao {
	public void add(Shopcart shopcart) {
		Connection connection = DBUtil.getConnection();
		String sql = "select count(*) from s_shopcart";
		int id=0;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()){
				id=resultSet.getInt(1)+1;
			}
			sql = "select count(*) from s_shopcart where username = ? and pnum = ?";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, shopcart.getUsername());
			preparedStatement.setString(2, shopcart.getPnum());
			//���ս����
			resultSet = preparedStatement.executeQuery();
			//���������
			
			while(resultSet.next()) {
				System.out.println(resultSet.getInt(1));
				if (resultSet.getInt(1) > 0) {
						sql="update s_shopcart set num=num+"+shopcart.getNum();
						//System.out.println(sql);
						preparedStatement = connection.prepareStatement(sql);
						break;
				}
				else{
					
					sql="insert into s_shopcart(username,pnum,num,id) values(?,?,?,?)";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, shopcart.getUsername());
					preparedStatement.setString(2,shopcart.getPnum() );
					preparedStatement.setInt(3, shopcart.getNum());
					preparedStatement.setInt(4, id);
					break;
				}
				
			}
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
	
	
	
	public void delete(String  sqlli) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		//String sql = "delete from t_indent where bianhao = ?";
		String sql=sqlli;
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
	
	public List<Shopcart> load(String sqlli) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = sqlli;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Shopcart> shopcarts = new ArrayList<Shopcart>();
		Shopcart shopcart = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				shopcart = new Shopcart();
				shopcart.setUsername(resultSet.getString("username"));
				shopcart.setPnum(resultSet.getString("pnum"));
				shopcart.setNum(resultSet.getInt("num"));
				shopcart.setId(resultSet.getInt("id"));
				shopcarts.add(shopcart);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  shopcarts;
	}
	
	
	
	public Shopcart loadone(String sqlli) {
		// TODO Auto-generated method stub
		
		Connection connection = DBUtil.getConnection();
		//׼��sql���
		String sql =sqlli;
		//������䴫�����
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		Shopcart shopcart = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				shopcart = new Shopcart();
				shopcart.setId(resultSet.getInt("id"));
				shopcart.setUsername(resultSet.getString("username"));
				shopcart.setPnum(resultSet.getString("pnum"));
				shopcart.setNum(resultSet.getInt("num"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return shopcart;

	}

}
