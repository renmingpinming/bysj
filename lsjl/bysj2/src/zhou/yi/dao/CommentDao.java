package zhou.yi.dao;

import zhou.yi.domain.Comment;

public interface CommentDao {
	
	public Comment getById(int id);
	
	public void saveCom(Comment comment);
	
}
