package zhou.yi.action.department;
import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Student;
import zhou.yi.service.ClassnameService;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;


public class DeparementStudentEditListAction extends ActionSupport implements ModelDriven<Student>{

	private Student student = new Student();
	private StudentService studentService;
	private ClassnameService classnameService;
	private List<Classname> list = new ArrayList<Classname>();
	private int sid;
	@Override
	public Student getModel() {
		return student;
	}
	public int getSid() {
		return sid;
	}
	public void setSid(int sid) {
		this.sid = sid;
	}
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}
	
	public List<Classname> getList() {
		return list;
	}
	public void setList(List<Classname> list) {
		this.list = list;
	}
	public String list(){
		student = studentService.findById(student.getSid());
		list = classnameService.findAll();
		return "success";
	}
	
	public String update(){
		studentService.update(student);
		return "success";
	}
}
