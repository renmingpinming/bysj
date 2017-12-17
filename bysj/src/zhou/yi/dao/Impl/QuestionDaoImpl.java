package zhou.yi.dao.Impl;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.QuestionDao;
import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;

public class QuestionDaoImpl extends HibernateDaoSupport implements QuestionDao {

	@Override
	public void saveQuestion(Question question) {
		getHibernateTemplate().save(question);
	}

	@Override
	public Question getById(int id) {
		return getHibernateTemplate().get(Question.class, id);
	}

	@Override
	public List<Question> getByAuthorId(Integer aid) {
		String hql = "from Question where author_id = ? order by create_time desc";
		Object[] params = {aid};
		List<Question> list = getHibernateTemplate().find(hql, params);
		return list;
	}

	@Override
	public List<Question> getTeacherQu() {
		String hql = "from Question where author_id < 20140000 order by create_time desc";
		List<Question> list = getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public List<Question> getStudentQu() {
		String hql = "from Question where author_id > 20140000 order by create_time desc";
		List<Question> list = getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public List<Question> getAllQu() {
		String hql = "from Question order by create_time desc";
		List<Question> list = getHibernateTemplate().find(hql);
		return list;
	}

	@Override
	public int findAllCount() {
		String hql = "select count(*) from Question";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Question> getAllByPage(final int begin, final int pageSize) {
	List<Question> list = getHibernateTemplate().execute(
			new HibernateCallback() {

				@Override
				public Object doInHibernate(Session session)
						throws HibernateException, SQLException {
					String hql = "from Question order by create_time desc";
					Query query = session.createQuery(hql);
					query.setFirstResult(begin);
					query.setMaxResults(pageSize);
					return query.list();
				}
			}
			);
		return list;
	}

	@Override
	public int findTeaCount() {
		String hql = "select count(*) from Question where author_id < 20140000";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Question> getTeaByPage(final int begin, final int pageSize) {
		List<Question> list = getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from Question where author_id < 20140000 order by create_time desc";
						Query query = session.createQuery(hql);
						query.setFirstResult(begin);
						query.setMaxResults(pageSize);
						return query.list();
					}
				}
				);
			return list;
	}

	@Override
	public int findStuCount() {
		String hql = "select count(*) from Question where author_id > 20140000";
		List<Long> list =  getHibernateTemplate().find(hql);
		if(list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}

	@Override
	public List<Question> getStuByPage(final int begin, final int pageSize) {
		List<Question> list = getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						String hql = "from Question where author_id > 20140000 order by create_time desc";
						Query query = session.createQuery(hql);
						query.setFirstResult(begin);
						query.setMaxResults(pageSize);
						return query.list();
					}
				}
				);
			return list;
	}

	
}
