<%@page import="java.sql.*"%>
<html>
<head>
<title>E-Mart</title>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<%String no=request.getParameter("no");%>


<script>
    function goback()
    {
        window.location="choose.html";
    }
</script>

</head>
<body >
 <%
try{
     Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
    
    String query = "select * from vegetables where no='"+no+"'";
    ResultSet resultset = stmt.executeQuery(query); 
    
    //resultset.next();
    while(resultset.next())
    {
        float tot=Float.parseFloat(resultset.getString("price"));
        int nos=Integer.parseInt(request.getParameter("no_of_kg"));
        tot*=nos;
        String yn=request.getParameter("poly");
        if(yn.equalsIgnoreCase("yes"))
            tot+=10;
       
%>  
    <div class="login-form" style="width:35%">            
            
            <table cellspacing="10" style="width:100%;text-align:center;padding:10" border="0" >
                <form method="post" id="cart" action="add_to_db.jsp?tot=<%=tot%>&no=<%=resultset.getString("no")%>
                      &p=<%=resultset.getString("pic")%>
                      &name=<%=resultset.getString("name")%>">
                     <tr>
                    <td ><img src="<%=resultset.getString("pic")%>" width="240" height="240"/></td>
                    <td style="width:200"><h2><%=resultset.getString("name")%></h2>                   
                </tr>
                
                 <hr/>
               
                 <tr style="background: #000;padding-bottom:10;margin-left: 10">
                     <td colspan="2"> </td>
                 </tr>
                    <tr>
                        <td><h3>Total</h3> </td>
                        <td><h3><%=tot%></h3></td>
                    </tr>               
  <%
    }
    conn.close();
}catch(Exception e){out.println(e.getMessage());}
  
  %>              
                            
             
            
                <tr style="margin-top: 100px">
                    <td colspan="2">
                         <input type="button" value="Go Back" style="width: 45%" onclick="goback()">                     
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <input type="submit" value="Buy" style="width: 45%" >
                    </td>
                </tr>
               </form> 
            </table>
     
       
      
    </div>
</body>
</html>
