package zhou.yi.action.homework;

import java.util.ArrayList;
import java.util.List;

import com.opensymphony.xwork2.ActionContext;

import zhou.yi.domain.Homework;
import zhou.yi.service.HomeworkService;

public class HomeworkListAction {

	private Integer course_id;
	private HomeworkService homeworkService;
	private List<Homework> list = new ArrayList<Homework>();
	
	public List<Homework> getList() {
		return list;
	}
	public void setList(List<Homework> list) {
		this.list = list;
	}
	public Integer getCourse_id() {
		return course_id;
	}
	public void setCourse_id(Integer course_id) {
		this.course_id = course_id;
	}
	public void setHomeworkService(HomeworkService homeworkService) {
		this.homeworkService = homeworkService;
	}
	public String teacher(){
		list = homeworkService.getByCourseId(course_id);
		ActionContext.getContext().getSession().put("course_id",course_id);
		return "success";
	}
	
	public String student(){
		list = homeworkService.getByCourseId(course_id);
		ActionContext.getContext().getSession().put("course_id",course_id);
		return "success";
	}
}
