package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import Model.Dingdan;
import Model.Shopcart;
import Util.DBUtil;

public class DingdanDao {
	public void add(Shopcart shopcart,String dingdannum) {
		Connection connection = DBUtil.getConnection();
		Date date=new Date();
		SimpleDateFormat sim4=new SimpleDateFormat("YYYYMMdd");
		String riqi=sim4.format(date);
		dingdannum=riqi+dingdannum;
		String sql = "";
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		try {
			
			sql="insert into s_dingdan (dingdannum,username,pnum,num,type) values(?,?,?,?,?)";
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.setString(1, dingdannum);
			preparedStatement.setString(2, shopcart.getUsername());
			preparedStatement.setString(3,shopcart.getPnum() );
			preparedStatement.setInt(4, shopcart.getNum());
			preparedStatement.setInt(5, 0);
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
	
	public List<Dingdan> load(String sqlli) {
		// TODO Auto-generated method stub
		Connection connection = DBUtil.getConnection();
		String sql = sqlli;
		PreparedStatement preparedStatement = null;
		ResultSet resultSet = null;
		List<Dingdan> dingdans = new ArrayList<Dingdan>();
		Dingdan dingdan = null;
		try {
			preparedStatement = connection.prepareStatement(sql);
			resultSet = preparedStatement.executeQuery();
			while(resultSet.next()) {
				dingdan = new Dingdan();
				dingdan.setDingdannum(resultSet.getString("dingdannum"));
				dingdan.setUsername(resultSet.getString("username"));
				dingdan.setPnum(resultSet.getString("pnum"));
				dingdan.setNum(resultSet.getInt("num"));
				dingdan.setType(resultSet.getInt("type"));
				dingdans.add(dingdan);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			DBUtil.close(resultSet);
			DBUtil.close(preparedStatement);
			DBUtil.close(connection);
		}
		return  dingdans;
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
