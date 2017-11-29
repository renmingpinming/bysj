package zhou.yi.action.department;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.CourseService;
import zhou.yi.service.StudentService;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentTeacherAddAction extends ActionSupport implements ModelDriven<Teacher>{

	private TeacherService teacherService;
	private Teacher teacher = new Teacher();
	@Override
	public Teacher getModel() {
		return teacher;
	}
	


	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}



	public String execute(){
		teacherService.saveTeacher(teacher);
		return "success";
	}

}
