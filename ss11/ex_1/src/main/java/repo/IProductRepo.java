package repo;

import model.Product;

import java.util.List;

public interface IProductRepo {
    List<Product>  showList();
    void add(Product product);
    void edit(int id, String name, double price, String description, String manufacturer);
    void delete(int id);
}
