<%-- 
    Document   : detainStudents.jsp
    Created on : 23 May, 2021, 5:11:53 PM
    Author     : SHWETA
--%>

<%@page import="mainController.ExamRegCon"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.HodCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Courses"%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
      
        <% if(session.getAttribute("admin_uname")==null || session.getAttribute("admin_user")==null)
           {
                   response.sendRedirect("../../index.jsp");
           }
           else if(session.getAttribute("admin_user").equals("admin"))
           {  //Retrieving Courses of specific Programme
               List li1=HodCon.getCoursesByProgramme(request.getParameter("branch"));
               
               //li2 will contain list of coursecodes and students to be detained in that course
               //[coursecode1,rollno1,rollno2,rollno3,.......]
               //[coursecode2,rollno1,rollno3,rollno4,....]
               //.....
               List<List<String>>li2=new ArrayList<List<String>>();
                
                for(Object oo:li1)
                {
                    Courses c=(Courses)oo;
                    
                    if(request.getParameterValues(c.getCourse_code())!=null)
                    {
                        List<String>CCandRoll=new ArrayList<String>();
                        CCandRoll.add(c.getCourse_code());
                        //retrieving detain student rollno from previous page by using coursecode in li1 in request.getParameterValues
                        CCandRoll.addAll(Arrays.asList(request.getParameterValues(c.getCourse_code())));
                        li2.add(CCandRoll);
                    }
                } 
                //Calling function to detain students
                boolean n= ExamRegCon.detainStudents(li2);
                if(n==true)
                {response.sendRedirect("../views/Admin/detention.jsp?result=Successful Detention of those who have registered for exam!!");}
                else
                {response.sendRedirect("../views/Admin/detention.jsp?failResult=Unsuccessful Detention");}

       } %>
    </body>
</html>
