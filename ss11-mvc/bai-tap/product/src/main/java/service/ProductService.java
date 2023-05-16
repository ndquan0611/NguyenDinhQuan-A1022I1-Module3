package service;

import bean.Product;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    boolean save(Product product);
    boolean update(Product product);
    boolean delete(int id);
    Product findById(int id);
}
