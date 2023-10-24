<%-- 
    Document   : changeHodPwd
    Created on : Sep 6, 2018, 10:53:48 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
        <title>Change Hod Password</title>
    </head>
    <body>
         <%  //session check 
        if(session.getAttribute("uname")!=null)
        {
        String msg=request.getParameter("result");
    %>  
        <jsp:include page="../headerforallPanelviews.jsp"/>
        <div class="container">
        <br>
        <h1>Change Your Password</h1><hr>
        <p class="text-danger"><% try{if(!msg.equals(null)){out.println(msg);}}catch(Exception e){} %></p>
        <form action="../../Controller/changeHodPwd.jsp" method="POST">
                       Select Programme: <select name="programme" required>
                        <option>CM</option>
                        <option>IF</option>
                        <option>ME</option>
                        <option>EE</option>
                        <option>CE</option>
                        <option>PE</option>
                        <option>E&TC</option>
                        <option>DDGM</option>
                        <option>IDD</option>
                        </select>
                       <br><br>
                       New Password : <input type="password" name="newPwd1" placeholder="Password"  />
                       <br><br>
                       Retype Password :<input type="password" name="newPwd2" placeholder="Password"  />
                       <br><br>
                       <input type="reset" name="reset" value="Reset" class="btn btn-primary"  />
                       <input type="submit" name="submit" value="Change" class="btn btn-primary"  /><br><br>
	 
</form> 
         <%  
            }
            else
            {
               response.sendRedirect("../../index.jsp");
            }
         %>
        </div>
    </body>
</html>
