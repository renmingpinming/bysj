package zhou.yi.action.student;

import zhou.yi.service.StudentService;

public class StudentDeleteCourseAction {
	private StudentService studentService;
	private Integer sid;
	private Integer cid;
	public Integer getSid() {
		return sid;
	}
	public void setSid(Integer sid) {
		this.sid = sid;
	}
	public Integer getCid() {
		return cid;
	}
	public void setCid(Integer cid) {
		this.cid = cid;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String execute(){
		studentService.deleteCourse(sid,cid);
		return "success";
	}
}
