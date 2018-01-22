package zhou.yi.service.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.StudentDao;
import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
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

	@Override
	public PageBean<Student> findByPage(Integer currPage) {
		PageBean<Student> pageBean = new PageBean<Student>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = studentDao.findCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Student> list = studentDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void saveStudent(Student student) {
		studentDao.saveStu(student);
	}

	@Override
	public void deleteStudent(Student student) {
		studentDao.delete(student);
	}

	@Override
	public void deleteClno(int sid) {
		studentDao.deleteClno(sid);
	}

	@Override
	public void deleteCourse(Integer sid, Integer cid) {
		studentDao.deleteCourse(sid, cid);
	}
	
}
