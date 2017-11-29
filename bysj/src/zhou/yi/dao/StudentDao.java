package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public interface StudentDao {
	
	public Student login(Student student);
	
	public void saveStu(Student student);
	
	public void update(Student student);
	
	public void delete(Student student);
	
	public Student findById(Integer sid);
	
	public List<Course> getCourse(Integer sid);

	public int findCount();

	public List<Student> findByPage(int begin, int pageSize);


}
