<%@page import="java.util.Arrays"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Course_reg"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>RegCourse Page</title>
    </head>
    <body>
       <%
            if(session.getAttribute("stud_uname")==null && session.getAttribute("registrar_uname")==null)
            {
               response.sendRedirect("../index.jsp");
            }
           
            //This else if deals with the registration from student account.
            try{
                if(session.getAttribute("stud_user").equals("student") && request.getParameter("user").equals("student"))
            {
                //receiving courses in array of courses.
                int len1=0,len2=0,len3=0,total_len=0,j=0,totalCourses=0;
                String year,term;
                SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                String date=f.format(new Date());
                Student_data sd=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
                String course[]=request.getParameterValues("course[]");
                String courseB[]=request.getParameterValues("courseB[]");
                String courseP[]=request.getParameterValues("courseP[]");
                 if(course.length==0)
                {
                    out.println("You haven't selected any course.");
                }
                else
                {
                    try{len1=course.length;}catch(Exception e){}
                    try{len2=courseB.length;}catch(Exception e){}
                    try{len3=courseP.length;}catch(Exception e){}
                    total_len=len1+len2+len3;
                    System.out.println(total_len);
                   
                    String[] courses=new String[total_len];
                    //create array of length equal to course+courseP                
                   // out.print(j);
                   for(int i=0;i<course.length;i++)
                   {
                       courses[j]=course[i];
                       j++;
                   }
                   try{
                   if(courseB.length!=0)
                   {
                        for(int i=0;i<courseB.length;i++)
                        {
                            courses[j]=courseB[i];
                            j++;
                        }
                   }
                   }
                   catch(Exception e){
                  //out.print("CourseP array is empty");
                   }
                   try{
                   if(courseP.length!=0)
                   {
                        for(int i=0;i<courseP.length;i++)
                        {
                            courses[j]=courseP[i];
                            j++;
                        }
                   }
                   }
                   catch(Exception e){
                  // out.print("CourseP array is empty");
                   }

                    //calculated the total number of courses selected by student
                    //If total courses is greater than maximum allowed courses then back to the studRegistration.jsp.
                    if(total_len>AdminCon.getMaxRegCourses())  
                    {
                        response.sendRedirect("../views/Student/studRegistration.jsp?msg=You can register only "+AdminCon.getMaxRegCourses()+" courses");
                    }
                    else if(request.getParameter("flag").equals("save"))
                    {
                         try
                        {
                            List<String> l=new ArrayList<String>();
                            l.add((String)session.getAttribute("stud_uname"));
                            if(len2==StudCon.getBackCourse(l.get(0)).size())
                            {   int res[]=StudCon.regCourse(courses,l,request.getParameter("flag"),date,sd.getTerm(),(new Integer(sd.getYear()).toString()),(String)session.getAttribute("stud_user"));}
                            else
                            {response.sendRedirect("../views/Student/studRegistration.jsp?msg=='Select all Backlog Courses'"); }
                        }
                        catch(Exception e){
                        out.print(e);
                        }
                        response.sendRedirect("../views/Student/saveCourse.jsp");
                    }
                }
               
            }
            }catch(Exception e){
            //if student is not logged in
            }
           
            /*******************************************Registrar**********************************************/
           
            //This else if deals with the registration from registrar account.
            try
            {
             
            String roll;
           
          
               List<String>studLi=new ArrayList<String>();
               studLi=(List)session.getAttribute("studList");
               
                if(session.getAttribute("inAllRegularCourse").equals("yes"))
                roll=(studLi.get(0));
                else
                roll=(String)session.getAttribute("studroll");
               
            if(session.getAttribute("registrar_user").equals("registrar") && request.getParameter("user").equals("registrar"))
            {
               
                SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                String date=f.format(new Date());
                int j=0,r,len1=0,len2=0,len3=0,total_len=0;
                //receiving courses in array of courses.
                Student_data sd=(Student_data)StudCon.getStudentInfo(roll);
                String course[]=request.getParameterValues("course[]");//regular courses
                 String courseB[]=request.getParameterValues("courseB[]");//backlog courses
                String courseP[]=request.getParameterValues("courseP[]");//pending courses
                try
                {if(course.length==0);
                }catch(Exception e)
                {response.sendRedirect("../views/Registrar/editRegistration.jsp?result=You haven't selected any Regular course.");}
                 
                    try{len1=course.length;}catch(Exception e){}
                    try{len2=courseB.length;}catch(Exception e){}
                    try{len3=courseP.length;}catch(Exception e){}
                    total_len=len1+len2+len3;
                    System.out.println(total_len);
                   
                    String coursesReg[]=new String[total_len];
                    //create array of length equal to course+courseP                
                   // out.print(j);
                   for(int i=0;i<course.length;i++)
                   {
                       coursesReg[j]=course[i];
                       
                       j++;
                   }
                   try{
                   if(courseB.length!=0)
                   {
                        for(int i=0;i<courseB.length;i++)
                        {
                            coursesReg[j]=courseB[i];
                           
                            j++;
                        }
                   }
                   }
                   catch(Exception e){
                  //out.print("CourseP array is empty");
                   }
                   try{
                   if(courseP.length!=0)
                   {
                        for(int i=0;i<courseP.length;i++)
                        {
                            coursesReg[j]=courseP[i];
                            j++;
                        }
                   }
                   }
                   catch(Exception e){
                  // out.print("CourseP array is empty");
                   }

                   

                   //If total courses is greater than maximum allowed courses then back to the editRegistration.jsp.
                    if(coursesReg.length>AdminCon.getMaxRegCourses())
                    {
                       response.sendRedirect("../views/Registrar/editRegistration.jsp?result=Only "+AdminCon.getMaxRegCourses()+" courses are allowed.");
                    }
                    else
                    {    System.out.print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!LENGTH = "+coursesReg.length);
                    
                        //Confirming registration of all courses using regCourse() method.
                         if(session.getAttribute("inAllRegularCourse").equals("yes")){
                          int res[]=new int[course.length];
                         StudCon.regCourse(coursesReg,studLi,request.getParameter("flag"),date,sd.getTerm(),String.valueOf(sd.getYear()),(String)session.getAttribute("registrar_user"));
                          // out.print("hi"+res);
                         }
                        else{
                             
                            // System.out.println("hiiiiiiiiiiii"+len2+" "+StudCon.getBackCourse(roll));
                            if(len2==StudCon.getBackCourse(roll).size())
                            {
                                StudCon.regCourse(coursesReg,Arrays.asList(roll),request.getParameter("flag"),date,sd.getTerm(),String.valueOf(sd.getYear()),(String)session.getAttribute("registrar_user"));
                            }
                          else
                          {  response.sendRedirect("../views/Registrar/editRegistration.jsp?result=<span style='font-size:20px;'>Please select all backlog courses</span> <br> (if all courses are already selected ,make sure remaining courses are offered by HOD)");  }
                        }
                         Admin_data ad=AdminCon.getAdminInfo();
                        System.out.print("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!LENGTH = "+coursesReg.length);
                        
                        //Examination registration of all confirmed courses
                        try{
                        //int res[]=StudCon.regExam(course,request.getParameter("rollno"),ad.getReg_term_year(),sd.getTerm(),sd.getYear(),(String)session.getAttribute("registrar_user"));                        
                        }catch(Exception e){}
                         try{
                        //int res1[]=StudCon.regExam(courseB,request.getParameter("rollno"),ad.getReg_term_year(),sd.getTerm(),sd.getYear(),(String)session.getAttribute("registrar_user"));                        
                        }catch(Exception e){}

                          try{
                        //int res2[]=StudCon.regExam(courseP,request.getParameter("rollno"),ad.getReg_term_year(),sd.getTerm(),sd.getYear(),(String)session.getAttribute("registrar_user"));                        
                        }catch(Exception e){}
                   
                   
                    if(session.getAttribute("inAllRegularCourse").equals("yes"))
                       response.sendRedirect("../views/Registrar/courseRegPrintAll.jsp");
                    else
                        response.sendRedirect("../views/Registrar/regExam.jsp");

                    }
               
            }
            }
            catch(Exception e)
            {
                //if registrar is not logged in
            }
               
                   
                session.removeAttribute("Allstud");    
       %>
    </body>
</html>
