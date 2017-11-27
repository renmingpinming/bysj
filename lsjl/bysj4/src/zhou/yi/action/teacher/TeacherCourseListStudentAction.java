package zhou.yi.action.teacher;

import zhou.yi.domain.Course;
import zhou.yi.service.CourseService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherCourseListStudentAction extends ActionSupport implements ModelDriven<Course>{

	private Course course = new Course();
	private CourseService courseService;

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}


	@Override
	public Course getModel() {
		return course;
	}


	public String execute(){
		course = courseService.findById(course.getCid());
		return "success";
	}


	
}
