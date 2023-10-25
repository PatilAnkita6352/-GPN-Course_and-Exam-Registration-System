

<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auto updation</title>
          <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
         <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
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
                   try{ 
                        if(request.getParameter("termOrYear").equals("term"))
                        {
                            if(AdminCon.autoUpdateTerm(request.getParameter("term")))
                                response.sendRedirect("../views/Admin/adminPanel.jsp?result=Updation of term is successful.");
                            else
                                response.sendRedirect("../views/Admin/adminPanel.jsp?failResult=Updation of term is unsuccessful.");
                        }
                        else if(request.getParameter("termOrYear").equals("year"))
                        {
                            if(AdminCon.autoUpdateYear())  
                                response.sendRedirect("../views/Admin/adminPanel.jsp?result=Updation of year is successful.");
                            else
                                response.sendRedirect("../views/Admin/adminPanel.jsp?failResult=Updation of year is unsuccessful.");
                        }
                            
                   }catch(Exception e){}
                }//session check if close.%> 
           
    </body>
</html>
