<%-- 
    Document   : stud_panel
    Created on : Jul 28, 2018, 10:21:21 PM
    Author     : sarvadnya
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.AdminCon"%>
<%@page import="mainController.HodCon"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@page import="beans.Course_reg"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
        <link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
        <script src="//cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
        <script src="ajax"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Panel</title>
        
       
     <script src="../../assets/js/jquery1.min.js"></script>
     <script src="../../assets/js/bootstrap1.min.js"></script>
     
          <style>
            p{
                text-height: 20;
                
            }
        </style>
        
    </head>
    <body>
     <jsp:include page="../headerforallPanelviews.jsp"/>
         <% 
             session.setAttribute("profilepanel","studpanel");
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student")) 
           {   
                Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
              
                %>
                <br><div class="container"><% 
                     try{
            if(!(request.getParameter("result").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"> <a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("result"));%></p></div></div>
            <%}
                }catch(Exception e){}
              try{
            if(!(request.getParameter("wrongResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("wrongResult"));%></p></div></div>
            <%}
                }catch(Exception e){}
                
        %></div> 
                <h2>Welcome <%=stud.getS_name()%></h2>
                <hr><br>
    <marquee style="background:gray;color: white"width="100%"><%try{if(!AdminCon.getNotice().equals(null)){out.print(AdminCon.getNotice());}}catch(Exception e){}%></marquee><br>
                <div class="row">
                    <div class="col-lg-6">
                <div class="panel panel-primary">
                    <div class="panel-heading">
                <h4><u>Student details</u></h4>
                    </div>
                     <div class="panel-body">
                <p> 
                <font size="4">  
                    Roll No.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getRollno()%><br>
                    Name &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getS_name()%><br>
                    Programme &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getProgramme()%><br>
                    Term &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getTerm()%><br>
                    Year &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getYear()%><br>
                    Phone Number&nbsp;&nbsp;:<%=stud.getPhone_no()%><br>
                    Email &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getS_email()%>
                </font>
                </p> 
                     </div>
                    </div>
                    </div>
                <div class="col-lg-6">
               <div class="panel panel-primary">
   			<div class="panel-heading">
   				<h2>Student Panel</h2>
   			</div>
                        <div class="panel-body">
                            <form method="post"> 
                                <button class="btn btn-primary" formaction="studRegistration.jsp">GO FOR REGISTRATION</button><br><br>
                                <button class="btn btn-primary" formaction="editStudProfileForm.jsp">UPDATE PROFILE</button><br><br>
                                <button class="btn btn-primary" formaction="changeStudPwdForm.jsp">CHANGE PASSWORD</button><br><br>
                            </form>
                        </div> 
               </div>
                </div>
                </div> 
               
               <%
           } 
            %>
    <%@include file="../../footer.jsp" %> 
    </body>
</html>
                    