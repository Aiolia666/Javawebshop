package Model;

public class User {
	private String username;
	private String password;
	private double money;
	private String phone;
	private String place;     //所在地
	private String address;   //详细地址
	private int type;   //0为管理员     1为普通用户
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public double getMoney() {
		return money;
	}
	public void setMoney(double money) {
		this.money = money;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getPlace() {
		return place;
	}
	public void setPlace(String place) {
		this.place = place;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
