<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
 
<% 
    if(request.getParameter("submit")!=null)
    {
    	int ProductID = Integer.parseInt(request.getParameter("ProductID"));
        String Name = request.getParameter("Name");
        String GenericName = request.getParameter("GenericName");
        String Category = request.getParameter("Category");
        String City = request.getParameter("City");
        String Quantity = request.getParameter("Quantity");
        double Price = Double.parseDouble(request.getParameter("Price"));
        String ManufactureDate = request.getParameter("ManufactureDate");
        String SupplyDate = request.getParameter("SupplyDate");
        String ExpiryDate = request.getParameter("ExpiryDate");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
        pst = con.prepareStatement("update Product set Name = ?, GenericName = ?, Category = ?, City = ?, Quantity = ?,Price = ?,  ManufactureDate = ?, SupplyDate = ?, ExpiryDate = ? where ProductID = ?");
        pst.setString(1,Name);
		pst.setString(2,GenericName);
		pst.setString(3,Category);
		pst.setString(4,City);
		pst.setString(5, Quantity);
		pst.setDouble(6, Price);
		pst.setString(7,ManufactureDate);
		pst.setString(8,SupplyDate);
		pst.setString(9,ExpiryDate);
		pst.setInt(10, ProductID);
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
        <title>Product Update</title> 
        
         <link href="style.css" rel="stylesheet" type="text/css"/>
        
        
        
    </head>
    <body>
    	<%
    		if(session.getAttribute("Email") == null)
    		{
    			response.sendRedirect("index.jsp");
    		}
    	%>
        <div class="navbar">
  			<a href="viewEmployee.jsp">Home</a>
  			
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
                           
                          String ProductID = request.getParameter("ProductID");
                          
                        pst = con.prepareStatement("select * from Product where ProductID = ?");
                        pst.setString(1, ProductID);
                        rs = pst.executeQuery();
                        
                         while(rs.next())
                         {
                    
                    %>
                    <div alight="left">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Name" value="<%= rs.getString("Name")%>" name="Name" id="Name" required >
                     </div>
                         
                    <div alight="left">
                        <label class="form-label">Generic Name</label>
                        <input type="text" class="form-control" placeholder="GenericName" name="GenericName" value="<%= rs.getString("GenericName")%>" id="GenericName" required >
                     </div>
                         
                     <div alight="left">
                        <label class="form-label">Category</label>
                        <input type="text" class="form-control" placeholder="Category" name="Category" id="Category" value="<%= rs.getString("Category")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">City</label>
                        <input type="text" class="form-control" placeholder="City" name="City" id="City" value="<%= rs.getString("City")%>" required >
                     </div>
                     <div alight="left">
                        <label class="form-label">Quantity</label>
                        <input type=text class="form-control" placeholder="Quantity" name="Quantity" id="Quantity" value="<%= rs.getInt("Quantity")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Price</label>
                        <input type="text" class="form-control" placeholder="Price" name="Price" id="Price" value="<%= rs.getDouble("Price")%>" required >
                     </div>
                     
                     
                     
                     <div alight="left">
                        <label class="form-label">Manufacture Date</label>
                        <input type="date" class="form-control" placeholder="ManufactureDate" name="ManufactureDate" id="ManufactureDate" value="<%= rs.getString("ManufactureDate")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Supply Date</label>
                        <input type="date" class="form-control" placeholder="SupplyDate" name="SupplyDate" id="SupplyDate" value="<%= rs.getString("SupplyDate")%>" required >
                     </div>
                     
                     <div alight="left">
                        <label class="form-label">Expiry Date</label>
                        <input type="date" class="form-control" placeholder="ExpiryDate" name="ExpiryDate" id="ExpiryDate" value="<%= rs.getString("ExpiryDate")%>" required >
                     </div>
                     
                     
                     
                    
                    <% }  %>
                    
                    
                    
                         </br>
                         
                     <div alight="right">
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                     </div>  
                         
                         <div align="right">
                             
                             <p><a href="viewEmployee.jsp">Click Back</a></p>
                             
                             
                         </div>
  
                </form>
            </div>          
        </div>
  </div>
    </body>
</html>