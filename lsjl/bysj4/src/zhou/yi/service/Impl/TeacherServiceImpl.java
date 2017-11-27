package zhou.yi.service.Impl;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.TeacherDao;
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

}
