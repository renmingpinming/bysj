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
}
