<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sales Report</title>
        <link rel="stylesheet" type="text/css" href="style.css">
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdn.datatables.net/buttons/1.4.2/css/buttons.dataTables.min.css">
        
      
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
        <br>
        <br>
        <div class="main">
            
                <form  method="POST" action="#" class="form_pvs"> 
                <div class = "row">
                   
                    
                     
                        <label class="form-label">Date from:</label>
                        <input type="date" class="form-control" placeholder="SalesDate1" name="SalesDate1" id="ExpiryDate1" required >
                     
                     	<label class="form-label">Date To:</label>
                        <input type="date" class="form-control" placeholder="SalesDate2" name="SalesDate2" id="SalesDate2" required >
                     </div>
                     
                     <br>
                     <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                         <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
                         
                </form>
                <br><br>
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
								
                             </tr>  
                             </thead>
                             <tbody>
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
                                
                                  String query = "SELECT SalesID, Sales.ProductID, Name, Category, City, SalesQuantity, Price, TotalPrice, SalesDate FROM sales LEFT JOIN Product ON Product.ProductID=sales.ProductID where SalesDate between ? and ?";
                                  PreparedStatement st = con.prepareStatement(query);
                                  String SalesDate1 = request.getParameter("SalesDate1");
                                  String SalesDate2 = request.getParameter("SalesDate2");
                                  st.setString(1,SalesDate1);
                                  st.setString(2,SalesDate2);
                                  
                                    rs =  st.executeQuery();
                                    
                                        while(rs.next())
                                        {
                                           
                                   %>
             
                             <tr>
                                 <td><%=rs.getInt("SalesID") %></td>
                                 <td><%=rs.getInt("ProductID") %></td>
    							 <td><%=rs.getString("Name") %></td>
        					      <td><%=rs.getString("Category") %></td>
        						     <td><%=rs.getString("City") %></td>
            						 <td><%=rs.getInt("SalesQuantity") %></td>
            						 <td><%=rs.getDouble("Price") %></td>
            						 <td><%=rs.getDouble("TotalPrice") %></td>
            						 <td><%=rs.getString("SalesDate") %></td>
                             </tr> 
                             
                             
                                <%
                                 
                                 }
                               %>
                             </tbody>
                     </table>    
                 </div>

            </div>  
</div>
  
       <script type="text/javascript" src= "https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript" src= "https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/dataTables.buttons.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.32/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.html5.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/buttons/1.4.2/js/buttons.print.min.js"></script>
 
<script type="text/javascript">
    $(document).ready(function() {
    $('#example').DataTable( {
    	orientation:'p',
        dom: 'Bfrtip',
        buttons: [
            'copy', 'csv', 'excel', 'pdf', 'print'
        ]
    
    } );
} );
   </script>
    </body>
    
</html>