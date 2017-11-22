package zhou.yi.dao;

import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;

public interface QuestionDao {
	
	public void saveCom(Comment comment);
	
	public Question getById(int id);
}
