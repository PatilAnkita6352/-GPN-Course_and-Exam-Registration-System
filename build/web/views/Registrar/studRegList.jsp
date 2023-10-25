<%@page import="beans.Course_reg"%>
<%@page import="java.util.ArrayList"%>
<%@page import="mainController.AdminCon"%>
<%response.setHeader("Cache-Control","no-cache,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseRegCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head> 
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student List</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">
       <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
        <style>
            .align{
                text-align: center;
            }
        </style>
    </head>
    <body>
    <%
        if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
        {
           response.sendRedirect("../../index.jsp");
        }
        else if(session.getAttribute("registrar_user").equals("registrar")) 
       {
           
        %> <jsp:include page="../headerforallPanelviews.jsp"/><%
            
            %><div class="container"><%
             try{
            if(!(request.getParameter("failResult").equals(null))){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><%out.print(request.getParameter("failResult"));%></p></div></div>
            <%}
                }catch(Exception e){}  
            %></div>
        <%   
            try{    
                List li;
                session.removeAttribute("studroll");
                //Retrieving students for registration using term and year.
                if(request.getParameter("year")!=null && request.getParameter("term")!=null && request.getParameter("shift")!=null)
                {
                     li=HodCon.getStudForReg(HodCon.getRegistrarBranch(session.getAttribute("registrar_uname").toString()),Integer.parseInt(request.getParameter("year")),request.getParameter("term"),Integer.parseInt(request.getParameter("shift")));
                     session.setAttribute("reg_list_year",request.getParameter("year"));
                      session.setAttribute("reg_list_term",request.getParameter("term"));
                       session.setAttribute("reg_list_shift",request.getParameter("shift"));
                }else
                {
                    li=HodCon.getStudForReg(HodCon.getRegistrarBranch(session.getAttribute("registrar_uname").toString()),Integer.parseInt((String)session.getAttribute("reg_list_year")),(String)session.getAttribute("reg_list_term"),Integer.parseInt((String)session.getAttribute("reg_list_shift")));
                }
                 session.setAttribute("Allstud",li);
               
                
                //Checking if li is not empty.
                if(li.size()!=0){ 
                int cnt=1;//Used for printing serial no.
            %>
                <center><h2>Registration</h2></center><br>
                <div class="container">
                    <div class="row center-block">
                        <div class="col-sm-2"></div>
                        <div class="col-sm-8">
                            
                              
                <form method="POST">
                    
                    <button class="btn btn-primary"style="margin-left:90px;margin-bottom: 20px;font-size:13px; " value="coursereg" name="editBtn" formaction="editRegistration.jsp"><b>Course Registration<br>For  all REGULAR Students</b><br>(DSY and Backlog students Not included)</button>
                    <button class="btn btn-primary"style="margin-left:50px;margin-bottom: 20px;font-size:13px; " value="examreg" name="examBtn" onclick="<%session.setAttribute("studroll","0");%>" formaction="regExam.jsp"><b>Exam Registration<br>For  all REGULAR Students</b><br>(DSY and Backlog students Not included)</button>
                 
                    <table class="table" border="1">
                        <thead>
                        <th class="align" style="width:10%">Course Registration</th> 
                            <th class="align" style="width:10%">Exam Registration</th>
                            <th class="align" style="width:10%">Sr.No</th> 
                            <th class="align" style="width:13%">Roll No.</th>
                            <th>Name</th> 
                            <th class="align">Edit</th>
                           
                        </thead>  
                        <%
                            for(Object student:li) 
                            { 
                                //Retrieving student info usin rollno for printing.
                                HodCon.StudentReg stud=(HodCon.StudentReg)student;
                        %> 
                            
                            <input type="hidden" name="term" value="<%=stud.getTerm()%>">
                            <input type="hidden" name="year" value="<%=stud.getYear()%>">
                        <tr> 
                            <td align="center">
                                <%
                                    
                                    if(stud.isCourseRegStat()){ %>
                                    <img src="../../Images/green-tick1.png" height="15" width="15"> 
                                    <%}else{%>
                                    <img src="../../Images/red-cross1.png" height="15" width="15"> 
                                <%}%>
                            </td> 
                            <td align="center">
                                <%
                                    
                                    if(stud.isExamRegStat()){ %>
                                    <img src="../../Images/green-tick1.png" height="15" width="15"> 
                                    <%}else{%>
                                    <img src="../../Images/red-cross1.png" height="15" width="15"> 
                                <%}%>
                            </td> 
                            <td align="center"><%=cnt++%></td>
                            <td align="center"><%=stud.getRollno() %></td>
                            <td><%=stud.getName()%></td>
                            <td class="align">
        <button class="btn btn-md btn-danger" name="editBtn" value="<%=stud.getRollno()%>" formaction="editRegistration.jsp">Edit</button>
                            </td>                             
                        </tr> 
                            <%}//for close
                        %>
                </table>
                </form>
                        </div>
                </div> 
                <%}
                else
                {
                    response.sendRedirect("registrarPanel.jsp?failResult=Sorry, but there are no students for registration");
                }//Used for checking if students are there for registration.
            }
            catch(Exception e)
            {
                out.println("Exception occured : "+e);
            } 
        }//if close used for session check%>
    </body>
</html>
