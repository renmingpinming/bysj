package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.domain.Student;

public interface QuestionService {

	List<Question> getAll();

	PageBean<Question> getAllByPage(Integer currPage);

	PageBean<Question> getTeaByPage(Integer currPage);

	PageBean<Question> getStuByPage(Integer currPage);

	Question getById(Integer questionId);

	void saveTopic(Question question);

}
