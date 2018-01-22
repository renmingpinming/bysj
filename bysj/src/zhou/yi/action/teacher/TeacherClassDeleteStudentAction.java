package zhou.yi.action.teacher;

import zhou.yi.service.StudentService;

public class TeacherClassDeleteStudentAction {

	private StudentService studentService;
	private Integer sid;

	public Integer getSid() {
		return sid;
	}

	public void setSid(Integer sid) {
		this.sid = sid;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute(){
		studentService.deleteClno(sid);
		return "success";
	}
}
