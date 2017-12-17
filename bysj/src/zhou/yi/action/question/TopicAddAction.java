package zhou.yi.action.question;

import zhou.yi.domain.Question;
import zhou.yi.service.QuestionService;

import com.opensymphony.xwork2.ModelDriven;

public class TopicAddAction implements ModelDriven<Question>{

	private Question question = new Question();
	private QuestionService questionService;
	
	public void setQuestionService(QuestionService questionService) {
		this.questionService = questionService;
	}

	@Override
	public Question getModel() {
		return question;
	}
	
	public String teacher(){
		questionService.saveTopic(question);
		return "success";
	}
	
	public String student(){
		return "success";
	}
	
	public String showAddPage(){
		return "success";
	}

}
