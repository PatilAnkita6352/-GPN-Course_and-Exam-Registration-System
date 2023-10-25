

<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Admin Password</title>
    </head>
    <body>
       <% 
           String motherName=null,oldPwd=null,newPwd1=null,newPwd2=null;
           int flag=0;
           motherName=request.getParameter("motherName");
           oldPwd=request.getParameter("oldPwd");
           newPwd1=request.getParameter("newPwd1");
           newPwd2=request.getParameter("newPwd2");
           if(newPwd1.equals(newPwd2))
           {
               Admin_data ad=(Admin_data)AdminCon.getAdminInfo();
               try{
               if(oldPwd.equals(null))
               {
                   out.println(motherName);
               }
               }catch(Exception e){
                   flag=1;
               }
               if(flag==1)
               {
                   if(motherName.equals(ad.getMother_name()))
                   {
                       String pass=AdminCon.md5(newPwd1);
                       AdminCon.changeAdminPwd(pass);
                       response.sendRedirect("../views/Admin/adminPanel.jsp?result=Password changed successfully");
                   }
                   else 
                   {
                      response.sendRedirect("../views/Admin/changeAdminPwdForm.jsp?failResult=Incorrect mother name"); 
                   }
               }
               else
               {
                  String adminPwd=ad.getPassword();
                  String oldPwd1=AdminCon.md5(oldPwd);
                  if(adminPwd.equals(oldPwd1))
                  {
                      String pass=AdminCon.md5(newPwd1);
                      AdminCon.changeAdminPwd(pass);
                      response.sendRedirect("../views/Admin/adminPanel.jsp?result=Password changed successfully");
                  }
                  else 
                   {
                      response.sendRedirect("../views/Admin/changeAdminPwdForm.jsp?failResult=Incorrect Old Password"); 
                   }
               }
           }
           else
           {
               response.sendRedirect("../views/Admin/changeAdminPwdForm.jsp?failResult=Both Passwords are not matched"); 
           }
        %>
    </body>
</html>
