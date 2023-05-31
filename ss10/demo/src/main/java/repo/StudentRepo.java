package repo;

import model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepo implements IStudentRepo{
    private static List<Student> list = new ArrayList<>();
    static {
        list.add(new Student(1,"Hưng","123ABC","hung@123"));
        list.add(new Student(2,"Kiệt","456ABC","kiet@123"));
        list.add(new Student(3,"Thái","789ABC","kiet@123"));

    }
    @Override
    public List<Student> getList() {
        return list;
    }

    @Override
    public void add(Student student) {
        list.add(student);
    }

    @Override
    public void edit(int id, String name,String address,String email) {
        Student student = findId(id);
        student.setName(name);
        student.setAddress(address);
        student.setEmail(email);
    }

    @Override
    public void delete(int id) {
        for (Student s:list) {
            if(s.getId()==id){
                list.remove(s);
                break;
            }
        }
    }
    public Student findId(int id){
        for (Student s:list) {
            if(s.getId()==id){
                return s;
            }
        }
        return null;
    }
}
