package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;

public interface CourseService {

	Course findById(Integer cid);

	List<Course> findAll();

	PageBean<Course> findByPage(Integer currPage);

	void saveCourse(Course course);


}
