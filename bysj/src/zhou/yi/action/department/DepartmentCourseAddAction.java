package zhou.yi.action.department;

import zhou.yi.domain.Course;
import zhou.yi.service.CourseService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentCourseAddAction extends ActionSupport implements ModelDriven<Course>{

	private CourseService courseService;
	private Course course = new Course();
	@Override
	public Course getModel() {
		return course;
	}
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	public String execute(){
		courseService.saveCourse(course);
		return "success";
	}

}
