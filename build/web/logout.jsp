
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        <% 
            
            try{if(session.getAttribute("stud_user").equals("student"))
            {
            session.removeAttribute("stud_user");
            session.removeAttribute("stud_uname"); 
            }}catch(Exception e){}
            try{if(session.getAttribute("registrar_user").equals("registrar"))
            {
            session.removeAttribute("registrar_user");
            session.removeAttribute("registrar_uname"); 
            session.removeAttribute("inAllRegularCourse");   
            session.removeAttribute("Allstud");
            session.removeAttribute("studList");
            session.removeAttribute("EstudList");
            session.removeAttribute("reg_list_year");
            session.removeAttribute("reg_list_term");
            session.removeAttribute("reg_list_shift");
            session.removeAttribute("studroll");
            }}catch(Exception e){}
            try{if(session.getAttribute("admin_user").equals("admin"))
            {
            session.removeAttribute("admin_user");
            session.removeAttribute("admin_uname");
            session.removeAttribute("term");
            session.removeAttribute("regyear");
            session.removeAttribute("regType");
 
            }}catch(Exception e){}
            try{if(session.getAttribute("hod_user").equals("hod"))
            {
            session.removeAttribute("hod_user");
            session.removeAttribute("hod_uname"); 
            }}catch(Exception e){}
            session.removeAttribute("profilepanel");
            session.removeAttribute("Controller");
            
            response.sendRedirect("index.jsp");
            
          
        %>
    </body>
</html>
