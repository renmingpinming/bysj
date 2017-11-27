package zhou.yi.action.teacher;

import zhou.yi.domain.Classname;
import zhou.yi.service.ClassnameService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherClassListStudentAction extends ActionSupport implements ModelDriven<Classname>{

	private Classname classname = new Classname();
	private ClassnameService classnameService;

	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}


	@Override
	public Classname getModel() {
		return classname;
	}


	public String execute(){
		classname = classnameService.findById(classname.getId());
		return "success";
	}


	
}
