package zhou.yi.action.department;

import com.opensymphony.xwork2.ActionSupport;

public class DepartmentListAction extends ActionSupport {

	public String course(){
		return "course";
	}
	
	public String courseAddList(){
		return "courseAddList";
	}
	
	public String classnameAddList(){
		return "classnameAddList";
	}
	
	public String studentAddList(){
		return "studentAddList";
	}
	
	public String teacherAddList(){
		return "teacherAddList";
	}
	
	public String classname(){
		return "classname";
	}
	
	public String student(){
		return "student";
	}
	
	public String teacher(){
		return "teacher";
	}
}
