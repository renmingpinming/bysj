package zhou.yi.action.student;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;
import zhou.yi.service.CourseService;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentAddCourseAction extends ActionSupport implements ModelDriven<Student>{
	
	private CourseService courseService;
	private StudentService studentService;
	private List<Course> list = new ArrayList<Course>();
	private String cid;
	private Student student = new Student();

	@Override
	public Student getModel() {
		return student;
	}
	
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public List<Course> getList() {
		return list;
	}

	public void setList(List<Course> list) {
		this.list = list;
	}

	public String list(){
		list = courseService.findAll();
		return "success";
	}
	
	public String update(){
		int id = Integer.parseInt(cid);
		Course course = courseService.findById(id);
		student = studentService.findById(student.getSid());
		student.getCourses().add(course);
		studentService.update(student);
		return "success";
	}

}
