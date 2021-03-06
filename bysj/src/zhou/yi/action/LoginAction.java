package zhou.yi.action;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

import zhou.yi.domain.Department;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.LoginService;

public class LoginAction extends ActionSupport {
	
	private LoginService loginService;
	private String user_id;
	private String password;
	private String ptype;
	
	
	public void setLoginService(LoginService loginService) {
		this.loginService = loginService;
	}
	


	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getPassword() {
		return password;
	}



	public void setPassword(String password) {
		this.password = password;
	}



	public String getPtype() {
		return ptype;
	}



	public void setPtype(String ptype) {
		this.ptype = ptype;
	}



	public String execute(){
		if(ptype.equals("教师")){
			Teacher exitTeacher = loginService.login_teacher(user_id,password);
			if(exitTeacher==null){
				this.addActionError("用户名或密码错误！");
				return "input";
			}else{
				ActionContext.getContext().getSession().put("exitTeacher", exitTeacher);
				return "success_teacher";
			}
		}
		else if(ptype.equals("学生")){
			Student exitStudent = loginService.login_student(user_id,password);
			if(exitStudent==null){
				this.addActionError("用户名或密码错误！");
				return "input";
			}else{
				ActionContext.getContext().getSession().put("exitStudent", exitStudent);
				return "success_student";
			}
		}
		else if(ptype.equals("管理员")){
			Department exitDepartment = loginService.login_department(user_id,password);
			if(exitDepartment==null){
				this.addActionError("用户名或密码错误！");
				return "input";
			}else{
				ActionContext.getContext().getSession().put("exitDepartment", exitDepartment);
				return "success_department";
			}
		}
		else{
			this.addActionError("用户名或密码错误！");
			return "input";
		}
	}
}
