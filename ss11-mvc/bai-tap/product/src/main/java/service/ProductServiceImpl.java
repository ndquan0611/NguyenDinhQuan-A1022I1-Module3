package service;

import bean.Product;
import repository.ProductRepository;
import repository.ProductRepositoryImpl;

import java.util.List;

public class ProductServiceImpl implements ProductService{
    private static ProductRepository repository = new ProductRepositoryImpl();
    @Override
    public List<Product> findAll() {
        return repository.findAll();
    }

    @Override
    public boolean save(Product product) {
        return repository.save(product);
    }

    @Override
    public boolean update(Product product) {
        return repository.update(product);
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }

    @Override
    public Product findById(int id) {
        return repository.findById(id);
    }
}
