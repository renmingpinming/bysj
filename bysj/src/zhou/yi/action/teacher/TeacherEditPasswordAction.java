package zhou.yi.action.teacher;

import zhou.yi.domain.Teacher;
import zhou.yi.service.LoginService;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherEditPasswordAction extends ActionSupport implements ModelDriven<Teacher>{
	
	private TeacherService teacherService;
	private LoginService loginService;
	private String oldpassword;
	private String newpassword1;
	private String newpassword2;
	private Teacher teacher = new Teacher();
	
	@Override
	public Teacher getModel() {
		return teacher;
	}

	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
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
		
		Teacher newteacher = teacherService.findById(teacher.getTid());
		if(newpassword1.equals("") || newpassword2.equals("") || oldpassword.equals("")){
			this.addActionError("ÐÞ¸ÄÊ§°Ü£¡");
			return "input";
		}
		else if(oldpassword.equals(newteacher.getPassword()) && newpassword1.equals(newpassword2)){
			newteacher.setPassword(newpassword1);
			teacherService.update(newteacher);
			return "success";
		}
		else{
			this.addActionError("ÐÞ¸ÄÊ§°Ü£¡");
			return "input";
		}
			
	}
	
}
