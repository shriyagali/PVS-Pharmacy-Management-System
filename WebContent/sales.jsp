<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<% 

    if(request.getParameter("submit")!=null)
    {
    	//int ProductID = Integer.parseInt(request.getParameter("ProductID"));
        int ProductID = Integer.parseInt(request.getParameter("ProductID"));
        int SalesQuantity = Integer.parseInt(request.getParameter("SalesQuantity"));
        double UnitPrice = Double.parseDouble(request.getParameter("UnitPrice"));
        double TotalPrice = Double.parseDouble(request.getParameter("TotalPrice"));
        String SalesDate = request.getParameter("SalesDate");
        
        Connection con;
        PreparedStatement pst, pst1, pst2;
        ResultSet rs;
        
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
        pst = con.prepareStatement("insert into sales(ProductID,SalesQuantity, SalesDate, UnitPrice, TotalPrice) values(?,?,?,?,?)");
        pst1 = con.prepareStatement("update product set Quantity = Quantity - ? where ProductID = ? ");
       
        pst.setInt(1,ProductID);
		pst.setInt(2,SalesQuantity);
		pst.setString(3,SalesDate);
		pst.setDouble(4, UnitPrice);
		pst.setDouble(5, TotalPrice);
		pst.executeUpdate();

		pst1.setInt(1,SalesQuantity);
        pst1.setInt(2,ProductID);
        pst1.executeUpdate();
        
        
		
        
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
		</div>
        <br>
        <br>
        <div class="main">
            <h2>Add Sales</h2>
                <form  method="POST" action="#" class="form_pvs"> 
                <div class = "row">
                    
                        <label class="form-label">Product ID</label>
                        <input type="number" class="form-control" placeholder="ProductID" name="ProductID" id="ProductID" required >
                     
                        <label class="form-label">Sales Quantity</label>
                        <input type="number" class="form-control" placeholder="SalesQuantity" name="SalesQuantity" id="SalesQuantity" required >
                     
                         
                        <label class="form-label">Sales Date</label>
                        <input type="date" class="form-control" placeholder="SalesDate" name="SalesDate" id="SalesDate" required >
                        
                        <label class="form-label">Unit Price</label>
                        <input type="text" class="form-control" placeholder="UnitPrice" name="UnitPrice" id="UnitPrice" required >
                        
                        <label class="form-label">Total Price</label>
                        <input type="text" class="form-control" placeholder="TotalPrice" name="TotalPrice" id="TotalPrice" required >
                    
                    
                     

                          
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
                             	<th>Sales ID</th>
                             	<th>Product ID</th>
								<th>Name</th>
								<th>Category</th>
								<th>City</th>
								<th>Sales Quantity</th>
								<th>Unit Price</th>
								<th>Total Price</th>
								<th>Sales Date</th>
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
                                
                                  String query = "SELECT SalesID, Sales.ProductID, Name, Category, City, SalesQuantity, UnitPrice, TotalPrice, SalesDate FROM sales LEFT JOIN Product ON Product.ProductID=sales.ProductID";
                                  Statement st = con.createStatement();
                                  
                                    rs =  st.executeQuery(query);
                                    
                                        while(rs.next())
                                        {
                                            String SalesID = rs.getString("SalesID");
                                   %>
             
                             <tr>
                                 <td><%=rs.getInt("SalesID") %></td>
                                 <td><%=rs.getInt("ProductID") %></td>
    							 <td><%=rs.getString("Name") %></td>
        					      <td><%=rs.getString("Category") %></td>
        						     <td><%=rs.getString("City") %></td>
            						 <td><%=rs.getInt("SalesQuantity") %></td>
            						 <td><%=rs.getDouble("UnitPrice") %></td>
            						 <td><%=rs.getDouble("TotalPrice") %></td>
            						 <td><%=rs.getString("SalesDate") %></td>
                                 <td><a href="UpdateSales.jsp?SalesID=<%=SalesID%>">Edit</a></td>
                                 <td><a href="delete.jsp?SalesID=<%=SalesID%>">Delete</a></td>
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