<%@page import="java.sql.*" %> 
 
 
<% 
        String ProductID = request.getParameter("ProductID");
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
        pst = con.prepareStatement("delete from sales where SalesID = ?");
         pst.setString(1, ProductID);
        pst.executeUpdate();  
        
        %>
         <%
            // New location to be redirected
            String site = new String("sales.jsp");
            response.setStatus(response.SC_MOVED_TEMPORARILY);
            response.setHeader("Location", site); 
         %>
        
        <script>
            
            alert("Record Deleted");
            window.location.replace(window.location.href);
       </script>