package Model;

import com.sun.javafx.binding.StringFormatter;

public class Shopcart {
	private int id;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	private String username;
	private String pnum;
	private int num;
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}

}
