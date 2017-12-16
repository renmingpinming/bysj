package zhou.yi.service;

import zhou.yi.domain.PageBean;
import zhou.yi.domain.Student;

public interface StudentService {

	Student findById(Integer sid);

	void update(Student student);

	PageBean<Student> findByPage(Integer currPage);

	void saveStudent(Student student);

	void deleteStudent(Student student);

}
