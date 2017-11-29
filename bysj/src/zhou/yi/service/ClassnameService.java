package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.PageBean;

public interface ClassnameService {

	Classname findById(Integer id);

	List<Classname> findAll();

	PageBean<Classname> findByPage(Integer currPage);

	void saveClassname(Classname classname);

}
