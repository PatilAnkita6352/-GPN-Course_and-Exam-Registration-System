

<%@page import="beans.Hod_data"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="SessionFact.SessionFact"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="mainController.HodCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Registration</title>
    </head>
    <body>
        <%  
            String uname=((String)session.getAttribute("hod_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
            Hod_data hod=HodCon.getHODInfo((String)session.getAttribute("hod_uname"));
                  
          %>
        <jsp:useBean id="rd" class="beans.Hod_data"></jsp:useBean>
        <jsp:setProperty property="*" name="rd"/>
        <%  rd.setUser("registrar");
            rd.setProgramme(hod.getProgramme());
            rd.setShift(hod.getShift());
            int i=HodCon.addRegistrar(rd);//Call to mainController
            if(i>0)
            {   //registration successful
                response.sendRedirect("../views/HOD/hodPanel.jsp?result=Registrar register successfully");
            }
            else
            {    //registration Unsuccessful
                response.sendRedirect("../views/HOD/registrarRegForm.jsp?failResult=Registrar Not registered");
            }
        }
            
        %>
    </body>
</html>
