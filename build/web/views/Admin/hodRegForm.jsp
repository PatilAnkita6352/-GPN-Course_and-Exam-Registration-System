<%-- 
    Document   : hod_reg_form
    Created on : Jul 27, 2018, 1:43:37 AM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>HOD Register</title>
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
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null){
                response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
            { %>
     <jsp:include page="../headerforallPanelviews.jsp"/>
        <div class="container">
            <% 
            try{
            if(!(request.getParameter("result").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><a href="#" class="close" data-dismiss="alert">&times;</a><%= request.getParameter("result")%></p></div></div>
            <%}
               }catch(Exception e){}
                try{
                if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%=request.getParameter("failResult")%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %><br></div>
        <h1>HOD Registration</h1>
       <form action="../../Controller/hodReg.jsp" method="post"> 
            First name: <input type="text" name="fname"  pattern="[A-Za-z]{1,50}" required oninvalid="this.setCustomValidity('First name should be contain one upper case or one lower case letter.')"
                              oninput="this.setCustomValidity('')">
            <br><br>
            Last name : <input type="text" name="lname" pattern="[A-Za-z]{1,50}" required oninvalid="this.setCustomValidity('Last name should be contain one upper casr or one lower case letter.')"
                              oninput="this.setCustomValidity('')" />
            <br><br>
            Username : <input type="text" name="username" required oninvalid="this.setCustomValidity('Username is required.')"
                              oninput="this.setCustomValidity('')" >
            <br><br>
            Password : <input type="password" name="password" pattern="[^(?=[^\d_].*?\d)\w(\w|[!@#$%])]{6,}" required oninvalid="this.setCustomValidity('password should start with letter and it contain one special symbol and one special character and it should be 8 character long.')"
                              oninput="this.setCustomValidity('')" >
            <br><br>
            Education : <input type="text" name="education" required oninvalid="this.setCustomValidity('Education is required.')"
                              oninput="this.setCustomValidity('')" >
            <br><br>
            Programme : <select name="programme" required oninvalid="this.setCustomValidity('Programme is required.')"
                              oninput="this.setCustomValidity('')" >
                           <option value="CE">CE</option>
                            <option value="CM">CM</option>
                            <option value="Ddgm">DDGM</option>
                            <option value="EE">EE</option>
                            <option value="E&TC">E&TC</option>
                            <option value="IF">IF</option>
                            <option value="IDD">IDD</option>
                            <option value="ME">ME</option>
                            <option value="PE">PE</option>
                            <option value="AE">AE</option>
                            </select>
            <br><br>
            Shift :<select name="shift" required oninvalid="this.setCustomValidity('Shift is required.')"
                              oninput="this.setCustomValidity('')" >
                <option value="1">1</option>
                <option value="2">2</option>
                    </select><br><br>
            <input type="submit" class="btn btn-primary" value="Register">
       </form>
       <%}%>
    </body>
</html>
