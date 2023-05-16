package service;

import bean.User;

import java.util.List;

public interface UserService {
    List<User> findAll();
    boolean save(User user);
    boolean update(User user);
    boolean delete(int id);
    User findById(int id);
}
