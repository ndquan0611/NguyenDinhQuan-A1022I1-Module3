package repository;

import bean.Product;

import java.util.List;

public interface ProductRepository {
    List<Product> findAll();
    boolean save(Product product);
    boolean update(Product product);
    boolean delete(int id);
    Product findById(int id);
}
