<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
    	int SalesID = Integer.parseInt(request.getParameter("SalesID"));
        int SalesQuantity = Integer.parseInt(request.getParameter("SalesQuantity"));
        double UnitPrice = Double.parseDouble(request.getParameter("UnitPrice"));
        double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
        String SalesDate = request.getParameter("SalesDate");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
        pst = con.prepareStatement("update sales set SalesQuantity = ?, SalesDate = ?, TotalPrice = SalesQuantity * UnitPrice where SalesID = ?");
        pst.setInt(1,SalesQuantity);
		pst.setString(2,SalesDate);
		pst.setInt(3,SalesID);
        pst.executeUpdate();  
        
        %>
        
        <script>   
            alert("Record Updated");  
            window.location.replace(window.location.href);
       </script>
    <%             
    }
 
%>
 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Update</title> 
        
         <link href="style.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
    <%
    response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
    		if(session.getAttribute("Email") == null)
    		{
    			response.sendRedirect("index.jsp");
    		}
    	%>
        <div class="navbar">
  			<a href="viewManager.jsp">Home</a>
  			<a href="viewManager.jsp">Product Data</a>
  			<a href="sales.jsp">Sales Data</a>
  			
  			<a href="<%=request.getContextPath()%>/LogoutServlet" style="float:right">Logout</a>
		</div>
        
        <div class="main">
        <h1>Edit Product</h1>
        <div class="row">
            <div class="col-sm-4">
                <form  method="POST" action="#" >
                    
                    <%    
                         Connection con;
                        PreparedStatement pst;
                        ResultSet rs;
        
                        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
                           
                          String SalesID = request.getParameter("SalesID");
                          
                        pst = con.prepareStatement("select * from sales where SalesID = ?");
                        pst.setString(1, SalesID);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    
                    
                     <div alight="left">
                        <label class="form-label">Sales Quantity</label>
                        <input type=text class="form-control" placeholder="SalesQuantity" name="SalesQuantity" id="SalesQuantity" value="<%= rs.getInt("SalesQuantity")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Sales Date</label>
                        <input type="date" class="form-control" placeholder="SalesDate" name="SalesDate" id="SalesDate" value="<%= rs.getString("SalesDate")%>" required >
                     </div>
                     
                     
                     
                     
                     
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="sales.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  </div>
    </body>
</html>