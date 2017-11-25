package zhou.yi.domain;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 学生的实体
 * @author Administrator
 *
 */
public class Student {
	private Integer sid;
	private String sname;
	private String password;
	private String sex;
	private String telephone;
	private String email;
	
	//所在班级
	private Classname classname;
	//所上课程
	private Set<Course> courses = new LinkedHashSet<Course>();
	
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}
	public Classname getClassname() {
		return classname;
	}
	public void setClassname(Classname classname) {
		this.classname = classname;
	}

	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public String getSname() {
		return sname;
	}
	public void setSname(String sname) {
		this.sname = sname;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	
}
