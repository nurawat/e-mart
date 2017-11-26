<%-- 
    Document   : signup_parser
    Created on : Nov 4, 2016, 8:11:41 AM
    Author     : Arun Rawat
--%>


<%@page import="java.sql.*"%>
<%@page import="com.emart.webinf.Constants"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <%
         String ema=request.getParameter("email");
         String pas=request.getParameter("password");
         String nam=request.getParameter("uname");
         String add=request.getParameter("add");
         String pno=request.getParameter("pno");
    %>
    <head>
       
    </head>
    
    <body>
        <h1>
        <%
         try
        {
         
         Class.forName("oracle.jdbc.driver.OracleDriver");
         Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
         Statement stmt = conn.createStatement();         
         String query = "select * from arsh_users where email='"+ema+"'";       
        
         int i=stmt.executeUpdate(query);
         if (i==0) 
         {
           
             Constants.err="Successfully Registered !!!";           
         
             query="insert into arsh_users values('"+ema+"','"+pas+"','"+nam+"','"+pno+"','"+add+"')";
             
             stmt.executeQuery(query);
             Constants.last="../../index.html";
             response.sendRedirect("error.jsp");
          
          }
         else 
         {
            //JOptionPane.showMessageDialog(null, "Wrong Username/Password");
          
            Constants.err="Wrong Username or Password";
            Constants.last="signup.html";
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
