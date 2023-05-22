package repository;

import bean.User;

import java.util.List;

public interface UserRepository {
    List<User> findAll();
    void save(User user);
    void update(User user);
    void delete(int id);
    User findById(int id);
    List<User> findUserByCountry(String ct);
    List<User> sort();
}
