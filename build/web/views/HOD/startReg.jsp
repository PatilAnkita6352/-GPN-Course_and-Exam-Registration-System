<%-- 
    Document   : startReg
    Created on : Dec 25, 2018, 12:02:15 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Start Registration By HOD</title>
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
    </head>
    <body>
        <%  
            String name=((String)session.getAttribute("hod_uname"));
            try{
            if(!name.equals(null))
            {
               
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
                
            
       <h1>Start Course Registration</h1>
        <br><br>
        <form action="../../Controller/startStopReg.jsp" method="POST">
            <label>Term</label>
        <select name="term">
            <option value="ODD">ODD</option>
            <option value="EVEN">EVEN</option>
        </select>
            &nbsp;&nbsp;&nbsp;
            <label>Year</label>
        <select name="year">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
        </select>&nbsp;&nbsp;&nbsp;   
        <button class="btn btn-primary" id="start" name="ctrlBtn" value="start">Start</button>&nbsp;&nbsp;&nbsp;
        <button class="btn btn-danger" id="stop" name="ctrlBtn" value="stop">Stop</button>
        </form>
        <%
            }
        }catch(Exception e){
            response.sendRedirect("../../index.jsp");}
        %>
    </body>
</html>
