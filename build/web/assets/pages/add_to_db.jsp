
<%@page import="java.sql.*"%>
<%@page import="com.emart.webinf.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
       <%
           String type=request.getParameter("p");
           String no=request.getParameter("no");
           String tot=request.getParameter("tot");
           String name=request.getParameter("name");
       %>
           
    </head>
    <body>
 
<%
try{
     Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
    
    String query = "insert into user_buy_list values('"+Constants.email+"','"+type+"','"+tot+"','"+no+"','"+name+"')";
    int i=stmt.executeUpdate(query);
    if(i > 0)
    if (i > 0) 
         {       
             Constants.err="Successfully Bought";
             Constants.last="choose.html";
             response.sendRedirect("error.jsp");
          
          }
         else 
         {
            //JOptionPane.showMessageDialog(null, "Wrong Username/Password");
          
            Constants.err="Something Went Wrong";
            Constants.last="choose.html";
            response.sendRedirect("error.jsp");
         }  
     
    
    conn.close();
}
catch(Exception e)
{
    out.println(e.getMessage());
}
%>  
        
        
    </body>
</html>
