package zhou.yi.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import zhou.yi.dao.CourseDao;
import zhou.yi.dao.StudentDao;
import zhou.yi.domain.Course;
import zhou.yi.domain.Student;

public class Test1 {

	//@Test
	public void test() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		Student s = new Student();
		s.setSid(20140109);
		s.setPassword("123");
		Student st =studentDao.login(s);
		System.out.println(st.getSname());
		//System.out.println("kec"+st.getCourses());
		if(st.getCourses() == null)
			System.out.println("kong");
		else{
			for (Course co : st.getCourses()) {
				System.out.println(co.getCname());
			}
		}
		
	}
	
	//@Test
	public void test1() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		/*Course c = new Course();
		c.setCid(1001);
		c.setCname("aaa");
		Course c2 = new Course();
		c.setCid(1002);
		c.setCname("”ÔŒƒ");*/
		Student s = new Student();
		s.setSname("÷‹11");
		s.setPassword("123");
		//s.getCourses().add(c);
		//s.getCourses().add(c2);
		studentDao.saveStu(s);
	}
	
	//@Test
	public void test2() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		Student s = studentDao.findById(20140101);
		System.out.println("name:"+s.getSname());
	}
	
	//@Test
	public void test3() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		CourseDao courseDao = (CourseDao) ac.getBean("CourseDao");
		List<Student> list = (List<Student>)courseDao.findByPage(1002, 3, 5);
		for (Student student : list) {
			System.out.println("name:"+student.getSname());
		}
	}
	
	@Test
	public void test4() {
		String conf = "applicationContext.xml";
		ApplicationContext ac = new ClassPathXmlApplicationContext(conf);
		StudentDao studentDao = (StudentDao) ac.getBean("StudentDao");
		CourseDao courseDao = (CourseDao) ac.getBean("CourseDao");
		Student s = studentDao.findById(20140115);
		Course c = courseDao.findById(1001);
		Course c1 = courseDao.findById(1002);
		s.getCourses().add(c);
		s.getCourses().add(c1);
		
		studentDao.update(s);
	}
	

		
}
