package zhou.yi.test;

import static org.junit.Assert.*;

import java.util.List;
import java.util.Set;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import zhou.yi.dao.ClassnameDao;
import zhou.yi.dao.CommentDao;
import zhou.yi.dao.CourseDao;
import zhou.yi.dao.QuestionDao;
import zhou.yi.dao.StudentDao;
import zhou.yi.dao.TeacherDao;
import zhou.yi.domain.Classname;
import zhou.yi.domain.Comment;
import zhou.yi.domain.Course;
import zhou.yi.domain.PageBean;
import zhou.yi.domain.Question;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;

public class Test2 {

	//@Test
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

	//@Test
	public void test2() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		TeacherDao teacherDao = (TeacherDao) ac.getBean("TeacherDao");
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		ClassnameDao classnameDao = (ClassnameDao) ac.getBean("ClassnameDao");
		Teacher teacher = teacherDao.findById(20080101);
		Student student = studentDao.findById(20140109);
		Classname classname = classnameDao.findById(1001);
		System.out.println(teacher.getTname() + student.getSname()+classname.getName());
		classname.getStudents().remove(student);
		Set<Student> str = classname.getStudents();
		for (Student student2 : str) {
			System.out.println(student2.getSname());
		}
	}
	
	//@Test
	public void test3() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		ClassnameDao classnameDao = (ClassnameDao) ac.getBean("ClassnameDao");
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		TeacherDao teacherDao = (TeacherDao) ac.getBean("TeacherDao");
		Student student = studentDao.findById(20140112);
		Classname classname = classnameDao.findById(1003);
		System.out.println(student.getSname()+"..."+classname.getName());
		Set<Student> str = classname.getStudents();
		str.remove(student);
		for (Student student2 : str) {
			System.out.println(student2.getSname());
		}
	}
	
	//@Test
	public void test4() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		QuestionDao questionDao = (QuestionDao) ac.getBean("QuestionDao");
		CommentDao commentDao = (CommentDao) ac.getBean("CommentDao");
		Question question = questionDao.getById(1001);
		Comment comment = new Comment();
		comment.setQuestion(question);
		comment.setContent("3333");
		commentDao.saveCom(comment);
		
	}
	
	    @Test
		public void test5() {
			String conf = "applicationContext.xml";
			ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
			QuestionDao questionDao = (QuestionDao) ac.getBean("QuestionDao");
			CommentDao commentDao = (CommentDao) ac.getBean("CommentDao");
			/*List<Comment> list = commentDao.getByQid(1001);
			for (Comment comment : list) {
				System.out.println(comment.getContent());
			}*/
			/*List<Question> list2 = questionDao.getAllQu();
			for (Question question : list2) {
				System.out.println(question.getTitle());
			}*/
			List<Comment> list3 = commentDao.getByPage(1001, 0, 2);
			for (Comment comment : list3) {
				System.out.println(comment.getContent());
			}
		}
	
	
}
