package zhou.yi.action.department;



import zhou.yi.domain.Teacher;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;

public class DepartmentDeleteTeacherAction extends ActionSupport{

	private TeacherService teacherService;
	private int tid;
	

	public int getTid() {
		return tid;
	}


	public void setTid(int tid) {
		this.tid = tid;
	}


	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}


	public String execute(){
		Teacher teacher = teacherService.findById(tid);
		teacherService.deleteTeacher(teacher);
		return "success";
	}
}
