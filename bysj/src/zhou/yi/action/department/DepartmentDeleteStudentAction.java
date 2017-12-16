package zhou.yi.action.department;

import zhou.yi.domain.Student;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;

public class DepartmentDeleteStudentAction extends ActionSupport{

	private StudentService studentService;
	private int sid;
	
	public int getSid() {
		return sid;
	}

	public void setSid(int sid) {
		this.sid = sid;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String execute(){
		Student student = studentService.findById(sid);
		studentService.deleteStudent(student);
		return "success";
	}
}
