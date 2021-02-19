<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
    	//int ProductID = Integer.parseInt(request.getParameter("ProductID"));
        String Name = request.getParameter("Name");
        String GenericName = request.getParameter("GenericName");
        String Category = request.getParameter("Category");
        String City = request.getParameter("City");
        int Quantity = Integer.parseInt(request.getParameter("Quantity"));
        double Price = Double.parseDouble(request.getParameter("Price"));
        String ManufactureDate = request.getParameter("ManufactureDate");
        String SupplyDate = request.getParameter("SupplyDate");
        String ExpiryDate = request.getParameter("ExpiryDate");
        
        Connection con;
        PreparedStatement pst;
        ResultSet rs;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
        pst = con.prepareStatement("insert into Product(Name,GenericName, Category,City,Price,Quantity,ManufactureDate,SupplyDate,ExpiryDate) values(?,?,?,?,?,?,?,?,?)");
        
       
        pst.setString(1,Name);
		pst.setString(2,GenericName);
		pst.setString(3,Category);
		pst.setString(4,City);
		pst.setInt(5, Quantity);
		pst.setDouble(6, Price);
		pst.setString(7,ManufactureDate);
		pst.setString(8,SupplyDate);
		pst.setString(9,ExpiryDate);
		pst.executeUpdate();
    
        
		
        
        %> 
    <script>   
        alert("Record Added"); 
        window.location.replace(window.location.href);
    </script> 
    <%             
    }
   %>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Data</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.22/css/jquery.dataTables.min.css">
	<script type="text/javascript" language="javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" language="javascript" src="https://cdn.datatables.net/1.10.22/js/jquery.dataTables.min.js"></script>
	<script>$(document).ready(function() {
    $('#example').DataTable( {
        "order": [[ 3, "desc" ]]
    } );
} );</script>
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
  			
  			
  			<a href="<%=request.getContextPath()%>/LogoutServlet" style="float:right">Logout</a>
  			<a href="viewManager.jsp">Home</a>
  			<a href="viewManager.jsp">Product Data</a>
  			<a href="sales.jsp">Sales Data</a>
  			<a style="float:right">Welcome ${Email}</a>
		</div>
        <br>
        <br>
        <div class="main">
            <h2>Add Sales</h2>
                <form  method="POST" action="#" class="form_pvs"> 
                <div class = "row">
                    
                       <div class="column">
                    
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" placeholder="Name" name="Name" id="Name" required >
                     
                        <label class="form-label">Generic Name</label>
                        <input type="text" class="form-control" placeholder="Generic Name" name="GenericName" id="GenericName" required >
                     
                         
                        <label class="form-label">Category</label>
                        <input type="text" class="form-control" placeholder="Category" name="Category" id="Category" required >
                    
                     </div>
                     <div class="column">
                     
                        <label class="form-label">City</label>
                        <input type="text" class="form-control" placeholder="City" name="City" id="City" required >
                        
                        <label class="form-label">Quantity</label>
                        <input type="number" class="form-control" placeholder="Quantity" name="Quantity" id="Quantity" required >
                     
                        <label class="form-label">Price</label>
                        <input type="number" class="form-control" placeholder="Price" name="Price" id="Price" required >
                     
                        
                     
                     </div>
                     <div class="column">
                     
                        <label class="form-label">Manufacture Date</label>
                        <input type="date" class="form-control" placeholder="Manufacture Date" name="ManufactureDate" id="ManufactureDate" required >
                     
                        <label class="form-label">Supply Date</label>
                        <input type="date" class="form-control" placeholder="SupplyDate" name="SupplyDate" id="SupplyDate" required >
                     
                        <label class="form-label">Expiry Date</label>
                        <input type="date" class="form-control" placeholder="Expiry Date" name="ExpiryDate" id="ExpiryDate" required >
                     
                        
                         </div>
                          
                    
                    
                     

                          
                     </div>
                     <br><br><br><br><br>
                     
                         <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                         
                         <br><br>	
             <h2>Reports:</h2>
                  <div class = "column">
           <input type="button" onclick="location.href='report.jsp';" value="Quantity Report" />
           </div>
           <div class = "column">
           <input type="button" onclick="location.href='reportExpiry.jsp';" value="Product Expiry Report" />
           </div>
           <div class = "column">
           <input type="button" onclick="location.href='salesReport.jsp';" value="Sales Report" />
           </div>
                         
                </form>
                
           
            <br>
            <br>
            <br>
             <div class="col-sm-8">
                 <div class="panel-body">
                     <table id="example" class="display" style="width:100%">
                         <thead>
                             <tr>
                             	<th>Product ID</th>
								<th>Name</th>
								<th>Generic Name</th>
								<th>Category</th>
								<th>City</th>
								<th>Quantity</th>
								<th>Price</th>
								<th>Manufacture Date</th>
								<th>Supply Date</th>
								<th>Expiry Date</th>
								<th>Edit</th>
								<th>Delete</th>
                             </tr>  
                             </thead>
                             <tbody>
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
                                
                                  String query = "select * from Product";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                        	String ProductID = rs.getString("ProductID");
                                            %>
                      
                                      <tr>
                                          <td><%=rs.getInt("ProductID") %></td>
             							 <td><%=rs.getString("Name") %></td>
                 						 <td><%=rs.getString("GenericName") %></td>
                 					      <td><%=rs.getString("Category") %></td>
                 						     <td><%=rs.getString("City") %></td>
                     						 <td><%=rs.getInt("Quantity") %></td>
                     						 <td><%=rs.getDouble("Price") %></td>
                     						 <td><%=rs.getString("ManufactureDate") %></td>
                     						 <td><%=rs.getString("SupplyDate") %></td>
                     						 <td><%=rs.getString("ExpiryDate") %></td>
                                          <td><a href="Update.jsp?ProductID=<%=ProductID%>">Edit</a></td>
                                          <td><a href="delete.jsp?ProductID=<%=ProductID%>">Delete</a></td>
                                      </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             </tbody>
                     </table>    
                 </div>

            </div>  
</div>
<script>
      function scroller() {
    	  $(".smooth").on("scroll", function() {
    	    let scrollPos = $(this).scrollTop();
    	    $(".parallax").css({
    	      top: scrollPos / 2 + "px",
    	      opacity: 1 - scrollPos / 200
    	    });
    	  });
    	}
    	scroller();
    	/* When the user clicks on the button, 
    	toggle between hiding and showing the dropdown content */
    	
      </script>

    </body>
    
</html>