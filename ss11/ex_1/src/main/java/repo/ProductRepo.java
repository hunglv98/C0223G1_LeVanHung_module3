package repo;

import model.Product;

import java.util.ArrayList;
import java.util.List;

public class ProductRepo implements IProductRepo{
    private static List<Product> list = new ArrayList<>();
    static {
        list.add(new Product(1,"OMO",15000,"Bột giặt","P&G"));
        list.add(new Product(2,"Ariel",20000,"Nước giặt","PG"));
        list.add(new Product(3,"Tide",18000,"Bột giặt","P&G"));
        list.add(new Product(4,"PS",17000,"Kem đánh răng","P&G"));
    }
    @Override
    public List<Product> showList() {
        return list;
    }

    @Override
    public void add(Product product) {
        list.add(product);
    }

    @Override
    public void edit(int id, String name, double price, String description, String manufacturer) {
        for (Product p : list) {
            if(p.getId()==id){
                p.setName(name);
                p.setPrice(price);
                p.setDescription(description);
                p.setManufacturer(manufacturer);
                break;
            }
        }
    }

    @Override
    public void delete(int id) {
        for (Product p: list) {
            if(p.getId()==id){
                list.remove(p);
                break;
            }
        }
    }
}
