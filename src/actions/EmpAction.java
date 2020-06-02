package actions;

import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.ServletResponseAware;

import vo.Emp;
import vo.History;

import com.opensymphony.xwork2.ActionSupport;

import dao.YZDao;

public class EmpAction extends ActionSupport implements ServletRequestAware,ServletResponseAware{
	private HttpServletRequest req;
	private PrintWriter out;
	private YZDao yzdao;
	private Emp emp;
	private List emps;
	private List depts;
	private int[] deid;
	
	private int[] hid;
	private Date[] startdate;
	private Date[] enddate;
	private String[] place;
	private String[] job;
	//==================================================
	
	//批量删除
	public String delEmpAll(){
		String ids="";
		for(int i=0;i<deid.length;i++){
			ids+=deid[i];
			yzdao.delete("wt.delHistory", deid[i]);
			if(i!=deid.length-1)ids+=",";
		}
		yzdao.delete("yz.allDelEmp",ids);
		return "toall";
	}
	//删除员工
	public String delEmp(){
		yzdao.delete("wt.delHistory", emp.getEid());
		yzdao.delete("yz.delEmp",emp);
		return "toall";
	}
	//添加员工
	public String addEmp(){
		yzdao.save("yz.addEmp",emp);
		for(int i=1;i<startdate.length;i++){
			History h=new History();
			h.setStartdate(startdate[i]);
			h.setEnddate(enddate[i]);
			h.setPlace(place[i]);
			h.setJob(job[i]);
			h.setEid(emp.getEid());
			yzdao.save("wt.addHistory",h);
		}
		return "toall";
	}
	//添加员工前
	public String beforeAddEmp(){
		depts=yzdao.all("yjl.allDept", null);
		return "addemp";
	}
	//员工列表
	public String allEmp(){
		emps=yzdao.all("yz.allEmps", null);
		depts=yzdao.all("yjl.allDept", null);
		return "allemp";
	}
	//多条件任意组合模糊查询
	public String findEmp(){
		emps=yzdao.all("yz.allEmps2",emp);
		depts=yzdao.all("yjl.allDept", null);
		return "allemp";
	}
	//===================================================
	public void setServletResponse(HttpServletResponse arg0) {
		arg0.setContentType("text/html;charset=utf-8");
		try {
			out=arg0.getWriter();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void setServletRequest(HttpServletRequest arg0) {
		req=arg0;
	}
	public YZDao getYzdao() {
		return yzdao;
	}
	public void setYzdao(YZDao yzdao) {
		this.yzdao = yzdao;
	}

	public Emp getEmp() {
		return emp;
	}

	public void setEmp(Emp emp) {
		this.emp = emp;
	}

	public List getEmps() {
		return emps;
	}

	public void setEmps(List emps) {
		this.emps = emps;
	}
	public List getDepts() {
		return depts;
	}
	public void setDepts(List depts) {
		this.depts = depts;
	}
	public int[] getHid() {
		return hid;
	}
	public void setHid(int[] hid) {
		this.hid = hid;
	}
	public Date[] getStartdate() {
		return startdate;
	}
	public void setStartdate(Date[] startdate) {
		this.startdate = startdate;
	}
	public Date[] getEnddate() {
		return enddate;
	}
	public void setEnddate(Date[] enddate) {
		this.enddate = enddate;
	}
	public String[] getPlace() {
		return place;
	}
	public void setPlace(String[] place) {
		this.place = place;
	}
	public String[] getJob() {
		return job;
	}
	public void setJob(String[] job) {
		this.job = job;
	}
	public int[] getDeid() {
		return deid;
	}
	public void setDeid(int[] deid) {
		this.deid = deid;
	}
}
