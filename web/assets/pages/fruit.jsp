<%@page import="java.sql.*"%>
<%@page import="com.emart.webinf.Constants"%>
<html>
	<head>
    	<title>Fruit Market</title>
        <link rel="stylesheet" type="text/css" href="../css/fruit.css"/>
        <link  rel="stylesheet" type="text/css" href="../css/choose.css"/>
        
        <script>
            
            function linkGenerator(x)
            {
                window.location="add_to_cart_fruit.jsp?product="+x;
            }
        </script>
            
        
        
  	</head>
    <body> 
            <a href="choose.html"> 
            <div style="position:relative;background: fixed">
            <img src="../images/logo.png" style="position:fixed"/>         
            </a>
         </div>	   
        <centre>
         <div class="heading" style="width:60%;position:relative;margin-left:35%;margin-top:1%;">
           	 <div class="heading_name">
                	<h3 >fruits </h3>
                 </div>
             <a style="float:right;position:fixed;right:1%;top:2%" href="history.jsp">
                   <img src="../images/cart.png" height="80" width="80"/>
              </a>
	 </div>
        </centre>
            
            
<%
 
    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "123");
    Statement stmt = conn.createStatement();
     
    String fname,pic;
    int no;
    float price;
      
    String query = "select * from fruits";
    
 %>                   
        </div>
    	  <div class="content"><br>
            <div class="items">
              <ul onClick="linkGenerator(hello)">
    <%
    ResultSet resultset = stmt.executeQuery(query); 
    
    while(resultset.next())
    {
        no=Integer.parseInt(resultset.getString("no"));
        fname=resultset.getString("name");
        price=Integer.parseInt(resultset.getString("price"));   
        pic=resultset.getString("pic");
        
    %>
              <!--List -->
                <li>
                    <div class="image"> 
                 	 <a href="#">
                  	<img onClick="linkGenerator(<%=no%>)" 
                             src="<%=pic%>"                             
                             height="260" width="200" alt="">
                  	</a> 
                    </div><br> 
                    <center> 
                        <hr><br/>
                        <table style="width:90%">
                        	<tr >
                                    <th style="text-align:left">#No. &nbsp;&nbsp;&nbsp; :</th>
                                  <td><%=no%></td>
                                </tr>
                                
                        	<tr>
                                   <th style="text-align:left">Name &nbsp; :</th>
                                   <td><%=fname%></td>
                                 </tr>  
                                <tr>
                                    <th style="text-align:left">Price &nbsp;&nbsp;&nbsp;:</th>
                                    <td>Rs. <%=price%></td>
                                </tr> 
                        </table> 
                    </center>
                </li>                 
    <%
    } 
    conn.close();
    %>           
                <!--List-->
              </ul>
            </div>
          </div>
    </body>
	
</html>