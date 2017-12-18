package zhou.yi.action.comment;

import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;
import zhou.yi.service.CommentService;
import zhou.yi.service.QuestionService;

import com.opensymphony.xwork2.ModelDriven;

public class CommentAddAction implements ModelDriven<Comment>{

	private Comment comment = new Comment();
	private QuestionService questionService;
	private CommentService commentService;
	private Question question;
	private Integer question_id;
	
	public Integer getQuestion_id() {
		return question_id;
	}
	public void setQuestion_id(Integer question_id) {
		this.question_id = question_id;
	}
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}
	public void setCommentService(CommentService commentService) {
		this.commentService = commentService;
	}
	@Override
	public Comment getModel() {
		return comment;
	}
	public String teacher(){
		question = questionService.getById(comment.getQuestion_id());
		comment.setQuestion(question);
		commentService.saveComment(comment);
		return "success";
	}
	
	public String student(){
		question = questionService.getById(comment.getQuestion_id());
		comment.setQuestion(question);
		commentService.saveComment(comment);
		return "success";
	}

	
}
