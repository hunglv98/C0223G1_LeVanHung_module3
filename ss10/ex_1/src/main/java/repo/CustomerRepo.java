package repo;

import model.Customer;

import java.util.ArrayList;
import java.util.List;

public class CustomerRepo implements ICustomerRepo {

    private static List<Customer> list = new ArrayList<>();
    static {
        list.add(new Customer(1,"Hưng","05-06-1998","Đà Nẵng","https://www.google.com/imgres?imgurl=https%3A%2F%2Fdevmaster.edu.vn%2Fuploads%2Fimages%2F2019%2F05%2Fdevmaster-aibrain-696x522.jpg&tbnid=kle-pJOxMKaO5M&vet=12ahUKEwjQz4ODy5z_AhXSVt4KHfVhASkQMygMegQIARBb..i&imgrefurl=https%3A%2F%2Fdevmaster.edu.vn%2Ftri-tue-nhan-tao-ai-khac-gi-voi-tri-tue-con-nguoi.html&docid=XlS-3RJ7DgP98M&w=696&h=522&q=h%C3%ACnh%20%E1%BA%A3nh%20ai%20con%20ng%C6%B0%E1%BB%9Di&ved=2ahUKEwjQz4ODy5z_AhXSVt4KHfVhASkQMygMegQIARBb"));
        list.add(new Customer(2,"Hoa","06-05-1999","Huế","D:\\codegym\\module3\\ss10\\ex_1\\src\\main\\java\\2.jpg"));
        list.add(new Customer(3,"Kiệt","05-06-1997","Gia Lai","D:\\codegym\\module3\\ss10\\ex_1\\src\\main\\java\\3.jpg"));
        list.add(new Customer(4,"Thái","05-06-1996","Quảng Nam","D:\\codegym\\module3\\ss10\\ex_1\\src\\main\\java\\4.jpg"));
    }
    @Override
    public List<Customer> getList() {
        return list;
    }
}
