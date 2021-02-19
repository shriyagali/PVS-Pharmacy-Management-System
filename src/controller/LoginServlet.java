package controller;
import java.io.IOException;
 
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
 
import login.*;
import DAO.*;
 
public class LoginServlet extends HttpServlet {
private static final long serialVersionUID = 1L;
 
public LoginServlet() {
}
 
protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
{
    String Email = request.getParameter("Email");
    String Password = request.getParameter("Password");
    String Role = request.getParameter("Role");
 
    user loginBean = new user();
 
    loginBean.setUser(Email);
    loginBean.setPassword(Password);
    loginBean.setRole(Role);
    
    System.out.println(Email);
    System.out.println(Password);
    System.out.println(Role);
 
    UserDao loginDao = new UserDao();
 
    try
    {
        String userValidate = loginDao.authenticateUser(loginBean);
 
        if(userValidate.equals("Admin_Role"))
        {
            System.out.println("Manager's Home");
 
            HttpSession session = request.getSession(); //Creating a session
            session.setAttribute("Email", Email); //setting session attribute
            request.setAttribute("Email", Email);
 
            request.getRequestDispatcher("viewManager.jsp").forward(request, response);
        }
        else if(userValidate.equals("Employee_Role"))
        {
            System.out.println("Employee's Home");
 
            HttpSession session = request.getSession();
            session.setAttribute("Email", Email);
            request.setAttribute("Email", Email);
 
            request.getRequestDispatcher("viewEmployee.jsp").forward(request, response);
        }
        
        else
        {
            System.out.println("Error message = "+userValidate);
            request.setAttribute("errMessage", userValidate);
            
            request.getRequestDispatcher("index.jsp").forward(request, response);
        }
    }
    catch (IOException e1)
    {
        e1.printStackTrace();
    }
    catch (Exception e2)
    {
        e2.printStackTrace();
    }
} //End of doPost()
}
