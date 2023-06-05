package service;

import model.User;
import repo.UserRepo;

import java.sql.SQLException;
import java.util.List;

public class UserService implements IUserService {
    private final UserRepo userRepo = new UserRepo();

    @Override
    public void insertUser(User user) throws SQLException {
        userRepo.insertUser(user);
    }

    @Override
    public User selectUser(int id) {
        return userRepo.selectUser(id);
    }

    @Override
    public List<User> selectAllUsers() {
        return userRepo.selectAllUsers();
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        userRepo.deleteUser(id);
    }

    @Override
    public void updateUser(int id, String name, String email, String country) throws SQLException {
        userRepo.updateUser(id, name, email, country);
    }
}
