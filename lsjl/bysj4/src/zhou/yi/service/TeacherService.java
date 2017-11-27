package zhou.yi.service;

import zhou.yi.domain.Teacher;

public interface TeacherService {

	Teacher findById(Integer tid);

	void update(Teacher teacher);

}
