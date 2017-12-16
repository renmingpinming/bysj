package zhou.yi.action.department;

import zhou.yi.domain.Classname;
import zhou.yi.service.ClassnameService;

public class DepartmentDeleteClassnameAction {

	private ClassnameService classnameService;
	private int id;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}

	public String execute(){
		Classname classname = classnameService.findById(id);
		classnameService.deleteClassname(classname);
		return "success";
	}
}
