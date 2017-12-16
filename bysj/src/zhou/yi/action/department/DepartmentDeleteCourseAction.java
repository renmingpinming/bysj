package zhou.yi.action.department;

import zhou.yi.domain.Course;
import zhou.yi.service.CourseService;

public class DepartmentDeleteCourseAction {

	private CourseService courseService;
	private int cid;
	
	public int getCid() {
		return cid;
	}

	public void setCid(int cid) {
		this.cid = cid;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	public String execute(){
		Course course = courseService.findById(cid);
		courseService.deleteCourse(course);
		return "success";
	}
}
