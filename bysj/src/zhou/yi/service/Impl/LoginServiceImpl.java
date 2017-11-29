package zhou.yi.service.Impl;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.DepartmentDao;
import zhou.yi.dao.StudentDao;
import zhou.yi.dao.TeacherDao;
import zhou.yi.domain.Department;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;
import zhou.yi.service.LoginService;

@Transactional
public class LoginServiceImpl implements LoginService {
	
	private TeacherDao teacherDao;
	private StudentDao studentDao;
	private DepartmentDao departmentDao;

	public void setDepartmentDao(DepartmentDao departmentDao) {
		this.departmentDao = departmentDao;
	}


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


	@Override
	public Student login_student(String user_id, String password) {
		int sid = Integer.parseInt(user_id);
		Student student = new Student();
		student.setSid(sid);
		student.setPassword(password);
		return studentDao.login(student);
	}


	@Override
	public Department login_department(String user_id, String password) {
		int did = Integer.parseInt(user_id);
		Department department = new Department();
		department.setDid(did);
		department.setPassword(password);
		return departmentDao.login(department);
	}

}
