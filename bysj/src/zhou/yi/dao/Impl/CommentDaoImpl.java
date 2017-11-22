package zhou.yi.dao.Impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.CommentDao;
import zhou.yi.domain.Comment;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {

	@Override
	public Comment getById(int id) {
		return getHibernateTemplate().get(Comment.class, id);
	}

	@Override
	public void saveCom(Comment comment) {
		getHibernateTemplate().save(comment);
	}

}
