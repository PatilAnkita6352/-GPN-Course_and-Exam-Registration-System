<%-- 
    Document   : controlReg
    Created on : Dec 24, 2018, 2:53:02 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Control Registration</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
        
        <script type="text/javascript">
           function onStartBtn() 
            {
                    document.getElementById('start').disabled=true;
                    document.getElementById('stop').disabled=false;
            }
             function onStopBtn() 
            {
                document.getElementById('start').disabled=false;
                document.getElementById('stop').disabled=true;
            }
            
        </script>
    </head>
    <body>
         <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {  
           response.setHeader("Cache-control","no-cache,no-store,must-revalidate");
         %>
      <jsp:include page="../headerforallPanelviews.jsp"/>
        <div class="container">
            <% 
            try{if(!(request.getParameter("result")).equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
            <%}
            }catch(Exception e){}
            
             try{if(!(request.getParameter("failResult")).equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
            }catch(Exception e){}
                
            %><br>
        <h1>Course Registration</h1>
        <br><br>
        <form action="../../Controller/startStopReg.jsp?user=admin" method="POST">
            <label>Term :</label>
        <select name="term" required>
            <option value="ODD">ODD</option>
            <option value="EVEN">EVEN</option>
        </select>
            &nbsp;&nbsp;&nbsp;
            <label>Year :</label>
            <input type="text" name="year" placeholder="21" required>&nbsp;&nbsp;&nbsp;   
        <button class="btn btn-primary" id="start" name="ctrlBtn" value="start">Start</button>&nbsp;&nbsp;&nbsp;
        <button class="btn btn-danger" id="stop" name="ctrlBtn" value="stop">Stop</button>
        </form>
            <%}
                %>
    </body>
</html>
        </div>
