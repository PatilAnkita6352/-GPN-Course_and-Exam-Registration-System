<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title> 
       
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
    </head>
    <body>
        <%
            if(session.getAttribute("stud_uname")==null && session.getAttribute("stud_user")==null )
            {
                 response.sendRedirect("../../index.jsp");
            }
            else
            {   
          %>
         <jsp:include page="../headerforallPanelviews.jsp"/>
      
     
        <div class="container">
            <h2>Change Student Password</h2>
        <br>
                    <%
                       try{if(!request.getParameter("result").equals(null)){%><p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.println(request.getParameter("result"));%></p><%}}catch(Exception e){}                        
                       try{if(!request.getParameter("failResult").equals(null)){ %> <p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%= request.getParameter("failResult") %></p> <% }}catch(Exception e){} %>
                         
                <form action="../../Controller/changeStudPwdByStud.jsp" method="POST">
                    <div class="form-group">
                        <div class="row">
                           <div class="col-sm-3">     
                             Old Password: <input type="password" name="oldPwd" id="password-field1" class="form-control" placeholder="Password"  required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"/>
                               <!--br><br-->
                               <span toggle="#password-field1" class="field-icon toggle-password1"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                           </div>
                        </div>
                    </div>
                      <div class="form-group">
                        <div class="row">
                           <div class="col-sm-3"> 
                                New Password : <input type="password" name="newPwd1" id="password-field2" class="form-control" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                                <span toggle="#password-field2" class="field-icon toggle-password2"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                           </div>
                        </div>
                      </div>
                    <div class="form-group">
                        <div class="row">
                           <div class="col-sm-3"> 
                                Retype Password : <input type="password" name="newPwd2"id="password-field3" class="form-control" placeholder="Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')" />
                                <span toggle="#password-field3" class="field-icon toggle-password3"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                           </div>
                        </div>
                    </div>
                       
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>
	 
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
                    <script type="text/javascript">//script for new password
            
                        $(".toggle-password2").click(function(){
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
                    <script type="text/javascript">//script for new password
            
                        $(".toggle-password3").click(function(){
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
                    <%  
                  
            }//outer else closing
                    %>
        </div>
    </body>
</html>
