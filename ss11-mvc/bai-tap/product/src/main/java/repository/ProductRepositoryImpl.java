package repository;

import bean.Product;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProductRepositoryImpl implements ProductRepository{
    private static Map<Integer, Product> productMap = new HashMap<>();

    static {
        productMap.put(1, new Product(1, "Iphone 14", 19000000, "San pham toi uu", "USA"));
        productMap.put(2, new Product(2, "Iphone 13", 18000000, "San pham toi uu", "China"));
        productMap.put(3, new Product(3, "Iphone 12", 14000000, "San pham toi uu", "China"));
        productMap.put(4, new Product(4, "Iphone 11", 11000000, "San pham toi uu", "Vietnam"));
        productMap.put(5, new Product(5, "Iphone X", 8000000, "San pham toi uu", "USA"));
        productMap.put(6, new Product(6, "Iphone 8", 4000000, "San pham toi uu", "USA"));
    }

    @Override
    public List<Product> findAll() {
        return new ArrayList<>(productMap.values());
    }

    @Override
    public boolean save(Product product) {
        if (productMap.containsKey(product.getId())) {
            return false;
        }
        productMap.put(product.getId(), product);
        return true;
    }

    @Override
    public boolean update(Product product) {
        if (productMap.containsKey(product.getId())) {
            productMap.put(product.getId(), product);
            return true;
        }
        return false;
    }

    @Override
    public boolean delete(int id) {
        if (productMap.containsKey(id)) {
            productMap.remove(id);
            return true;
        }
        return false;
    }

    @Override
    public Product findById(int id) {
        return productMap.get(id);
    }
}
