package zhou.yi.service.Impl;

import java.util.List;

import zhou.yi.dao.HomeworkDao;
import zhou.yi.domain.Homework;
import zhou.yi.service.HomeworkService;

public class HomeworkServiceImpl implements HomeworkService {
	private HomeworkDao homeworkDao;

	public void setHomeworkDao(HomeworkDao homeworkDao) {
		this.homeworkDao = homeworkDao;
	}

	@Override
	public List<Homework> getByCourseId(Integer course_id) {
		return homeworkDao.getByCourseId(course_id);
	}

	@Override
	public void saveHomework(Homework homework) {
		homeworkDao.saveHomework(homework);
	}

	@Override
	public Homework getByCourseIdAndHid(Integer course_id, Integer hid) {
		return homeworkDao.getByCourseIdAndHid(course_id,hid);
	}
	
}
