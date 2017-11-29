package zhou.yi.action.department;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Student;
import zhou.yi.service.CourseService;
import zhou.yi.service.StudentService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentStudentListAction extends ActionSupport implements ModelDriven<Student>{

	private Integer currPage = 1;
	private PageBean<Student> pageBean;
	private StudentService studentService;
	private List<Student> list = new ArrayList<Student>();
	private Student student = new Student();
	
	public PageBean<Student> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Student> pageBean) {
		this.pageBean = pageBean;
	}

	public List<Student> getList() {
		return list;
	}

	public void setList(List<Student> list) {
		this.list = list;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	@Override
	public Student getModel() {
		return student;
	}
	
	public String execute(){
		pageBean = studentService.findByPage(currPage);
		return "success";
	}
}
