package zhou.yi.dao.Impl;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import zhou.yi.dao.DocumentDao;
import zhou.yi.domain.Document;

public class DocumentDaoImpl extends HibernateDaoSupport implements DocumentDao {

	@Override
	public void saveDocument(Document document) {
		getHibernateTemplate().save(document);
	}

	@Override
	public List<Document> getTheDocuments(Integer course_id, Integer hid) {
		String hql = "from Document where course_id = ? and hid = ?";
		Object[] params = {course_id,hid};
		List<Document> list = getHibernateTemplate().find(hql, params);
		return list;
	}

}
