
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="beans.Admin_data"%>
<%@page import="beans.Exam_reg"%>
<%@page import="beans.Courses"%>
<%@page import="mainController.CourseCon"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page import="java.util.ListIterator"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Individual Hall Ticket </title>
        <link rel="stylesheet" type="text/css" href="../assets/css/bootstrap.min.css">
        <style>
            @page{
                size:a4 portrait;
                margin: 0;
            }
        </style> 
    </head>
    <body>
        <% String uname=((String)session.getAttribute("admin_uname"));
            if(uname.equals(null))
            {
               response.sendRedirect("../index.jsp");
            }
            else
           { 
          %> 
       
           <%@include file="headerforallPanelController.jsp"%>
        <%
           String rollno=request.getParameter("rollnumber");
           String cou_code,cou_name;
           Student_data stud=(Student_data)StudCon.getStudentInfo(rollno);
           Courses course;
           Exam_reg examReg;
           Admin_data ad=AdminCon.getAdminInfo();
           String term,year;
           String regTermYear=ad.getReg_term_year();
           String[] arr=new String[20];
           arr=regTermYear.split("-", 2);
           term=arr[0];
           year=arr[1];
           
           int cnt=0;
        %>         
     
        <%              String hallTicketType=request.getParameter("hallTicketType");//Value can be pt or final
                        if(hallTicketType.equals("pt")){
                        List couCode=AdminCon.generateIndividualPTHallTicket(rollno,stud.getProgramme(), stud.getYear(),stud.getTerm(),ad.getReg_term_year(),stud.getS_regular());
                        if(couCode.size()>0)
                        { 
                        //Returns course object for each cou_code in couCode list.
                        %>
                        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
                        <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
                      <div id="HallTicket">  
                                <TABLE border="1" cellpadding="5" cellspacing="2" align="center">
              <br>
              <br>
             
              
              <%
                  //Blob ph=stud.getPhoto();
                  //byte[] photo=ph.getBytes(1, (int)ph.length());
              %>
              <tr>
                  <th colspan="5"><center>GOVERNMENT POLYTECHNIC,NASHIK<br>&nbsp;&nbsp;Course Registration(PROVISIONAL)SLIP FOR EVEN TERM -2018-2019<br>&nbsp;&nbsp;&nbsp;<b><text-height:500px><text-width:500px> Hall Ticket for periodic Test Examination</text-width:500px></text-height:200px></b></center></th>
                      <td rowspan="2" colspan="3"><center><img src="../Images/<%=rollno%>.jpg" width="85" height="120"></center></td>
                        <th rowspan="2" colspan="3">
                          
                          <%
                          /*response.setContentType("image/jpg");
                          try{OutputStream o=response.getOutputStream();
                          o.write(photo);
                          o.flush();
                          o.close();}catch(Exception e){}*/
                          //out.print(photo); %>
                      </th> 
              </tr>
             
                  
        <th colspan="5">Roll number:<%=stud.getRollno() %>&nbsp;&nbsp;&nbsp;&nbsp; Name:<%=stud.getS_name() %><br>Programme :<%String s=stud.getProgramme(); String fName=AdminCon.retriveBranchFullName(s); out.print(fName);%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; T-<% int t=StudCon.getStudTerm(stud.getTerm(),stud.getYear()); out.print(t);%></th>
        
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
                            <td><center><%= ++cnt %></center></td>
                            <td><center><%=cou_code%></center></td> 
                            <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                            <td><center><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></center></td>  
                            <td><center><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></center></td>  
                            <td><center><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></center></td>  
                            <td><center><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></center></td>  
                            <td><center><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></center></td>
                        </tr>
                        <%
                            } 
                        %>
                        <tr><td  colspan="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<!--img src="../Images/<%=rollno+"Sign"%>.png" width="94" height="20"-->
                              <img src="../Sign/<%=rollno%>.jpg" width="94" height="20">
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <img src="../Sign/WankhedeSir.jpg" width="94" height="20">
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;______________&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(Prof.G.G.Wankhede)
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Candidate's Signature
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Controller of Examination
                            <br>Note :1)This is Provisional course Registration.Min 75% attendance
                            & satisfactory Termwork/Practical submission is<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; necessary for final grant of term.<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>2)Preserve this document carefully.It is required at the time of Examination Registration 
                                & Periodic Test.</b><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>3)Contact Controller of Examinations for type of discripancy/error observed in the above details.</b>
                                <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4)Dates to remember - &nbsp;&nbsp;&nbsp;&nbsp;Examination Registration - <b><%=ad.getExamination_reg_date()%></b><br>&nbsp;&nbsp;&nbsp;&nbsp;
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;First Periodic Test - <b><%=ad.getFirst_PT_date()%></b>&nbsp;&nbsp;&nbsp;&nbsp;
                                Second Periodic Test - <b><%=ad.getSecond_PT_date()%></b><br>
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;End of Term - <b><%=ad.getEnd_of_term()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                OR/PR/TW Exam - <b><%=ad.getOr_pr_tw_exam_date()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                Final Summer Examination - <b><%=ad.getFinal_exam_date()%></b><br>
                            </td></tr>
                       
    </table>
    </div>
    <div id="editor"></div>
    <br><br><br>
                    <script>
                        
         /*let doc = new jsPDF('p', 'pt', 'a4');
         var handler={'#editor':function(element,renderer){return true;}};
         
    
    doc.fromHTML($('#HallTicket').html(),15,15,{
             'width':170,'elementHandlers':handler
         }); 
         
         //doc.addHTML(document.body, function () {  
           doc.save('file.pdf');
           //this.saveAs("C:\Users\sarvadnya\Documents\NetBeansProjects\Registration_system_final\web\Images\file.pdf");  */         
          let doc = new jsPDF('p', 'pt', 'a4'); 
         doc.addHTML(document.body, function () {
             doc.save('file.pdf');
         });


    </script>
                       <% }
                    }//if close for hallTicketType=pt
        else if(hallTicketType.equals("final")) 
        {
            System.out.print("______________________________________entered to generate final HT ...........");
            String rollno1=request.getParameter("roll_number");
            System.out.print("___________________ROLL = "+rollno1);
            stud=(Student_data)StudCon.getStudentInfo(rollno1);
            System.out.print("______________________________________out of method call");
            List couCode=AdminCon.generateIndividualFinalHallTicket(rollno1, stud.getProgramme(), stud.getYear(),stud.getTerm());
            System.out.print("__________________________generateIndividualFinalHallTicket _______________");
            if(couCode.size()>0)
            { 
            //Returns course object for each cou_code in couCode list.
System.out.println("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ENTERED IN IF");
            %>
            <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/0.4.1/html2canvas.js"></script>
            <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.0.272/jspdf.debug.js"></script>
          <div id="HallTicket">  
          <TABLE border="1" cellpadding="5" cellspacing="2" align="center"><br> 
              
            <tr><td colspan="5">&nbsp;&nbsp;&nbsp;Roll Number&nbsp;&nbsp;&nbsp;:<b><%=stud.getRollno()%></b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Examination:<b><%if(term.equals("ODD"))
                                  {
                                      out.print("WINTER-"+year);
                                  }
                                  else
                                  {
                                      out.print("SUMMER-"+(year+1));
                                  }%></b><br>&nbsp;&nbsp;&nbsp;Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:<%=(stud.getS_name()).toUpperCase()%><br>&nbsp;&nbsp;&nbsp;Programme&nbsp;&nbsp;&nbsp;&nbsp;:<%=stud.getProgramme()%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  </td>
               <td colspan="3"><center><img src="../Images/<%=rollno1%>.jpg" width="67" height="73"></center></td>
                <th rowspan="1" colspan="3">
                          
                          <%
                          /*response.setContentType("image/jpg");
                          try{OutputStream o=response.getOutputStream();
                          o.write(photo);
                          o.flush();
                          o.close();}catch(Exception e){}*/
                          //out.print(photo); %>
                      </th> 
                
                
            </tr>
                       
                      <th width="50"><center>Sr.No</center></th>
                         <th width="100"><center>Course Code</center></th> 
                       <th><center>Course Name</center></th>
                       <th width="30"><center>TH</center></th>
                       <th width="30"><center>PT</center></th>
                       <th width="30"><center>TW</center></th>
                       <th width="30"><center>PR</center></th>
                       <th width="30"><center>OR</center></th>  
                         
                        <% //for(Object obj2: couCode)
                            for(int k=0;k<couCode.size();k++)
                        {
                            examReg=(Exam_reg)couCode.get(k);
                            //cou_code=(String)couCode.get(k);
                            System.out.println("course code:================"+examReg.getCourse_code());
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
                        <tr><td  colspan="8">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;________________
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Sign/<%=rollno1%>.jpg" width="140" height="35">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Sign/WankhedeSir.jpg" width="94" height="20">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<b>(Prof.Girish.Gajanan.Wankhede)</b>
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
    </div>
    <div id="editor"></div>
   
                       <% }//for close
        }//else if close for hallTicketType=final
}
%>
                

    </body>
</html>
