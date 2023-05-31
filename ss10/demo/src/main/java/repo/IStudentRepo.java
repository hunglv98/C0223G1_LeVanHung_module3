package repo;

import model.Student;

import java.util.List;

public interface IStudentRepo {
    List<Student> getList();
    void add(Student student);
    void edit(int id, String name,String address,String email);
    void delete(int id);
}
