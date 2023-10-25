<%-- 
    Document   : notice
    Created on : Mar 3, 2019, 4:40:47 PM
    Author     : Rutuja Nikum
--%>
<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
          <style>
            p{
                text-height: 20;
                
            }
        </style>
        <title>Notice</title>
    </head>
    <body>
       <%
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {    
              %>
              <jsp:include page="../headerforallPanelviews.jsp"/>
              <br><div class="container"><%
             String result=request.getParameter("result");
            try{
            if(!result.equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(result);%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
             
            Admin_data ad=AdminCon.getAdminInfo();
        %></div>
         
          
          <div class="container">
              <h1>Update Notice</h1><br>
              <form method="POST">
                  <label>Notice : </label><br><textarea cols="40" name="notice" required><%=ad.getNotice()%></textarea>
             <br><br>
             <button class="btn btn-primary" formaction="../../Controller/notice.jsp?flag=update">Update Notice</button><br><br>
             
              
          </form>
              
              <form method="POST">
                  
             <button class="btn btn-danger" formaction="../../Controller/notice.jsp?flag=delete">Delete Notice</button>
              
          </form>
          </div>
        <%}%>
    </body>
</html>
