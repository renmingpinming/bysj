package zhou.yi.action.teacher;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.Teacher;
import zhou.yi.service.ClassnameService;
import zhou.yi.service.TeacherService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class TeacherAddClassAction extends ActionSupport implements ModelDriven<Teacher>{

	private TeacherService teacherService;
	private ClassnameService classnameService;
	private Teacher teacher = new Teacher();
	private String id;
	private List<Classname> list = new ArrayList<Classname>();
	
	@Override
	public Teacher getModel() {
		return teacher;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public List<Classname> getList() {
		return list;
	}


	public void setList(List<Classname> list) {
		this.list = list;
	}


	public void setTeacherService(TeacherService teacherService) {
		this.teacherService = teacherService;
	}


	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}


	public String list(){
		list = classnameService.findAll();
		return "success";
	}
	
	public String update(){
		System.out.println(id);
		System.out.println(teacher.getTid());
		int cid = Integer.parseInt(id);
		Classname classname = classnameService.findById(cid);
		teacher = teacherService.findById(teacher.getTid());
		teacher.getClassnames().add(classname);
		teacherService.update(teacher);
		return "success";
	}
}
