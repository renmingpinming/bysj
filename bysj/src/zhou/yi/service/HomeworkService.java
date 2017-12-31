package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Homework;

public interface HomeworkService {

	List<Homework> getByCourseId(Integer course_id);

	void saveHomework(Homework homework);

	Homework getByCourseIdAndHid(Integer course_id, Integer hid);

}
