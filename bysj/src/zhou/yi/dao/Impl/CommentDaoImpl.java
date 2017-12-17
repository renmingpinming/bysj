package zhou.yi.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.CommentDao;
import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;

public class CommentDaoImpl extends HibernateDaoSupport implements CommentDao {

	@Override
	public Comment getById(int id) {
		return getHibernateTemplate().get(Comment.class, id);
	}

	@Override
	public void saveCom(Comment comment) {
		getHibernateTemplate().save(comment);
	}

	@Override
	public List<Comment> getByQid(Integer qid) {
		String hql = "from Comment where question_id = ? order by create_time desc";
		Object[] params = {qid};
		List<Comment> list = getHibernateTemplate().find(hql,params);
		return list;
	}

	@Override
	public int findCount(Integer questionId) {
		String hql = "select count(*) from Comment where question_id = ?";
		Object[] params = {questionId};
		List<Long> list =  getHibernateTemplate().find(hql,params);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Comment> getByPage(final Integer questionId, final int begin, final int pageSize) {
		List<Comment> list = getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from Comment where question_id = ? order by create_time desc";
						Query query = session.createQuery(hql);
						query.setLong(0, questionId);
						query.setFirstResult(begin);
						query.setMaxResults(pageSize);
						return query.list();
					}
				}
				);
			return list;
	}

}
