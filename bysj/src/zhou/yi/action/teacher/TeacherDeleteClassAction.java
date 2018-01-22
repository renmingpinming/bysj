package zhou.yi.action.teacher;

import zhou.yi.service.ClassnameService;

public class TeacherDeleteClassAction {

	private ClassnameService classnameService;
	private Integer id;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}
	
	public String execute(){
		classnameService.deleteTid(id);
		return "success";
	}
}
