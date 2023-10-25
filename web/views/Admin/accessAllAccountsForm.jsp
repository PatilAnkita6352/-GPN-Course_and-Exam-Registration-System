<%-- 
    Document   : accessAllAccountsForm
    Created on : Mar 3, 2019, 5:06:38 PM
    Author     : User
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Access all accounts</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css"> 
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
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
        
        <div class="container">
            <div class="row"> 
              <%  try{
                if(!(request.getParameter("failResult").equals(null))){%>
            <div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%=request.getParameter("failResult")%></p></div>
            <%}}catch(Exception e){}%><br><br></div>
                
            <div class="row">
                <div class="col-lg-8">
                <h1>Access Accounts</h1>
                </div>
            </div>
            
            <div class="row">
            <div class="col-lg-4"><br><br> 
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>HOD Login</h3>
                       </div>
                       <div class="panel-body">
                           
                           <form method="POST">
                               Programme :  <select name="programme">
                                <option value="CE">CE</option>
                                <option value="CM">CM</option>
                                <option value="Ddgm">DDGM</option>
                                <option value="EE">EE</option>
                                <option value="E&TC">E&TC</option>
                                <option value="IF">IF</option>
                                <option value="IDD">IDD</option>
                                <option value="ME">ME</option>
                                <option value="PS">PE</option>
                                <option value="AE">AE</option>
                               </select> <br><br>

                            Shift :  <select name="shift">
                                <option value="1">1</option>
                                <option value="2">2</option> 
                            </select>    <br><br>
                                <button class="btn btn-primary" formaction="../../Controller/accessAllAccounts.jsp?user=hod">Login as HOD</button>
                         </form>
                       </div>
                    </div>
                    </div>
            <br><br>
            
            <!--REGISTRAR-->
            
            <div class="col-lg-4">
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>Registrar Login</h3>
                       </div>
                       <div class="panel-body">
                           <form method="POST">
                               Programme :  <select name="programme">
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
                               </select><br><br>

                            Shift :  <select name="shift">
                                <option value="1">1</option>
                                <option value="2">2</option> 
                            </select>  <br><br>  
                                <button class="btn btn-primary" formaction="../../Controller/accessAllAccounts.jsp?user=registrar">Login as Registrar</button>
                         </form>
                       </div>
                    </div>
                    </div>
            
            
            <!--STUDENT-->
            <div class="col-lg-4">
                    <div class="panel panel-primary">
                       <div class="panel-heading">
                               <h3>Student Login</h3>
                       </div> 
                       <div class="panel-body">
                           <form method="POST">
                               Enter roll number :  <input type="text" name="rollno" required><br><br>
                                <button class="btn btn-primary" formaction="../../Controller/accessAllAccounts.jsp?user=student">Login as Student</button>
                                <br><br>
                         </form>
                       </div>
                    </div>
                    </div>
            </div>
        </div>
            
            <% }%>
    </body>
</html>
