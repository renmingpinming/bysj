package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Homework;

public interface HomeworkDao {

	public List<Homework> getByCourseId(Integer course_id);
	
	public void saveHomework(Homework homework);

	public Homework getByCourseIdAndHid(Integer course_id, Integer hid);
}
