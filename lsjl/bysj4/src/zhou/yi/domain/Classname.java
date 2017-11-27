package zhou.yi.domain;

import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.Set;

/**
 * 班级的实体
 * @author Administrator
 *
 */
public class Classname {
	private Integer id;
	private String name;
	
	private Teacher teacher;
	
	private Set<Student> students = new LinkedHashSet<Student>();
	
	
	public Teacher getTeacher() {
		return teacher;
	}
	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}
	public Set<Student> getStudents() {
		return students;
	}
	public void setStudents(Set<Student> students) {
		this.students = students;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
