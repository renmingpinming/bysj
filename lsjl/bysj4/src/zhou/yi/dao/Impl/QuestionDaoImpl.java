package zhou.yi.dao.Impl;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.QuestionDao;
import zhou.yi.domain.Comment;
import zhou.yi.domain.Question;

public class QuestionDaoImpl extends HibernateDaoSupport implements QuestionDao {

	@Override
	public void saveCom(Comment comment) {
		getHibernateTemplate().save(comment);
	}

	@Override
	public Question getById(int id) {
		return getHibernateTemplate().get(Question.class, id);
	}

}
