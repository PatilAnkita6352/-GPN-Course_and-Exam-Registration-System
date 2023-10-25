

<%@page import="beans.Exam_reg"%>
<%@page import="beans.Admin_data"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page import="mainController.CourseCon"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> All Hall Ticket</title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css"> 
        <style>
             
           @media print
            {
                p{
                    page-break-after: always;
                }
            }
            
           
        </style> 
    </head>
    <body onload="load()">
       <% String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          %>
          
           <%@include file="headerforallPanelController.jsp"%>
           <a href="../views/Admin/hallTicketGeneration.jsp"id="BackBtn" ><button value="Back" class="btn btn-lg btn-primary">Back</button></a>
           <button  class="btn btn-lg btn-primary" id="PrintBtn" data-toggle="collapse" onclick="printpage()">Print</button>
        
           
        <%
           Exam_reg examReg;
           Admin_data ad=AdminCon.getAdminInfo();
           
           String term,year,cou_name;
           String regTermYear=ad.getReg_term_year();
           String[] arr=new String[20];
           arr=regTermYear.split("-", 2);
           term=arr[0];
           year=arr[1];
           int cnt=0;
           
           
           
            String hallTicketType=request.getParameter("hallTicketType");
            if(hallTicketType.equals("pt"))
            {
                String firstPTDate=request.getParameter("firstPTDate");
                String secondPTDate=request.getParameter("secondPTDate");
                String or_pr_tw=request.getParameter("or_pr_tw");
                String finalExDate=request.getParameter("finalExDate");
                String endOfTerm=request.getParameter("endOfTerm");
                String exRegDate=request.getParameter("exRegDate");
                String branch=request.getParameter("branch");
                int shift =Integer.parseInt((String)request.getParameter("shift"));
                int yr =Integer.parseInt((String)request.getParameter("year"));
                AdminCon.saveExaminationDates((String)session.getAttribute("admin_uname"),firstPTDate,secondPTDate,or_pr_tw,finalExDate,endOfTerm,exRegDate);

                ad=AdminCon.getAdminInfo();
                String regno,cou_code;
                Courses course;
                Student_data stud;
                String reg_term_year=AdminCon.getReg_term_year();
                System.out.println("branch"+branch+shift+yr+reg_term_year);
                        //li contains regno of students of a particular programme,shift,year.
                        List li=AdminCon.getRegNoByProgrammePT(branch, shift,yr,reg_term_year);%>

                        <%

                        if(li.size()>0) 
                        {
                        for(Object obj:li) 
                        { 
                            regno=(String)obj;
                            stud=(Student_data)StudCon.getStudentInfo(regno);
                            int sn=1;
                            //returns cou_codes of courses registered by each student.%>
                           <% 
                           try{ 
                               String term2=stud.getTerm();
                               int year2=stud.getYear();
                           List couCode=AdminCon.generateIndividualPTHallTicket(regno,branch,yr,stud.getTerm(),ad.getReg_term_year(),stud.getS_regular());

                            if(couCode.size()>0)
                            {
                            //Returns course object for each cou_code in couCode list.
                             %>
                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                            <font face="times new roman">
                          <div class="container">
                            <div id="HallTicket">
                                <br>
                          <table id="t" border="1">

                                <tr>
                                    <td colspan="5"><center><h4><b>GOVERNMENT POLYTECHNIC NASHIK</b></h4>&nbsp;&nbsp;COURSE REGISTRATION (PROVISIONAL) SLIP FOR EVEN TERM -2018-2019<br>&nbsp;&nbsp;&nbsp;<b>Hall Ticket for periodic Test Examination</b></center></td>
                                    <td rowspan="2" colspan="3"><center><img src="../Images/<%=regno%>.jpg" width="85" height="120"></center></td>
                                </tr>

                                <tr>
                                    <td colspan="5"><b>Roll No.:<%=stud.getRollno() %>&nbsp;&nbsp;&nbsp;&nbsp;
                                            Name of Student :<%=(stud.getS_name()).toUpperCase() %><br>
                                            Programme :<%String s=stud.getProgramme(); String fName=AdminCon.retriveBranchFullName(s); out.print(fName);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T-<% int t=StudCon.getStudTerm(stud.getTerm(),stud.getYear()); out.print(t);%></b></td>
                                </tr>

                                <tr>
                                        <th width="50"><center>S.N</center></th>
                                        <th width="100"><center>Course Code</center></th> 
                                        <th><center>Course Name</center></th>
                                        <th width="30"><center>TH</center></th>
                                        <th width="30"><center>PT</center></th>
                                        <th width="30"><center>TW</center></th>
                                        <th width="30"><center>PR</center></th>
                                        <th width="30"><center>OR</center></th>
                                </tr>

                            <% for(Object obj1:couCode)
                            {
                                cou_code=(String)obj1;
                                course=CourseCon.getCourseObject(cou_code);

                             %>   
                            <tr>
                                <td><center><%=sn++%></center></td>
                                <td><center><%=cou_code%></center></td> 
                                <td><%=(course.getCourse_name()).toUpperCase()%></td> 

                                <td><center><%if(course.getCou_th_min()>0)out.print("Y"); else out.print(""); %></center></td>  
                          <td><center><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print(""); %></center></td>  

                          <td><center><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print(""); %></center></td>  
                          <td><center><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print(""); %></center></td>
                          <td><center><%if(course.getCou_or_min()>0)out.print("Y"); else out.print(""); %></center></td>
                                        </tr>
                            <%
                                } 
                            %>
                            <tr><td  colspan="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--img src="../Images/<%=regno+"Sign"%>.png" width="94" height="20"-->
                                  <img src="../Sign/<%=regno%>.jpg" width="94" height="20">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="../Sign/WankhedeSir.jpg" width="94" height="20">
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;______________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                (Prof.G.G.Wankhede)
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Candidate's Signature
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Controller of Examination
                                <br>Note :1)This is Provisional course Registration.Min 75% attendence
                                & satisfactory Termwork/Practical submission is<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; necessary for final grant of term.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2)Preserve this document carefully.It is required at the time of Examination Registartion 
                                    & Periodic Test.</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>3)Contact Controller of Examinations for type of discripancy/error observed in the above details.</b>
                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4)Dates to remember - 
                                    <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Examination Registration - <b><%=ad.getExamination_reg_date()%></b>&nbsp;&nbsp;&nbsp;&nbsp;
                                    First Periodic Test - <b><%=ad.getFirst_PT_date()%></b>&nbsp;&nbsp;&nbsp;&nbsp;
                                    Second Periodic Test - <b><%=ad.getSecond_PT_date()%></b><br>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End of Term - <b><%=ad.getEnd_of_term()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    OR/PR/TW Exam - <b><%=ad.getOr_pr_tw_exam_date()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    Final Summer Examination - <b><%=ad.getFinal_exam_date()%></b><br>
                                </td></tr>
        </table>
        </div>
        <div id="editor"></div>
                          </div></font>
        <br><br><br>
      <p></p>

                           <% }
            }catch(Exception e){out.print(e+"Ranchoo");}
                            }//for close
                        }
            }//outer if close
        else if(hallTicketType.equals("final"))
        {
            
            String regno,cou_code;
            Courses course;
            String branch=request.getParameter("branch");
            int shift =Integer.parseInt((String)request.getParameter("shift"));
            int yr =Integer.parseInt((String)request.getParameter("year"));
            Student_data stud;
            String reg_term_year=AdminCon.getReg_term_year();
   
                    //li contains regno of students of a particular programme,shift,year.
                    List li=AdminCon.getRegNoByProgrammeFinal(branch, shift, yr,reg_term_year);%>
                   
                    <% 
                    if(li.size()>0) 
                    {
                    for(Object obj:li) 
                    { 
                        regno=(String)obj;
                        stud=(Student_data)StudCon.getStudentInfo(regno);
                         int sn=1;
                        //returns cou_codes of courses registered by each student.%>
                       <% 
                       try{ 
                           
                       List couCode=AdminCon.generateIndividualFinalHallTicket(regno, branch, yr,stud.getTerm());
                        
                        if(couCode.size()>0)
                        {
                        //Returns course object for each cou_code in couCode list.
                        %> 
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                        <font face="times new roman">
                        <div id="HallTicket">  
                      <table id="t" border="1"">
                          <br> 
                          <tr><td colspan="5">&nbsp;&nbsp;&nbsp;
                                  Roll Number&nbsp;&nbsp;&nbsp;:<b><%=stud.getRollno()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  Examination:<b><%if(term.equals("ODD"))
                                  {
                                      out.print("WINTER-"+year);
                                  }
                                  else
                                  {
                                      out.print("SUMMER-"+(year));
                                  }%></b> <br>&nbsp;&nbsp;&nbsp;
                                  Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=(stud.getS_name()).toUpperCase()%><br>&nbsp;&nbsp;&nbsp;
                                  Programme&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%String s=stud.getProgramme(); String fName=AdminCon.retriveBranchFullName(s); out.print(fName);%></td>
                              <td colspan="3"><center><img src="../Images/<%=regno%>.jpg" width="67" height="73"></center></td>
                          </tr>
                         <tr>
                         <th width="50"><center>Sr.No</center></th>
                         <th width="100"><center>Course Code</center></th> 
                       <th><center>Course Name</center></th>
                       <th width="30"><center>TH</center></th>
                       <th width="30"><center>PT</center></th>
                       <th width="30"><center>TW</center></th>
                       <th width="30"><center>PR</center></th>
                       <th width="30"><center>OR</center></th>
                        
                        </tr> 
                        <% //for(Object obj2: couCode)
                            for(int k=0;k<couCode.size();k++)
                        {
                            examReg=(Exam_reg)couCode.get(k);
                            //cou_code=(String)couCode.get(k);
                            cou_name=CourseCon.getCourseName(examReg.getCourse_code());
                            System.out.println("))))))))))))))))))))))))"+cou_name);
                         %>   
                       <tr>
                      <td><center><%= ++cnt %></center></td> 
                      <td><center><%=examReg.getCourse_code()%></center></td> 
                      <td><%=(cou_name).toUpperCase()%></td> 
                      <td><center><%if(examReg.getEx_th()==1)out.print("Y"); else out.print("--"); %></center></td>  
                      <td><center><%if(examReg.getEx_pt()==1)out.print("Y"); else out.print("--"); %></center></td>  
                      <td><center><%if(examReg.getEx_tw()==1)out.print("Y"); else out.print("--"); %></center></td>  
                      <td><center><%if(examReg.getEx_pr()==1)out.print("Y"); else out.print("--"); %></center></td>  
                      <td><center><%if(examReg.getEx_or()==1)out.print("Y"); else out.print("--"); %></center></td>
                        </tr>
                        <%
                            } 
                        %>
                      <tr><td  colspan="8"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Sign/<%=regno%>.jpg" width="140" height="35">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="../Sign/WankhedeSir.jpg" width="94" height="20">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;__________________
                            &nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            <b>(Prof. Girish Gajanan Wankhede)</b>
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>CANDIDATE'S SIGNATURE</b>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <b>CONTROLLER OF EXAMINATION</b>
                            <br><h6>Note :1)This Hall Ticket will be invalid if the candidate is Detained in any courses.<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2)Indentity card is necessary along with this Hall Ticket & Candidate must be in collage uniform on each day of Examination.</b><br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3)* Indicates Backlog Course.
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4)# Indicates Non-credit Course.
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>Refer Notice Board & also website http://wwww.gpnashik.ac.in for Final Exam Timetable,Notices,Circulars.</b><br><b> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;of Examination if any.</b></h6>
                            </td></tr>
            </table>
                        </div></font><br><p></p>
          <% }%><%
                    }//try close
            catch(Exception e){}
                        }//for close
                    }//if close
        }

        %>
        
        <% } %>
        
    </body> 
    <script>
        function printpage() 
        { var btn3=document.getElementById('BackBtn'); 
            btn3.style.display='none';
            var btn=document.getElementById('PrintBtn'); 
            btn.style.display='none';
             window.print();
             btn.style.display='inline-block';
            btn3.style.display='inline-block';
            
        }
    </script>
</html>
