<%-- 
    Document   : registration_form
    Created on : Jul 27, 2018, 12:57:16 AM
    Author     : sarvadnya
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Register</title>
    </head>
    <body>
        
        <!-- This form is not in use -->
        
        <%if(session.getAttribute("uname")==null || session.getAttribute("user")==null){
            response.sendRedirect("../index.jsp");
        }else{
        %>
       <form action="../Controller/studReg.jsp" method="post">
            Roll no : <input type="number" name="rollno">
            <br><br>
            name : <input type="text" name="s_name">
            <br><br>
            Date of Birth : <input type="date" name="dob"/>
            <br><br>
            Phone no. : <input type="number" name="phone_no"/>
            <br><br>
            Username : <input type="text" name="username">
            <br><br>
            Password : <input type="password" name="password">
            <br><br>
            Branch : <input type="text" name="programme">
            <br><br>
            Email : <input type="text" name="s_email"><br><br>
            <br><br>
            <input type="submit" value="submit">  
        </form>
       <%}
       %>
    </body>
</html>
