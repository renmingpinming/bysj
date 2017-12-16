package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Comment;

public interface CommentDao {
	
	public Comment getById(int id);
	
	public void saveCom(Comment comment);
	
	public List<Comment> getByQid(Integer qid);
	
}
