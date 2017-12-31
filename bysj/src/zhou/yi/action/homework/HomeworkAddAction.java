package zhou.yi.action.homework;

import zhou.yi.domain.Homework;
import zhou.yi.service.HomeworkService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class HomeworkAddAction extends ActionSupport implements ModelDriven<Homework>{
	
	private Homework homework = new Homework();
	private HomeworkService homeworkService;
	
	public void setHomeworkService(HomeworkService homeworkService) {
		this.homeworkService = homeworkService;
	}

	@Override
	public Homework getModel() {
		return homework;
	}
	
	public String list(){
		return "success";
	}
	
	public String save(){
		homeworkService.saveHomework(homework);
		return "success";
	}

	
}
