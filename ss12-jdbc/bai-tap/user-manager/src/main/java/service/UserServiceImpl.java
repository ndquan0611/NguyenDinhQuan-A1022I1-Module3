package service;

import bean.User;
import repository.UserRepository;
import repository.UserRepositoryImpl;

import java.util.List;

public class UserServiceImpl implements UserService {
    private static UserRepository repository = new UserRepositoryImpl();

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public void save(User user) {
        repository.save(user);
    }

    @Override
    public void update(User user) {
        repository.update(user);
    }

    @Override
    public void delete(int id) {
        repository.delete(id);
    }

    @Override
    public User findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<User> findUserByCountry(String ct) {
        return repository.findUserByCountry(ct);
    }

    @Override
    public List<User> sort() {
        return repository.sort();
    }


}
