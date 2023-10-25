<%-- 
    Document   : changeHodPwdFormByAdmin
    Created on : 4 Mar, 2019, 9:55:04 AM
    Author     : ADMIN
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change HOD Password By Admin</title>
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
            if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
           {    
              
          %>   
       <jsp:include page="../headerforallPanelviews.jsp"/>
        <%  try{
            if(!request.getParameter("failResult").equals(null))%> 
            <p class=" alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p>
        <%}catch(Exception e){}%>
        <form method="POST" action="../../Controller/changeHodPwd.jsp">
            <div class="form-group">
                <div class="row">
                    <div class="col-sm-3">
                        <label>New Password For Hod</label>: <input type="password" name="newHodPwd" id="password-field" class="form-control"pattern=".{6,}" required oninvalid="this.setCustomValidity('Password must be of 6 characters.')"
                              oninput="this.setCustomValidity('')"/>
                        <span toggle="#password-field" class="field-icon toggle-password"><img class="field-icon" src="../../Images/passwordEye.png"></span>
                    </div>
                </div>
             </div>
                      Programme :<select name="programme">
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
                               </select> <br><br>

                            Shift :<select name="shift" ninvalid="this.setCustomValidity('Shift is required.')"
                              oninput="this.setCustomValidity('')" >
                                <option value="1">1</option>
                                <option value="2">2</option> 
                            </select>    <br><br>
                                <button class="btn btn-primary">Change Hod Password</button>
                         </form>
                            <script type="text/javascript">
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
        <% } %>
    </body>
</html>
