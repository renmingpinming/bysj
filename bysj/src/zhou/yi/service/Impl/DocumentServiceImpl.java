package zhou.yi.service.Impl;

import java.util.List;

import zhou.yi.dao.DocumentDao;
import zhou.yi.domain.Document;
import zhou.yi.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {

	private DocumentDao documentDao;

	public void setDocumentDao(DocumentDao documentDao) {
		this.documentDao = documentDao;
	}

	@Override
	public void saveDocument(Document document) {
		documentDao.saveDocument(document);
	}

	@Override
	public List<Document> getByCourseIdAndHid(Integer course_id, Integer hid) {
		return documentDao.getTheDocuments(course_id, hid);
	}
	
}
