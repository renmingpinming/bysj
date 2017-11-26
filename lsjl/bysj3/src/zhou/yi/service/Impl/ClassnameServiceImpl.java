package zhou.yi.service.Impl;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.ClassnameDao;
import zhou.yi.domain.Classname;
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

}
