package zhou.yi.service.Impl;

import java.util.List;

import zhou.yi.dao.QuestionDao;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.domain.Student;
import zhou.yi.service.QuestionService;

public class QuestionServiceImpl implements QuestionService {

	private QuestionDao questionDao;

	public void setQuestionDao(QuestionDao questionDao) {
		this.questionDao = questionDao;
	}

	@Override
	public List<Question> getAll() {
		return questionDao.getAllQu();
	}

	@Override
	public PageBean<Question> getAllByPage(Integer currPage) {
		PageBean<Question> pageBean = new PageBean<Question>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = questionDao.findAllCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Question> list = questionDao.getAllByPage(begin,pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Question> getTeaByPage(Integer currPage) {
		PageBean<Question> pageBean = new PageBean<Question>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = questionDao.findTeaCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Question> list = questionDao.getTeaByPage(begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public PageBean<Question> getStuByPage(Integer currPage) {
		PageBean<Question> pageBean = new PageBean<Question>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = questionDao.findStuCount();
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Question> list = questionDao.getStuByPage(begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public Question getById(Integer questionId) {
		return questionDao.getById(questionId);
	}

	@Override
	public void saveTopic(Question question) {
		questionDao.saveQuestion(question);
	}
	
}
