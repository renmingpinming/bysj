package zhou.yi.service;

import zhou.yi.domain.PageBean;
import zhou.yi.domain.Teacher;

public interface TeacherService {

	Teacher findById(Integer tid);

	void update(Teacher teacher);

	PageBean<Teacher> findByPage(Integer currPage);

	void saveTeacher(Teacher teacher);

	void deleteTeacher(Teacher teacher);

}
