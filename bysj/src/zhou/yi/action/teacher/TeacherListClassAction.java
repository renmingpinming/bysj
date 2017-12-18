package zhou.yi.action.teacher;

import zhou.yi.domain.Teacher;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherListClassAction extends ActionSupport implements ModelDriven<Teacher>{

	private Teacher teacher = new Teacher();
	private TeacherService teacherService;
	
	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}
	@Override
	public Teacher getModel() {
		return teacher;
	}
	public String listClass(){
		teacher = teacherService.findById(teacher.getTid());
		ActionContext.getContext().getSession().put("exitTeacher", teacher);
		return "success";
	}
	
	public String showPage(){
		return "success";
	}
}
