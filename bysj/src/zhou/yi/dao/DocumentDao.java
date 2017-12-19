package zhou.yi.dao;

import java.util.List;

import zhou.yi.domain.Document;

public interface DocumentDao {

	public void saveDocument(Document document);
	
	public List<Document> getTheDocuments(Integer course_id,Integer hid);
}
