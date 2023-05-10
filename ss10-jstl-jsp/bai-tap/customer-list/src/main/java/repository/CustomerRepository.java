package repository;

import bean.Customer;

import java.util.List;

public interface CustomerRepository  {
    List<Customer> findAll();
}
