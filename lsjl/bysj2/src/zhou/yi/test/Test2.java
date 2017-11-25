package zhou.yi.test;

import static org.junit.Assert.*;

import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import zhou.yi.dao.CommentDao;
import zhou.yi.dao.CourseDao;
import zhou.yi.dao.QuestionDao;
import zhou.yi.dao.StudentDao;
import zhou.yi.domain.Comment;
import zhou.yi.domain.Course;
import zhou.yi.domain.Question;
import zhou.yi.domain.Student;

public class Test2 {

	@Test
	public void test() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		QuestionDao questionDao = (QuestionDao) ac.getBean("QuestionDao");
		CommentDao commentDao = (CommentDao) ac.getBean("CommentDao");
		Comment co = commentDao.getById(1001);
		Question qu = questionDao.getById(1001);
		//System.out.println("name:"+co.getContent());
		//System.out.println("name:"+qu.getContent());
		//qu.getComments().add(co);
		Set<Comment> cos = qu.getComments();
		for (Comment comment : cos) {
			System.out.println("name:"+comment.getContent());
		}
	}
	
	//@Test
	public void test1() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		QuestionDao questionDao = (QuestionDao) ac.getBean("QuestionDao");
		CommentDao commentDao = (CommentDao) ac.getBean("CommentDao");
		Question qu = questionDao.getById(1001);
		Comment co = commentDao.getById(1004);
		//System.out.println("name:"+co.getQuestion().getContent());
		
	/*	Comment co = new Comment();
		co.setContent("nihao");
		co.setQuestion(qu);
		commentDao.saveCom(co);*/
		
		Set<Comment> cos = qu.getComments();
		for (Comment comment : cos) {
			System.out.println("name:"+comment.getContent());
		}
	}

}
