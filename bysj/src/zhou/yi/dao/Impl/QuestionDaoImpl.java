package zhou.yi.dao.Impl;

import java.util.List;

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

	
}
