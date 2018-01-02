package zhou.yi.service;

import java.util.List;

import zhou.yi.domain.Document;

public interface DocumentService {

	void saveDocument(Document document);

	List<Document> getByCourseIdAndHid(Integer course_id, Integer hid);

}
