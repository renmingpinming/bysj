package zhou.yi.action.student;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Student;
import zhou.yi.service.ClassnameService;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentEditImformationAction extends ActionSupport implements ModelDriven<Student>{

	private Student student = new Student();
	private StudentService studentService;
	private ClassnameService classnameService;
	private List<Classname> list = new ArrayList<Classname>();
	@Override
	public Student getModel() {
		return student;
	}

	public List<Classname> getList() {
		return list;
	}

	public void setList(List<Classname> list) {
		this.list = list;
	}

	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}
	
	public String edit(){
		student = studentService.findById(student.getSid());
		list = classnameService.findAll();
		return "success";
	}
	
	public String update(){
		System.out.println(student.getSname());
		System.out.println("-------------------------------------------------");
		studentService.update(student);
		return "success";
	}

}
