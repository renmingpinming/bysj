package zhou.yi.domain;

import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 课程的实体
 * @author Administrator
 *
 */
public class Course {
	private Integer cid;
	private String cname;
	private String introduce;
	
	//授课老师
	private Teacher teacher;

	//上课学生
	private Set<Student> students = new LinkedHashSet<Student>();
	
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public String getCname() {
		return cname;
	}
	public void setCname(String cname) {
		this.cname = cname;
	}
	public String getIntroduce() {
		return introduce;
	}
	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}
	
}
