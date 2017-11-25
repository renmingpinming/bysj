package zhou.yi.service.Impl;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.StudentDao;
import zhou.yi.dao.TeacherDao;
import zhou.yi.domain.Teacher;
import zhou.yi.service.LoginService;

@Transactional
public class LoginServiceImpl implements LoginService {
	
	private TeacherDao teacherDao;
	private StudentDao studentDao;
	

	public void setTeacherDao(TeacherDao teacherDao) {
		this.teacherDao = teacherDao;
	}


	public void setStudentDao(StudentDao studentDao) {
		this.studentDao = studentDao;
	}


	@Override
	public Teacher login_teacher(String user_id, String password) {
		int tid = Integer.parseInt(user_id);
		Teacher teacher = new Teacher();
		teacher.setTid(tid);
		teacher.setPassword(password);	
		return teacherDao.login(teacher);
	}

}
