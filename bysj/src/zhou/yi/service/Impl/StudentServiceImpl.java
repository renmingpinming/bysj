package zhou.yi.service.Impl;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.StudentDao;
import zhou.yi.domain.Student;
import zhou.yi.service.StudentService;
@Transactional
public class StudentServiceImpl implements StudentService {

	private StudentDao studentDao;

	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}

	@Override
	public Student findById(Integer sid) {
		return studentDao.findById(sid);
	}

	@Override
	public void update(Student student) {
		studentDao.update(student);
	}
	
}
