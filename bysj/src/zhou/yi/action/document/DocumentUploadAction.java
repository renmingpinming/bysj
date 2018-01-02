package zhou.yi.action.document;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;

import zhou.yi.domain.Document;
import zhou.yi.domain.Homework;
import zhou.yi.service.DocumentService;
import zhou.yi.service.HomeworkService;

public class DocumentUploadAction implements ModelDriven<Homework>{
	private int hid;
	private int course_id;
	private String filename;
	private Homework homework = new Homework();
	private Document document = new Document();
	private DocumentService documentService;
	private HomeworkService homeworkService;
	
	private List<File> uploads;
	private List<String> uploadFileName;
	private List<String> uploadContentType;
	private long maximumSize;	
	private String allowedTypes;
	
	public List<File> getUpload() {
		return uploads;
	}

	public void setUpload(List<File> uploads) {
		this.uploads = uploads;
	}

	public List<String> getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(List<String> uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public List<String> getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(List<String> uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public long getMaximumSize() {
		return maximumSize;
	}

	public void setMaximumSize(long maximumSize) {
		this.maximumSize = maximumSize;
	}

	public String getAllowedTypes() {
		return allowedTypes;
	}

	public void setAllowedTypes(String allowedTypes) {
		this.allowedTypes = allowedTypes;
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
	
	public Document getDocument() {
		return document;
	}

	public void setDocument(Document document) {
		this.document = document;
	}

	public String execute() throws Exception{
		hid = (Integer) ActionContext.getContext().getSession().get("hid");
		course_id = (Integer) ActionContext.getContext().getSession().get("course_id");
		filename = uploadFileName.get(0);
		document.setHid(hid);
		document.setCourse_id(course_id);
		document.setFilename(filename);
		documentService.saveDocument(document);
		
		System.out.println("hid"+hid);
		System.out.println("filename"+uploadFileName.get(0));
		
		//取得文件上传路径（用于存放上传的文件）
		File uploadFile = new File(ServletActionContext.getServletContext().getRealPath("upload"));
		//判断上述路径是否存在，如果不存在则创建该路径
		if (!uploadFile.exists()) {
			uploadFile.mkdir();
		}
		
		if(uploads != null){
			String[] allowedTypesStr = allowedTypes.split(",");
			//将允许的文件类型列表放入List中
			List allowedTypesList = new ArrayList();
			for(int i = 0;i < allowedTypesStr.length; i++){
				allowedTypesList.add(allowedTypesStr[i]);
			}
			
			//判断上传文件的类型是否是允许的类型之一
			for(int i = 0; i < uploads.size();i++){
				if(!allowedTypesList.contains(uploadContentType.get(i))){
					System.out.println("上传文件中包含非法文件类型");
					ServletActionContext.getServletContext().setAttribute("errorMsg", "上传文件中包含非法文件类型");
					return "error";
				}
			}
			
			//判断文件的大小
			for(int i = 0 ;i < uploads.size();i++){
				
				System.out.println(uploads.get(i).length());
				// 判断文件长度
				if (maximumSize < uploads.get(i).length()) {
					ServletActionContext.getServletContext().setAttribute("errorMsg", uploadFileName.get(i)+ "文件过大");
					return "error";
				}
			}
			
			for(int i = 0; i < uploads.size();i++){
				// 第一种文件上传的读写方式
				FileInputStream input = new FileInputStream(uploads.get(i));
				FileOutputStream out = new FileOutputStream(uploadFile + "\\" + uploadFileName.get(i));
				
				try{
					byte[] b = new byte[1024];
					int m = 0;
					while ((m = input.read(b)) > 0) {
						out.write(b, 0, m);
					}
				}catch(Exception e){
					e.printStackTrace();
					ServletActionContext.getServletContext().setAttribute("errorMsg", uploadFileName.get(i) + "上传过程中发生未知错误，请联系管理员。上传失败！");
					return "error";
				}finally{
					input.close();
					out.close();
					//删除临时文件
					uploads.get(i).delete();
				}
			}
			return "success";
		}else{
			ServletActionContext.getServletContext().setAttribute("errorMsg", "请选择上传文件");
			return "error";
		}
		
	}
	
	public String list(){
		homework = homeworkService.getByCourseIdAndHid(homework.getCourse_id(),homework.getHid());
		ActionContext.getContext().getSession().put("course_id", homework.getCourse_id());
		ActionContext.getContext().getSession().put("hid", homework.getHid());
		return "success";
	}
}
