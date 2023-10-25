<%-- 
    Document   : startStopReg
    Created on : Dec 24, 2018, 3:12:31 PM
    Author     : sarvadnya
--%>

<%@page import="mainController.HodCon"%>
<%@page import="beans.Hod_data"%>
<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>start stop registration</title>
    </head>
    <body>
        <%
        String term,year,flag,term_year,user=null;
        term=request.getParameter("term");
        year=request.getParameter("year");
        
       user=request.getParameter("user");   // user varible is from controlReg of admin and StartReg button of hod.
        out.println("RRRRRRRRRRRRRRRRRRRRRR"+term+"  "+year+"  "+user);
    try
       {
            if(session.getAttribute("admin_user").equals("admin") && user.equals("admin"))
           {
            Admin_data ad=AdminCon.startStopReg((String)session.getAttribute("admin_uname"),request.getParameter("ctrlBtn"),term,year);
            flag=ad.getIs_reg_started(); 
             term_year=ad.getReg_term_year();
        
            if(flag.equals("y"))
            response.sendRedirect("../views/Admin/controlReg.jsp?result=Registration of "+term_year+" has been started");
            else
            response.sendRedirect("../views/Admin/controlReg.jsp?failResult=Registration has been stopped");
           }
       }
       catch(Exception e)
       {
           
       }
       try
       {
            if(session.getAttribute("hod_user").equals("hod") && user.equals("hod"))
            {
                if(!AdminCon.getRegStatus())
                    response.sendRedirect("../views/HOD/hodPanel.jsp?flag1=Registration is not started by Admin");
                 else
                {
                    Hod_data hd=HodCon.startReg((String)session.getAttribute("hod_uname"));
                    flag=hd.getIs_reg_started(); 
                    if(flag.equals("y"))
                    response.sendRedirect("../views/HOD/hodPanel.jsp?result=Registration has been started by HOD side ");
                    else
                    response.sendRedirect("../views/HOD/hodPanel.jsp?failResult=Failed to start Registration");
                }
             }
       }
       catch(Exception e)
       {
           
       }
             %>
    </body>
</html>
