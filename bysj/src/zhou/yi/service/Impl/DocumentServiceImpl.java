package zhou.yi.service.Impl;

import zhou.yi.dao.DocumentDao;
import zhou.yi.service.DocumentService;

public class DocumentServiceImpl implements DocumentService {

	private DocumentDao documentDao;

	public void setDocumentDao(DocumentDao documentDao) {
		this.documentDao = documentDao;
	}
	
}
