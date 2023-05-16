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
    public boolean save(User user) {
        return repository.save(user);
    }

    @Override
    public boolean update(User user) {
        return repository.update(user);
    }

    @Override
    public boolean delete(int id) {
        return repository.delete(id);
    }

    @Override
    public User findById(int id) {
        return repository.findById(id);
    }
}
