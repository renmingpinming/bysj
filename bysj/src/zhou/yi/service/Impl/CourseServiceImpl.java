package zhou.yi.service.Impl;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import zhou.yi.dao.CourseDao;
import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
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


	@Override
	public PageBean<Course> findByPage(Integer currPage) {
		PageBean<Course> pageBean = new PageBean<Course>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = courseDao.findCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Course> list = courseDao.findByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}


	@Override
	public void saveCourse(Course course) {
		courseDao.saveCourse(course);
	}




}
