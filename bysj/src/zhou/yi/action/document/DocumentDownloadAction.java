package zhou.yi.action.document;

import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import zhou.yi.domain.Document;
import zhou.yi.domain.Homework;
import zhou.yi.service.DocumentService;
import zhou.yi.service.HomeworkService;

public class DocumentDownloadAction implements ModelDriven<Homework>{

	private Homework homework = new Homework();
	private List<Document> list = new ArrayList<Document>();
	private DocumentService documentService;
	private HomeworkService homeworkService;
	
	private InputStream fileInput;
	private String fileName;
	
	public InputStream getFileInput() {
		return fileInput;
		//return ServletActionContext.getServletContext().getResourceAsStream("upload\\" + fileName);
	}

	public void setFileInput(InputStream fileInput) {
		this.fileInput = fileInput;
	}

	public String getFileName() {
		fileName = ServletActionContext.getRequest().getParameter("fileName");
		try {
			fileName = new String(fileName.getBytes(),"ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
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
	public String execute() throws Exception{	
		fileInput = ServletActionContext.getServletContext().getResourceAsStream("upload\\" + fileName);
		return "success";
	}
	
	public List<Document> getList() {
		return list;
	}

	public void setList(List<Document> list) {
		this.list = list;
	}

	public String list(){
		homework = homeworkService.getByCourseIdAndHid(homework.getCourse_id(),homework.getHid());
		list = documentService.getByCourseIdAndHid(homework.getCourse_id(),homework.getHid());
		return "success";
	}
}
