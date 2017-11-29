package zhou.yi.action.department;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
import zhou.yi.service.CourseService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentCourseListAction extends ActionSupport implements ModelDriven<Course>{

	private Integer currPage = 1;
	private PageBean<Course> pageBean;
	private CourseService courseService;
	private List<Course> list = new ArrayList<Course>();
	private Course course = new Course();
	
	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public PageBean<Course> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Course> pageBean) {
		this.pageBean = pageBean;
	}

	public List<Course> getList() {
		return list;
	}

	public void setList(List<Course> list) {
		this.list = list;
	}

	public void setCourseService(CourseService courseService) {
		this.courseService = courseService;
	}

	@Override
	public Course getModel() {
		return course;
	}
	
	public String execute(){
		pageBean = courseService.findByPage(currPage);
		return "success";
	}
}
