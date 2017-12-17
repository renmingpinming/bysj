package zhou.yi.service;

import zhou.yi.domain.Comment;
import zhou.yi.domain.PageBean;

public interface CommentService {

	PageBean<Comment> getByPage(Integer questionId, Integer currPage);

	void saveComment(Comment comment);

}
