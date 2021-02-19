<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quantity Report</title>
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
                    <div class="column">
                    
                     
                        <label class="form-label">Quantity less than:</label>
                        <input type="number" class="form-control" placeholder="Quantity" name="Quantity" id="Quantity" required >
                     
                     </div>
                     
                          
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
                             	<th>Product ID</th>
								<th>Name</th>
								<th>Generic Name</th>
								<th>Category</th>
								<th>City</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Manufacture Date</th>
								<th>Supply Date</th>
								<th>Expiry Date</th>
								
                             </tr>  
                             </thead>
                             <tbody>
                             
                             <%   

                                Connection con;
                                PreparedStatement pst;
                                ResultSet rs;
        
                                Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
                                con = DriverManager.getConnection("jdbc:sqlserver://ids517.coo7k8kkfrdz.us-east-2.rds.amazonaws.com; databaseName=ids517","admin","ids5172020");
                                
                                  String query = "select * from Product where Quantity < = ?";
                                  PreparedStatement st = con.prepareStatement(query);
                                  String Quantity = request.getParameter("Quantity");
                                  System.out.println(Quantity);
                                  st.setString(1,Quantity);
                                  
                                    rs =  st.executeQuery();
                                    
                                        while(rs.next())
                                        {
                                           
                                   %>
             
                             <tr>
                                 <td><%=rs.getInt("ProductID") %></td>
    							 <td><%=rs.getString("Name") %></td>
        						 <td><%=rs.getString("GenericName") %></td>
        					      <td><%=rs.getString("Category") %></td>
        						     <td><%=rs.getString("City") %></td>
        						     <td><%=rs.getInt("Quantity") %></td>
            						 <td><%=rs.getString("Price") %></td>
            						 <td><%=rs.getString("ManufactureDate") %></td>
            						 <td><%=rs.getString("SupplyDate") %></td>
            						 <td><%=rs.getString("ExpiryDate") %></td>
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