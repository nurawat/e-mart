<%@page import="java.sql.*"%>
<html>
<head>
<title>E-Mart</title>
<link rel="stylesheet" type="text/css" href="../css/style.css"/>
<%String no=request.getParameter("product");%>


<script>
    function goback()
    {
        window.location="choose.html";
    }
</script>

</head>
<body >
    <div style="position:relative;background: fixed">
            <a href="choose.html">
            <img src="../images/logo.png" style="position:fixed"/>    
            </a>
            
         </div>	 
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
       
%>  

    <div class="login-form" style="width:35%">            
            
            <table cellspacing="10" style="width:100%;text-align:left;padding:10" border="0" >
                <form method="post" id="cart" action="add_to_cart_veggie_full.jsp?no=<%=no%>">
                <tr>
                    <td ><img src="<%=resultset.getString("pic")%>" width="240" height="240"/></td>
                    <td style="width:200"><h2><%=resultset.getString("name")%></h2>                   
                </tr>
                
                 <hr/>
               
                 <tr style="background: #000;padding-bottom:10;margin-left: 10">
                     <td colspan="2"> </td>
                 </tr>
  
    
                <tr style="padding-left: 10">
                    <td>Item No. :</td>
                    <td> <%=resultset.getString("no") %></td>
                </tr>
                
                <tr>
                    <td>Price :</td>
                    <td>Rs.<%=resultset.getString("price") %> /Kg.</td>
                </tr>
  <%
    }
    conn.close();
}catch(Exception e){out.println(e.getMessage());}
  
  %>              
                <tr>
                    <td>No. of Kg. </td>
                    <td>
                        <select id="no_of_kg" name="no_of_kg" style="margin: 0px;
                                                border: 1px solid #111;
                                                background: transparent;
                                                width: 100px;
                                                padding: 5px 35px 5px 5px;
                                                font-size: 16px;
                                                border: 1px solid #ccc;
                                                height: 30px;                                              
                                                appearance: none;">
                            <option value="1" >1</option>
                            <option value="2" >2</option>
                            <option value="3">3</option>
                            <option value="4">4</option>
                            <option value="5">5</option>
                        </select>
                    </td>
                </tr>
                
                <tr>
                    <td>Poly Bag</td>
                    <td>
                        <input type="radio" name="poly" value="yes" id="pb"/>YES
                        <input type="radio" name="poly" value="no" id="pb" checked/>NO  &nbsp;<b>(Rs.10)<b>
                    </td>
                </tr>
            
                <tr style="margin-top: 100px">
                    <td colspan="2">
                         <input type="button" value="Go Back" style="width: 45%" onclick="goback()">                     
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <input type="submit" value="Calculate" style="width: 45%" >
                    </td>
                </tr>
               </form> 
            </table>
     
       
      
    </div>
</body>
</html>
