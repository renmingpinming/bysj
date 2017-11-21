package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Classname;
import zhou.yi.domain.Course;
import zhou.yi.domain.Teacher;

public interface TeacherDao {

	public Teacher login(Teacher teacher);

	public void saveStu(Teacher teacher);
	
	public void update(Teacher teacher);
	
	public void delete(Teacher teacher);
	
	public Teacher findById(Integer tid);
	
	public List<Classname> findClassname(Integer tid);
	
	public List<Course> findCourse(Integer tid);
}
