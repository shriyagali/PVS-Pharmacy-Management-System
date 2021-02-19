<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PVS IMS</title>
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
  			<a href="viewEmployee.jsp">Home</a>
  			<a style="float:right">Welcome ${Email}</a>
		</div>
        <br>
        <br>
        <div class="main">
            
                
                
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
                                 <td><a href="UpdateEmp.jsp?ProductID=<%=ProductID%>">Edit</a></td>
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