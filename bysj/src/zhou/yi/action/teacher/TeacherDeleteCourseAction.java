package zhou.yi.action.teacher;

import zhou.yi.service.CourseService;

public class TeacherDeleteCourseAction {

	private CourseService courseService;
	private Integer cid;
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}
	
	public String execute(){
		courseService.deleteTno(cid);
		return "success";
	}
}
