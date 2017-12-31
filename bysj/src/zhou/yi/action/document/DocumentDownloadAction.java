package zhou.yi.action.document;

import com.opensymphony.xwork2.ModelDriven;

import zhou.yi.domain.Homework;
import zhou.yi.service.DocumentService;
import zhou.yi.service.HomeworkService;

public class DocumentDownloadAction implements ModelDriven<Homework>{

	private Homework homework = new Homework();
	private DocumentService documentService;
	private HomeworkService homeworkService;
	@Override
	public Homework getModel() {
		return homework;
	}
	public void setDocumentService(DocumentService documentService) {
		this.documentService = documentService;
	}
	public void setHomeworkService(HomeworkService homeworkService) {
		this.homeworkService = homeworkService;
	}
	public String execute(){
		homework = homeworkService.getByCourseIdAndHid(homework.getCourse_id(),homework.getHid());
		return "success";
	}
}
