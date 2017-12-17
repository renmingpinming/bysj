package zhou.yi.action.teacher;

import zhou.yi.domain.Teacher;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherEditImformationAction extends ActionSupport implements ModelDriven<Teacher>{
	
	private Teacher teacher = new Teacher();
	private TeacherService teacherService;
	private Integer tid;
	
	
	public Integer getTid() {
		return tid;
	}
	public void setTid(Integer tid) {
		this.tid = tid;
	}
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	@Override
	public Teacher getModel() {
		return teacher;
	}
	
	public String edit(){
		teacher = teacherService.findById(teacher.getTid());
		return "success";
	}
	
	public String update(){
		teacherService.update(teacher);
		return "success";
	}

	
}
