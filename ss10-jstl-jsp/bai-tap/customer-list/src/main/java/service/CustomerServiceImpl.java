package service;

import bean.Customer;
import repository.CustomerRepository;
import repository.CustomerRepositoryImpl;

import java.util.List;

public class CustomerServiceImpl implements CustomerService {
    private static CustomerRepository repository = new CustomerRepositoryImpl();
    @Override
    public List<Customer> findAll() {
        return repository.findAll();
    }
}
