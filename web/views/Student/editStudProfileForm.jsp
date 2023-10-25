
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="java.util.ListIterator"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Student Profile</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
            <script src="../../assets/js/jquery1.min.js"></script>
            <script src="../../assets/js/bootstrap1.min.js"></script>
             <style>
                   p{
                       text-height: 20;

                   }
               </style>
    </head>
    <body>
       
        <%
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
            else
            {   %>
                <jsp:include page="../headerforallPanelviews.jsp"/>
        <%
                String uname =(String)session.getAttribute("stud_uname");
                
                List li=StudCon.editStudProfile(uname);
                Student_data sd = new Student_data();
                sd=(Student_data)li.get(0);
        %>
        
        <h2>Edit Student Profile</h2><hr>
        <form action="../../Controller/editStudProfile.jsp" method="post">
            Roll no : <input type="number" name="rollno" value="<%=sd.getRollno()%>" disabled>
            <br><br>
            Name : <input type="text" size="25" name="s_name" value="<%=sd.getS_name()%>" disabled>
            <br><br>
            Phone no. : <input type="text" name="phone_no" value="<%=sd.getPhone_no()%>" required pattern=".{10}" oninvalid="this.setCustomValidity('Phone number must be of 10 characters.')" oninput="this.setCustomValidity('')">
          <br><br>
            Username : <input type="text" name="username" value="<%=sd.getUsername()%>" disabled>
            <br><br>
            Programme : <input type="text" name="programme" value="<%=sd.getProgramme()%>" disabled>
            <br><br>
            Email : <input type="email" size="25" name="s_email" value="<%=sd.getS_email()%>" required pattern="[^ @]+@[^ @]+\.[a-zA-z]{2,6}" oninvalid="this.setCustomValidity('Email is not in the proper format.')"
                    oninput="this.setCustomValidity('')"   >
            <br><br>
            
           <!-- <input type="hidden" name="id" value="<%--=sd.getId()--%>">-->
            
            <button class="btn btn-primary" >Update</button>  
        </form>
              
        <% } %>
        
    </body>
</html>
