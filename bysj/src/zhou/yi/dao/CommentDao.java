package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Comment;

public interface CommentDao {
	
	public Comment getById(int id);
	
	public void saveCom(Comment comment);
	
	public List<Comment> getByQid(Integer qid);

	public int findCount(Integer questionId);

	public List<Comment> getByPage(Integer questionId, int begin, int pageSize);
	
}
