package repo;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private static final String SELECT_ALL_USERS = "select * from users";
    private static final String INSERT = "insert into users(name, email, country) values(?,?,?)";
    private static final String DELETE = "delete from users where id = ?";
    private static final String UPDATE = "update users set name = ?, email = ? , country = ? where id = ?";

    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = BaseRepo.createConnect();
        PreparedStatement preparedStatement = connection.prepareStatement(INSERT);
        preparedStatement.setString(1, user.getName());
        preparedStatement.setString(2, user.getEmail());
        preparedStatement.setString(3, user.getCountry());
        preparedStatement.executeUpdate();
        connection.close();
    }

    @Override
    public User selectUser(int id) {
        List<User> list = selectAllUsers();
        for (User u : list
        ) {
            if (u.getId() == id) {
                return u;
            }
        }
        return null;
    }

    @Override
    public List<User> selectAllUsers() {
        List<User> list = new ArrayList<>();
        Connection connection = BaseRepo.createConnect();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(SELECT_ALL_USERS);
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                String country = resultSet.getString("country");
                list.add(new User(id, name, email, country));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    @Override
    public void deleteUser(int id) throws SQLException {
        Connection connection = BaseRepo.createConnect();
        PreparedStatement preparedStatement = connection.prepareStatement(DELETE);
        preparedStatement.setInt(1, id);
        preparedStatement.executeUpdate();
        connection.close();
    }

    @Override
    public void updateUser(int id, String name, String email, String country) throws SQLException {
        Connection connection = BaseRepo.createConnect();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE);
        preparedStatement.setString(1, name);
        preparedStatement.setString(2, email);
        preparedStatement.setString(3, country);
        preparedStatement.setInt(4, id);
        preparedStatement.executeUpdate();
        connection.close();
    }
}
