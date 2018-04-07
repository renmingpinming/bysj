package zhou.yi.action.question;

import com.opensymphony.xwork2.ActionContext;

import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.service.QuestionService;

public class TopicSearchAllAction {
	private Integer currPage = 1;
	private String key;
	private PageBean<Question> pageBean;
	private QuestionService questionService;
	
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
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
	
	public String searchAllByKey(){
		pageBean = questionService.searchAllByKey(currPage,key);
		ActionContext.getContext().getSession().put("exitKey", key);
		return "success";
	}

}
