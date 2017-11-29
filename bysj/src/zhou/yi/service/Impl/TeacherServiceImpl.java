package zhou.yi.service.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.TeacherDao;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.TeacherService;
@Transactional
public class TeacherServiceImpl implements TeacherService {
	private TeacherDao teacherDao;

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}

	@Override
	public Teacher findById(Integer tid) {
		return teacherDao.findById(tid);
	}

	@Override
	public void update(Teacher teacher) {
		teacherDao.update(teacher);
	}

	@Override
	public PageBean<Teacher> findByPage(Integer currPage) {
		PageBean<Teacher> pageBean = new PageBean<Teacher>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = teacherDao.findCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Teacher> list = teacherDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void saveTeacher(Teacher teacher) {
		teacherDao.saveTea(teacher);
	}

}
