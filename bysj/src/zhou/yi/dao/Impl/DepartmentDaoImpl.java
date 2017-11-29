package zhou.yi.dao.Impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.DepartmentDao;
import zhou.yi.domain.Department;

public class DepartmentDaoImpl extends HibernateDaoSupport implements DepartmentDao {

	@Override
	public Department login(Department department) {
		String hql = "from Department where did = ? and password = ?";
		Object[] params = {department.getDid(),department.getPassword()};
		List<Department> list = getHibernateTemplate().find(hql,params);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
	}

}
