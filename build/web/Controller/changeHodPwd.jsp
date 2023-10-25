

<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <title>Change HOD password</title>
    </head>
    <body>
        <%  String oldPwd=null;
            try
            {
                if(session.getAttribute("hod_user").equals("hod")) 
                {
                 oldPwd=request.getParameter("oldPwd");
                 String newPwd1=request.getParameter("newPwd1");
                 String newPwd2=request.getParameter("newPwd2");
                 Boolean flag=false;
                 if(newPwd1.equals(newPwd2))
                 {                    
                        flag=HodCon.changeHodPwd(oldPwd,newPwd1);//call to mainController

                     //displaying result
                     if(flag)
                     {            
                         response.sendRedirect("../views/HOD/hodPanel.jsp?result=password changed successfully");
                     }
                     else 
                     {
                         response.sendRedirect("../views/HOD/changeHodPwdForm.jsp?failResult=Enter correct Old password");  
                     }
                 }
                 else
                 {
                     //Both password don't match
                     response.sendRedirect("../views/HOD/changeHodPwdForm.jsp?failResult=Both new password do not match");
                 }
               }
            }
            catch(Exception e)
            {
                
            }
            
            try
            {
                if(session.getAttribute("admin_user").equals("admin"))
                {
                    String newHodPwd=request.getParameter("newHodPwd"); 
                    String programme=request.getParameter("programme");
                    int shift=Integer.parseInt(request.getParameter("shift"));
                    String result=HodCon.changeHodPwdByAdmin(newHodPwd, programme,shift,"hod");
                    if(result.equals("success"))
                     {            
                         response.sendRedirect("../views/Admin/adminPanel.jsp?result=HOD password changed successfully");
                     }
                     else if(result.equals("fail"))
                     {
                         response.sendRedirect("../views/Admin/changeHodPwdFormByAdmin.jsp?failResult=Failed to change HOD password");  
                     }
                     else if(result.equals("hodUnavailable"))
                     {
                         response.sendRedirect("../views/Admin/changeHodPwdFormByAdmin.jsp?failResult=HOD is not present");  
                     }
                }
              }
            catch(Exception e){}
            
             %>
    </body>
</html>
