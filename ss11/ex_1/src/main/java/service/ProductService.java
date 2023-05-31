package service;

import model.Product;
import repo.ProductRepo;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

public class ProductService implements IProductService{
    private ProductRepo productRepo = new ProductRepo();
    @Override
    public List<Product> getList() {
        return productRepo.showList();
    }

    @Override
    public void add(HttpServletRequest request) {
//        int id, String name, double price, String description, String manufacturer
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        double price = Double.parseDouble(request.getParameter("price"));
        String description = request.getParameter("description");
        String manufacturer = request.getParameter("manufacturer");
        productRepo.add(new Product(id,name,price,description,manufacturer));
    }

    @Override
    public void delete(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        productRepo.delete(id);
    }

    @Override
    public void edit(int id, String name, double price, String description, String manufacturer) {
        productRepo.edit(id,name,price,description,manufacturer);
    }
}
