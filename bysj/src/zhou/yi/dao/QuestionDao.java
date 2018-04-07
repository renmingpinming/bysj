package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;

public interface QuestionDao {
	
	public void saveQuestion(Question question);
	
	public Question getById(int id);
	
	public List<Question> getByAuthorId(Integer aid);
	
	public List<Question> getTeacherQu();
	
	public List<Question> getStudentQu();
	
	public List<Question> getAllQu();

	public int findAllCount();

	public List<Question> getAllByPage(int begin, int pageSize);
	
	public int findTeaCount();

	public List<Question> getTeaByPage(int begin, int pageSize);
	
	public int findStuCount();

	public List<Question> getStuByPage(int begin, int pageSize);
	
	public List<Question> searchAllByKey(int begin, int pageSize,String key);
	
	public int findKeyCount(String key);
}
