package service;

import model.Product;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public interface IProductService {
    List<Product> getList();
    void add(HttpServletRequest request);
    void delete(HttpServletRequest request);
    void edit(int id, String name, double price, String description, String manufacturer);
}
