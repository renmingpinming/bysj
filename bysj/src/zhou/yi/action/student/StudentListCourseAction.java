package zhou.yi.action.student;

import zhou.yi.domain.Student;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class StudentListCourseAction extends ActionSupport implements ModelDriven<Student>{
	
	private Student student = new Student();
	private StudentService studentService;
	
	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	@Override
	public Student getModel() {
		return student;
	}

	public String listCourse(){
		student = studentService.findById(student.getSid());
		ActionContext.getContext().getSession().put("exitStudent", student);
		return "success";
	}
	
	public String showPage(){
		return "success";
	}

	
}
