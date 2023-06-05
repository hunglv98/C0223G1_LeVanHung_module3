package repo;

import model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepo implements IUserRepo {
    private static final String SP_SELECT = "call show_list()";
    private static final String SP_UPDATE = "call update_user(?,?,?,?)";
    private static final String SP_DELETE = "call delete_user(?)";
    private static final String SP_INSERT = "call insert_user(?,?,?)";
    
    @Override
    public void insertUser(User user) throws SQLException {
        Connection connection = BaseRepo.createConnect();
        connection.setAutoCommit(false);
        CallableStatement callableStatement = connection.prepareCall(SP_INSERT);
        callableStatement.setString(1, user.getName());
        callableStatement.setString(2, user.getEmail());
        callableStatement.setString(3, user.getCountry());
        callableStatement.executeUpdate();
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
            connection.setAutoCommit(false);
            CallableStatement callableStatement = connection.prepareCall(SP_SELECT);
            callableStatement.executeQuery();
            ResultSet resultSet = callableStatement.getResultSet();
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
        connection.setAutoCommit(false);
        CallableStatement callableStatement = connection.prepareCall(SP_DELETE);
        callableStatement.setInt(1, id);
        callableStatement.executeUpdate();
        connection.close();
    }

    @Override
    public void updateUser(int id, String name, String email, String country) throws SQLException {
        Connection connection = BaseRepo.createConnect();
        connection.setAutoCommit(false);
        CallableStatement callableStatement = connection.prepareCall(SP_UPDATE);
        callableStatement.setString(1, name);
        callableStatement.setString(2, email);
        callableStatement.setString(3, country);
        callableStatement.setInt(4, id);
        callableStatement.executeUpdate();
        connection.close();
    }
}
