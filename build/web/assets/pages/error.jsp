

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.emart.webinf.Constants"%>
<!DOCTYPE html>
<html>
    <head>
       
        <title>Error Page</title>
        <link href="../css/style.css" rel='stylesheet' type='text/css' />
        <script type="text/javascript">
           function g()
           {
               window.location="<%=Constants.last%>";
              
           }
        </script>
    </head>
    <body>
        
        <div class="login-form">
            <div class="card" style="background: tomato">
                <h1 style="
                    text-align: center;
                    text-decoration: #4FC3F7;
                    text-decoration-style: wavy;
                    text-transform: initial;
                    color:#FFF">
                    <%=Constants.err%>
                </h1>
                <div  class="b" onClick="g();" style="width: 100%;text-align: center">  
                    Go Back</div>
            </form>                                  
	</div>
       
        
    </body>
</html>
