package zhou.yi.action.teacher;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.Teacher;
import zhou.yi.service.CourseService;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherAddCourseAction extends ActionSupport implements ModelDriven<Teacher>{
	
	private CourseService courseService;
	private TeacherService teacherService;
	private List<Course> list = new ArrayList<Course>();
	private String cid;
	private Teacher teacher = new Teacher();
	
	@Override
	public Teacher getModel() {
		return teacher;
	}
	
	public String getCid() {
		return cid;
	}

	public void setCid(String cid) {
		this.cid = cid;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
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
		teacher = teacherService.findById(teacher.getTid());
		teacher.getCourses().add(course);
		teacherService.update(teacher);
		return "success";
	}

	
}
