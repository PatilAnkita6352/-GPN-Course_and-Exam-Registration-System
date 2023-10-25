<%-- 
    Document   : RegistrarRegForm
    Created on : 27 Aug, 2018, 11:50:59 AM
    Author     : ADMIN
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css"> 
        <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
           <style>
            p{
                text-height: 20;
                
            }
            .field-icon
            {
                float:right;
                margin-left:-5px;
                margin-right:5px;
                margin-top:-16px;
                position:relative;
                z-index: 2;
                height:30px; 
                width:30px;
                
            }
        </style>  
        <title>Check registrar</title>
    </head>
    <body>
         <%  
            String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else
           {  
               %> <jsp:include page="../headerforallPanelviews.jsp"/><%
                   %><br><div class="container"><%try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                 boolean flag=HodCon.isRegistrarAvailable(uname);
                //System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+flag);
                if(flag==true)
                { 
                   response.sendRedirect("hodPanel.jsp?flag1=Sorry registrar already registered you can only change password for registrar..");   
                }
               else
                {
          %>
     

        <div class="container"><br>
            <h1>Register Registrar</h1>
            <br><hr>
         <form action="../../Controller/registrarReg.jsp" method="post">
             <div class="form-group">
                  <div class="row">
                        <div class="col-sm-3">
                            Username : <input type="text" name="username"  id="username-field" class="form-control" placeholder="Username" required oninvalid="this.setCustomValidity('username is required.')"
                            oninput="this.setCustomValidity('')">
                              </div>
                    </div>
             </div>
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-3">
                            Password : <input type="password" name="password"  id="password-field1" class="form-control" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')">
                            <span toggle="#password-field1" class="field-icon toggle-password1"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                        </div>
                    </div>
             </div>

            <button class="btn btn-primary">Submit</button>
            
        </form>
            <script type="text/javascript">//script for new password
            
                        $(".toggle-password1").click(function(){
                            $(this).toggleClass("fa-eye fa-eye-slash");
                            var input=$($(this).attr("toggle"));
                            if(input.attr("type")=="password"){
                                input.attr("type","text");
                            }else
                            {
                                input.attr("type","password");
                            }

                        });
                    </script>
        </div>
        <%@include file="../../footer.jsp" %>
        <% }} %>
    </body>
</html>
