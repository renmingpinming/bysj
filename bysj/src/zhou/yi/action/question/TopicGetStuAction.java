package zhou.yi.action.question;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.domain.Student;
import zhou.yi.service.QuestionService;

public class TopicGetStuAction {
	private Integer currPage = 1;
	private PageBean<Question> pageBean;
	private QuestionService questionService;
	private List<Question> list = new ArrayList<Question>();
	
	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public PageBean<Question> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Question> pageBean) {
		this.pageBean = pageBean;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public List<Question> getList() {
		return list;
	}

	public void setList(List<Question> list) {
		this.list = list;
	}

	public String teacher(){
		pageBean = questionService.getStuByPage(currPage);
		return "success";
	}
	
	public String student(){
		pageBean = questionService.getStuByPage(currPage);
		return "success";
	}
}
