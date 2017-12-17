package zhou.yi.service.Impl;

import java.util.List;

import zhou.yi.dao.CommentDao;
import zhou.yi.domain.Comment;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.service.CommentService;

public class CommentServiceImpl implements CommentService {

	private CommentDao commentDao;

	public void setCommentDao(CommentDao commentDao) {
		this.commentDao = commentDao;
	}

	@Override
	public PageBean<Comment> getByPage(Integer questionId, Integer currPage) {
		PageBean<Comment> pageBean = new PageBean<Comment>();
		pageBean.setCurrPage(currPage);
		int pageSize = 2;
		pageBean.setPageSize(pageSize);
		int totalCount = commentDao.findCount(questionId);
		pageBean.setTotalCount(totalCount);
		double tc = totalCount;
		Double num = Math.ceil(tc / pageSize);
		pageBean.setTotalPage(num.intValue());
		int begin = (currPage - 1) * pageSize;
		List<Comment> list = commentDao.getByPage(questionId,begin, pageSize);
		pageBean.setList(list);
		return pageBean;
	}

	@Override
	public void saveComment(Comment comment) {
		commentDao.saveCom(comment);
	}
	
}
