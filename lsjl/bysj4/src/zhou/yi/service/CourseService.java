package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Course;

public interface CourseService {

	Course findById(Integer cid);

	List<Course> findAll();

}
