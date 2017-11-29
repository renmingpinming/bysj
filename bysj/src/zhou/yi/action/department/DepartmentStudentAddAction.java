package zhou.yi.action.department;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;
import zhou.yi.service.CourseService;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentStudentAddAction extends ActionSupport implements ModelDriven<Student>{

	private StudentService studentService;
	private Student student = new Student();
	@Override
	public Student getModel() {
		return student;
	}
	
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}


	public String execute(){
		studentService.saveStudent(student);
		return "success";
	}

}
