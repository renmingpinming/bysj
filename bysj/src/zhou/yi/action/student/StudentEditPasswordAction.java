package zhou.yi.action.student;

import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentEditPasswordAction extends ActionSupport implements ModelDriven<Student>{

	private Student student = new Student();
	private StudentService studentService;
	private String oldpassword;
	private String newpassword1;
	private String newpassword2;
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	@Override
	public Student getModel() {
		return student;
	}

	public String getOldpassword() {
		return oldpassword;
	}

	public void setOldpassword(String oldpassword) {
		this.oldpassword = oldpassword;
	}

	public String getNewpassword1() {
		return newpassword1;
	}

	public void setNewpassword1(String newpassword1) {
		this.newpassword1 = newpassword1;
	}

	public String getNewpassword2() {
		return newpassword2;
	}

	public void setNewpassword2(String newpassword2) {
		this.newpassword2 = newpassword2;
	}
	
	public String edit(){
		return "success";
	}
	
public String update(){
		
		Student newstudent = studentService.findById(student.getSid());
		if(newpassword1.equals("") || newpassword2.equals("") || oldpassword.equals("")){
			this.addActionError("ÐÞ¸ÄÊ§°Ü£¡");
			return "input";
		}
		else if(oldpassword.equals(newstudent.getPassword()) && newpassword1.equals(newpassword2)){
			newstudent.setPassword(newpassword1);
			studentService.update(newstudent);
			return "success";
		}
		else{
			this.addActionError("ÐÞ¸ÄÊ§°Ü£¡");
			return "input";
		}
			
	}

}
