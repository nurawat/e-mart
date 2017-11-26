<%-- 
    Document   : login_parser
    Created on : Nov 4, 2016, 5:07:35 AM
    Author     : Arun Rawat
--%>


<%@page import="java.sql.*"%>
<%@page import="com.emart.webinf.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%
         String ema=request.getParameter("email");
         String pas=request.getParameter("password");
    %>
    <head>
       
    </head>
    
    <body onload="a()">
        <h1>
        <%
         try
        {
         String email=request.getParameter("email");
         String pass=request.getParameter("password");
         
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
         Statement stmt = conn.createStatement();         
         String query = "select * from arsh_users where email='"+ema+"' and password='"+pas+"'";       
        
         int i=stmt.executeUpdate(query);
         if (i > 0) 
         {
           
             Constants.email=email;
             response.sendRedirect("choose.html");
          
          }
         else 
         {
            //JOptionPane.showMessageDialog(null, "Wrong Username/Password");
          
            Constants.err="Wrong Username or Password";
            Constants.last="../../index.html";
            response.sendRedirect("error.jsp");
         }
       
         conn.close();
         //response.sendRedirect("error.jsp?msg="+"No Such User Exists !!!&dest=../../index.html");
        }
            catch(Exception e)
            {
                out.println(e.getMessage());
            }
       
        %>
        </h1>
    </body>
    
</html>
