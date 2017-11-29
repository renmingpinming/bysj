package zhou.yi.action.department;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.CourseService;
import zhou.yi.service.StudentService;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentTeacherListAction extends ActionSupport implements ModelDriven<Teacher>{

	private Integer currPage = 1;
	private PageBean<Teacher> pageBean;
	private TeacherService teacherService;
	private List<Teacher> list = new ArrayList<Teacher>();
	private Teacher teacher = new Teacher();
	

	@Override
	public Teacher getModel() {
		return teacher;
	}
	
	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public PageBean<Teacher> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Teacher> pageBean) {
		this.pageBean = pageBean;
	}

	public List<Teacher> getList() {
		return list;
	}

	public void setList(List<Teacher> list) {
		this.list = list;
	}

	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}

	public String execute(){
		pageBean = teacherService.findByPage(currPage);
		return "success";
	}
}
