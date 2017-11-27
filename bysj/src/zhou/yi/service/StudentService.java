package zhou.yi.service;

import zhou.yi.domain.Student;

public interface StudentService {

	Student findById(Integer sid);

	void update(Student student);

}
