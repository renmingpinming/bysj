package zhou.yi.service.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.ClassnameDao;
import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
import zhou.yi.service.ClassnameService;
@Transactional
public class ClassnameServiceImpl implements ClassnameService {

	private ClassnameDao classnameDao;
	
	public void setClassnameDao(ClassnameDao classnameDao) {
		this.classnameDao = classnameDao;
	}

	@Override
	public Classname findById(Integer id) {
		return classnameDao.findById(id);
	}

	@Override
	public List<Classname> findAll() {
		return classnameDao.findAll();
	}

	@Override
	public PageBean<Classname> findByPage(Integer currPage) {
		PageBean<Classname> pageBean = new PageBean<Classname>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = classnameDao.findCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Classname> list = classnameDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void saveClassname(Classname classname) {
		classnameDao.saveClassname(classname);
	}

}
