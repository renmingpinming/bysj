package zhou.yi.action.question;

import zhou.yi.domain.Comment;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.service.CommentService;
import zhou.yi.service.QuestionService;

public class TopicDetailAction {
	private QuestionService questionService;
	private CommentService commentService;
	private Integer currPage = 1;
	private PageBean<Comment> pageBean;
	private Integer questionId;
	private Question question;

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public PageBean<Comment> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Comment> pageBean) {
		this.pageBean = pageBean;
	}

	public Integer getQuestionId() {
		return questionId;
	}

	public void setQuestionId(Integer questionId) {
		this.questionId = questionId;
	}

	public Question getQuestion() {
		return question;
	}

	public void setQuestion(Question question) {
		this.question = question;
	}

	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}

	public String teacher(){
		question = questionService.getById(questionId);
		pageBean = commentService.getByPage(questionId,currPage);
		return "success";
	}
	
	public String student(){
		question = questionService.getById(questionId);
		pageBean = commentService.getByPage(questionId,currPage);
		return "success";
	}
}
