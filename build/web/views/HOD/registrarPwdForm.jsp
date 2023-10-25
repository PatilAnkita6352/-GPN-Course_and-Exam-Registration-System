<%-- 
    Document   : setRegistrarPwd
    Created on : Aug 26, 2018, 10:00:29 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Set Registrar password</title>
      
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
        
    </head>
    <body>
         <%  
            String name=((String)session.getAttribute("hod_uname"));
            if(name.equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else
           { 
               %> <jsp:include page="../headerforallPanelviews.jsp"/> <%
                 boolean flag=HodCon.isRegistrarAvailable(name);
                //System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"+flag);
                if(flag==false)
                { 
                   response.sendRedirect("hodPanel.jsp?flag1=Sorry, You should first register registrar");   
                }
                
                 else
                {
                     %>

                     <div class="container"><br>
                         <%try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div>
                         <h1>Set password for Registrar</h1><br>
                     <form action="../../Controller/setRegistrarPwd.jsp" method="post">
                         <div class="form-group">
                          <div class="row">
                              <div class="col-sm-3">
                                Enter Password for registrar : <input type="password" name="registrar_pwd" id="password-field" class="form-control"placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')">
                                <span toggle="#password-field" class="field-icon toggle-password"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                                 </div>
                           </div>
                        </div>
                                <button class="btn btn-primary">Change</button>
                     </form>
                     <script type="text/javascript">//script for new password
            
                        $(".toggle-password").click(function(){
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
                     <%@include file="../../footer.jsp" %>
               <% }
            } %>
                     </div>
              
        
    </body>
</html>
