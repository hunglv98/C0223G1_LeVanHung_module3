package service;

import model.Student;
import repo.StudentRepo;

import java.util.List;

public class StudentService implements IStudentService{
    private StudentRepo studentRepo = new StudentRepo();
    @Override
    public List<Student> getList() {
        return studentRepo.getList();
    }

    @Override
    public void add(Student student) {
        studentRepo.add(student);
    }

    @Override
    public void edit(int id, String name,String address,String email) {
        studentRepo.edit(id,name,address,email);
    }

    @Override
    public void delete(int id) {
        studentRepo.delete(id);
    }
}
