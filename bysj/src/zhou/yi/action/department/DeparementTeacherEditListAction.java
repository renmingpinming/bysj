package zhou.yi.action.department;

import zhou.yi.domain.Teacher;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DeparementTeacherEditListAction extends ActionSupport implements ModelDriven<Teacher>{

	private Teacher teacher = new Teacher();
	private TeacherService teacherService;
	private int tid;
	@Override
	public Teacher getModel() {
		return teacher;
	}

	public int getTid() {
		return tid;
	}

	public void setTid(int tid) {
		this.tid = tid;
	}


	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	public String list(){
		teacher = teacherService.findById(teacher.getTid());
		return "success";
	}
	
	public String update(){
		teacherService.update(teacher);
		return "success";
	}
}
