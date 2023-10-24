

<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Student Password</title>
    </head>
    <body>
       <% if(((String)session.getAttribute("stud_user"))!=null && ((String)session.getAttribute("stud_uname"))!=null)
            {
            String oldPwd=request.getParameter("oldPwd");//Old Password
             String newPwd1=request.getParameter("newPwd1");
             String newPwd2=request.getParameter("newPwd2");
             Boolean flag=false;
             Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));//Hod can access only his department and shift students.
             
             if(stud.getPassword().equals(oldPwd)) 
             {
                 System.out.println("*************************************in if");
                 if(newPwd1.equals(newPwd2))
                { 
                     flag=StudCon.changeStudPwd((String)session.getAttribute("stud_uname"),oldPwd,newPwd1);//call to mainController
                     if(flag)
                        response.sendRedirect("../views/Student/studPanel.jsp?result=Password changed successfully");
                     else
                         response.sendRedirect("../views/Student/studPanel.jsp?failResult=Failed to change password.");
                }
                 else
                    response.sendRedirect("../views/Student/changeStudPwdForm.jsp?failResult=Both new password do not match");                
             }
             else
             {
                response.sendRedirect("../views/Student/changeStudPwdForm.jsp?failResult=Old password is incorrect.");
             }
            }
        else
        {
             response.sendRedirect("../index.jsp");
        }
             %>   
    </body>
</html>
