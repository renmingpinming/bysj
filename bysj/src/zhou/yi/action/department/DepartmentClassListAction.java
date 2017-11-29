package zhou.yi.action.department;

import java.util.ArrayList;
import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.PageBean;
import zhou.yi.service.ClassnameService;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

public class DepartmentClassListAction extends ActionSupport implements ModelDriven<Classname>{

	private Integer currPage = 1;
	private PageBean<Classname> pageBean;
	private ClassnameService classnameService;
	private List<Classname> list = new ArrayList<Classname>();
	private Classname classname = new Classname();
	
	public void setClassnameService(ClassnameService classnameService) {
		this.classnameService = classnameService;
	}

	public Integer getCurrPage() {
		return currPage;
	}

	public void setCurrPage(Integer currPage) {
		this.currPage = currPage;
	}

	public PageBean<Classname> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<Classname> pageBean) {
		this.pageBean = pageBean;
	}

	
	public List<Classname> getList() {
		return list;
	}

	public void setList(List<Classname> list) {
		this.list = list;
	}

	@Override
	public Classname getModel() {
		return classname;
	}
	
	public String execute(){
		pageBean = classnameService.findByPage(currPage);
		return "success";
	}
}
