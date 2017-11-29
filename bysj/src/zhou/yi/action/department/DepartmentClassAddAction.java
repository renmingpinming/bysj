package zhou.yi.action.department;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.service.ClassnameService;
import zhou.yi.service.CourseService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentClassAddAction extends ActionSupport implements ModelDriven<Classname>{

	private ClassnameService classnameService;
	private Classname classname = new Classname();
	@Override
	public Classname getModel() {
		return classname;
	}
	
	
	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}


	public String execute(){
		classnameService.saveClassname(classname);
		return "success";
	}

}
