
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Change Admin Password</title>
         <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
          <script src="../../assets/css/font-awesome.min.css"></script>
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
         <%  //session check 
        if(session.getAttribute("admin_uname").equals(null))
        { 
            response.sendRedirect("../../index.jsp");
        }
        else
        {
            %> <jsp:include page="../headerforallPanelviews.jsp"/> <%
       // String msg=request.getParameter("result");
    %>  
        
        <div class="container">
        <br>
        <h1>Change Your Password</h1><hr>
        <p class="text-danger"><% try{
            if(!(request.getParameter("failResult")).equals(null)){
            %> <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.println(request.getParameter("failResult"));}
    }catch(Exception e){} %></p>
        <form action="../../Controller/changeAdminPwd.jsp" method="POST" >
            <% 
            try{if(request.getParameter("flag").equals("forget"))
            {
                %>
                <label>Mother Name : </label>  <input type="text" name="motherName" placeholder="Mother Name" required pattern=".{2,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"
                              />
                       <br><br>
                <%
            }
            }
            catch(Exception e){
                %>
                <div class="form-group">
                            <div class="row">
                                <div class="col-sm-3">
                                <label> Old Password : </label><input type="password" name="oldPwd" id="password-field1" class="form-control" placeholder="old Password" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')"/>
                                <span toggle="#password-field1" class="field-icon toggle-password1"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                                <a href="changeAdminPwdForm.jsp?flag=forget">Forget Password</a>   
                                </div>
                           </div>
                        </div>
                                <!--a href="changeAdminPwdForm.jsp?flag=forget">Forget Password</a-->
                <%
            }        
                    %>
                      
                       
                       <div class="form-group">
                            <div class="row">
                                <div class="col-sm-3">
                                    <label>New Password :</label>
                                        <input type="password" name="newPwd1" id="password-field2" class="form-control" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')">
                                    <span toggle="#password-field2" class="field-icon toggle-password2"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                                   </div>
                           </div>
                        </div>
                        <div class="form-group">
                            <div class="row">
                                <div class="col-sm-3">
                                    <label>Retype  Password :</label>
                                    <input type="password" name="newPwd2" id="password-field3" class="form-control" required pattern=".{6,}" oninvalid="this.setCustomValidity('Password must be of 6 characters.')" oninput="this.setCustomValidity('')">
                                    <span toggle="#password-field3" class="field-icon toggle-password3"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                                    <br>
                                </div>
                           </div>
                        </div>
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>
                       
</form> 
         <%  
            }
         %>
        </div>
        </div>
        </div>
        <%@include file="../../footer.jsp" %>
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
        <script type="text/javascript">// script for retype password
            
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
        
        <script type="text/javascript">// script for retype password
            
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
    </body>
</html>
