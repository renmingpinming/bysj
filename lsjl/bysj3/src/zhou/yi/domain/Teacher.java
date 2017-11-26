package zhou.yi.domain;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 教师的实体
 * @author Administrator
 *
 */
public class Teacher {
	private Integer tid;
	private String tname;
	private String password;
	private String sex;
	private String introduce;
	private String telephone;
	private String email;

	//所教课程
	private Set<Course> courses = new LinkedHashSet<Course>();
	//所带班级
	private Set<Classname> classnames = new LinkedHashSet<Classname>();
	
	public Set<Classname> getClassnames() {
		return classnames;
	}
	public void setClassnames(Set<Classname> classnames) {
		this.classnames = classnames;
	}
	public Set<Course> getCourses() {
		return courses;
	}
	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public String getTname() {
		return tname;
	}
	public void setTname(String tname) {
		this.tname = tname;
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
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
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
