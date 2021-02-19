package DAO;
 
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import login.*;
import util.*;
 
public class UserDao {
 
public String authenticateUser(user loginBean)
{
    String Email = loginBean.getUser();
    String Password = loginBean.getPassword();
    String Role = loginBean.getRole();
 
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
 
    String userNameDB = "";
    String passwordDB = "";
    String roleDB = "";
 
    try
    {
        con = DBConnection.createConnection();
        PreparedStatement ps = con.prepareStatement(
                "SELECT Email, Password, Role FROM users WHERE  Email=? and Password=? and Role = ?");
        ps.setString(1, Email);
        ps.setString(2, Password);
        ps.setString(3, Role);
        resultSet = ps.executeQuery();
 
        while(resultSet.next())
        {
        	userNameDB = resultSet.getString(1);
        	System.out.println(userNameDB);
        	passwordDB = resultSet.getString(2);
        	System.out.println(passwordDB);
        	roleDB = resultSet.getString(3);
        	System.out.println(roleDB);
 
            if(Email.equals(userNameDB) && Password.equals(passwordDB) && roleDB.equals("manager"))
            return "Admin_Role";
            else if(Email.equals(userNameDB) && Password.equals(passwordDB) && roleDB.equals("employee"))
            return "Employee_Role";
            
        }
    }
    catch(SQLException e)
    {
        e.printStackTrace();
    }
    return "Invalid user credentials";
}
}