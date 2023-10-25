
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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
            
             <h1>Curriculum Year</h1>
        <br><br>
        <form action="../../Controller/setCurriculum.jsp" method="POST">
            <label>Enter Curriculum Year:</label>
            <input type="number" name="curriculumyr" required oninvalid="this.setCustomValidity('Curriculum year required.')"
                                                                  oninput="this.setCustomValidity('')">
             <input type="submit" class="btn btn-primary" id="submitBtn" name="submit"> 
             
        </form>
        <%}
                %>
    </body>
</html>
