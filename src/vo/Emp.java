package vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Emp {
	private int eid;
	private String ename;
	private String sex;
	private Date hire,hire2;
	private double sar;
	private int did;
	
	private Dept dept;//ËùÊô²¿ÃÅ
	private Set hist=new HashSet(0);
	
	public int getEid() {
		return eid;
	}
	public void setEid(int eid) {
		this.eid = eid;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getHire() {
		return hire;
	}
	public void setHire(Date hire) {
		this.hire = hire;
	}
	public double getSar() {
		return sar;
	}
	public void setSar(double sar) {
		this.sar = sar;
	}
	public int getDid() {
		return did;
	}
	public void setDid(int did) {
		this.did = did;
	}
	public Dept getDept() {
		return dept;
	}
	public void setDept(Dept dept) {
		this.dept = dept;
	}
	public Set getHist() {
		return hist;
	}
	public void setHist(Set hist) {
		this.hist = hist;
	}
	public Date getHire2() {
		return hire2;
	}
	public void setHire2(Date hire2) {
		this.hire2 = hire2;
	}
}
