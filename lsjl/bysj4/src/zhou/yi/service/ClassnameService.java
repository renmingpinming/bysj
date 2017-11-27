package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Classname;

public interface ClassnameService {

	Classname findById(Integer id);

	List<Classname> findAll();

}
