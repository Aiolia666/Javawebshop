package Model;

import java.util.function.Predicate;

public class Product {
	private String pname;
	private int pnum;
	private String pxinxi;
	private double price;
	private String pclass;
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPnum() {
		return pnum;
	}
	public void setPnum(int pnum) {
		this.pnum = pnum;
	}
	public String getPxinxi() {
		return pxinxi;
	}
	public void setPxinxi(String pxinxi) {
		this.pxinxi = pxinxi;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getPclass() {
		return pclass;
	}
	public void setPclass(String pclass) {
		this.pclass = pclass;
	}

}
