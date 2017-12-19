package zhou.yi.service.Impl;

import zhou.yi.dao.HomeworkDao;
import zhou.yi.service.HomeworkService;

public class HomeworkServiceImpl implements HomeworkService {
	private HomeworkDao homeworkDao;

	public void setHomeworkDao(HomeworkDao homeworkDao) {
		this.homeworkDao = homeworkDao;
	}
	
}
