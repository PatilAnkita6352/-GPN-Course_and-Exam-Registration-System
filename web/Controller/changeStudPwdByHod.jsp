
<%@page import="beans.Student_data"%>
<%@page import="beans.Hod_data"%>
<%@page import="mainController.HodCon"%>
<%@page import="mainController.AdminCon"%>
<%@page import="mainController.StudCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Student Password</title>
    </head>
    <body>
        <%  
        if(((String)session.getAttribute("hod_user"))!=null && ((String)session.getAttribute("hod_uname"))!=null)
        {
            //Session check succcessful
         String rollno=request.getParameter("rollno");//Old Password
         String newPwd1=request.getParameter("newPwd1");
         String newPwd2=request.getParameter("newPwd2");
         Boolean flag=false;
         Student_data stud=null;
         Hod_data hod=null;
         
         if(newPwd1.equals(newPwd2))
         {   
             Hod_data hd=(Hod_data)HodCon.getHODInfo((String)session.getAttribute("hod_uname"));
            flag=HodCon.changeStudPwd(rollno,newPwd1,hd.getProgramme(),hd.getShift());//call to mainController
                  
             if(flag) 
                  response.sendRedirect("../views/HOD/hodPanel.jsp?result=Password changed successfully");
             else
                 response.sendRedirect("../views/HOD/changeStudPwdByHodForm.jsp?failResult=Rollno not found");  
         } 
         else
         {
             //Both password don't match
             response.sendRedirect("../views/HOD/changeStudPwdByHodForm.jsp?failResult=Both new password do not match");
         }
        }
        else{
            response.sendRedirect("../index.jsp");
        }
             %>
    </body>
</html>
