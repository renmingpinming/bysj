package zhou.yi.service.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.CourseDao;
import zhou.yi.domain.Course;
import zhou.yi.service.CourseService;

@Transactional
public class CourseServiceImpl implements CourseService {
	
	private CourseDao courseDao;
	

	public void setCourseDao(CourseDao courseDao) {
		this.courseDao = courseDao;
	}


	@Override
	public Course findById(Integer cid) {
		return courseDao.findById(cid);
	}


	@Override
	public List<Course> findAll() {
		return courseDao.findAll();
	}

}
