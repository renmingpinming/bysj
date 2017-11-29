package zhou.yi.service;

import zhou.yi.domain.Department;
import zhou.yi.domain.Student;
import zhou.yi.domain.Teacher;

public interface LoginService {

	Teacher login_teacher(String user_id, String password);

	Student login_student(String user_id, String password);

	Department login_department(String user_id, String password);


}
