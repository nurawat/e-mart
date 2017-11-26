<%@page import="java.sql.*"%>
<%@page import="com.emart.webinf.Constants"%>
<html>

<head>
	<title>E - Mart Login</title>

        <link href="../css/style.css" rel='stylesheet' type='text/css' />
        <link href="../css/choose.css" rel="stylesheet" type="text/css">
</head>
<body >
      <div class="heading" style="width:30%;
        position:relative;
        margin-left:35%;
        margin-top:1%;">
           	 <div class="heading_name">
                	<h3 >History </h3>
                 </div>            
      </div>   

    <a href="choose.html"><img style="position:fixed;left:30px;top:10px" src="../images/logo.png"/></a>
				 <!-----start-main---->
<div class="login-form"style="padding-top: 10px;margin: 1% auto 1% auto;">                               
					
    <form method="get" id="login_form"  action="choose.html" style="padding:5% 2.5em;">
 <table cellspacing="20" style="width:100%;text-align:center;padding:10" border="0" > 
        <tr>
         <th>Picture</th>
         <th>ID</th>
         <th>Name</th>
         <th>Price</th>
     </tr>
<%
 try
 {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement(); 
   
      
    String query = "select * from user_buy_list where email='"+Constants.email+"'";
    ResultSet resultset = stmt.executeQuery(query); 
    

    //resultset.next();
    while(resultset.next())
    {
 %>
 
    
                                   
                                  
  <tr style="background: #000">
         <td colspan="4"></td>
         
     </tr>
  
     <tr>
         <td>
             <img src="<%=resultset.getString("type")%>" width="60" height="60"/>
         </td>
         <td><%=resultset.getString("no")%></td>
         <td><%=resultset.getString("name")%></td>
         <td><%=resultset.getString("total")%></td>
     </tr>
    
                 
 <%     } 
 
 conn.close();}
 catch(Exception e)
 {
     out.println(e.getMessage());
 }
 %>        
 </table>
                                  
					 
                  <input type="submit" value="Go Back" style="width: 100%">              
                                  
            </form>
	</div>

</body>
</html>
