<%//response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.AdminCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="beans.Courses"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Course_reg"%>
<%@page import="java.util.List"%>
<%@page import="mainController.StudCon"%>
<%@page import="beans.Student_data"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration</title>
        <link rel="stylesheet" href="../../assets/css/bootstrap.min.css">
        <script src="../../assets/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <style>
            table,th{
                text-align: center;
            }
            @page{
                size:a4 portrait;
            }
            img{
               transition: none;          
            }
        </style> 
    </head>
    <body>
        <%
            
            if (session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            
               
        
            } else if(session.getAttribute("registrar_user").equals("registrar")) 
           {
               System.out.print("&*&*Now in printRegistration.jsp");
               try{
               Admin_data ad=AdminCon.getAdminInfo();
                String term_year=ad.getReg_term_year();
               Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("studroll"));
               String homePath="";
        %>
      <jsp:include page="../headerforallPanelviews.jsp"/>
        <div class="container"> 
            <!--div id="demo"><h2>Registration print</h2> </div-->
            <a href='studRegList.jsp' id="backBtn" class="btn btn-primary">Back</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#courseRegPrint" class="btn btn-primary" id="courseRegPrintBtn" data-toggle="collapse">Course Registration Print</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <a href="#examRegPrint" class="btn btn-primary" id="examRegPrintBtn" data-toggle="collapse">Exam Registration Print</a>
           
            <div id="courseRegPrint" class="collapse">
               <div class="row"> 
                   <div class="col-lg-1"></div> 
                   <div class="col-lg-2">  
                           <img style='float:left;' src="../../Images/gpnlogo1.png" alt="Image not found!" height="80" width="100">
                   </div>
                   <div class="col-lg-4" style='float:center'> 
                        <center><h4>GOVERNMENT POLYTECHNIC NASHIK</h4>
                               <h6>(An Autonomous Institute Of Government Of Maharashtra)</h6>
                        </center>  
                    </div> 
                    <div style="clear:left;"></div>
               </div>

                   <% 
                   try{ 
              %> 

              <!--Printing student details--> 
                <div class="row">
                    <div class="col-sm-8"></div>
                    <div class="col-sm-4" style="float:right;">
                          <h5> 
                              Roll No. : <%=stud.getRollno() %><br>
                              Name : <%=stud.getS_name().toUpperCase() %><br>
                              Branch : <%= stud.getProgramme() %> <br>    
                              Year : <%=stud.getYear() %>  &nbsp &nbsp
                              Term : <%= stud.getTerm() %> <br>
                              Mobile No : <%=stud.getPhone_no()%> <br>
                              Email : <%=stud.getS_email()%>
                          </h5> 
                    </div> 
                    <div style='clear: right'></div>
                </div> 

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">                   
                        To <br>
                        The Principal <br>
                        Government Polytechnic <br>
                        Nashik-422101. <br>
                        Sir,<br>
                        I the undersigned hereby apply for registering to following courses with Government Polytechnic Nashik. The   
                        
                        entries made are correct and complete to the best of my knowledge.
                </div>
                    </div>
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <b>2-(a) I wish to register for the following courses.</b>
                        <table border="1" text-align="center">
                            <thead>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Credits</th>
                            <th>Theory</th>
                            <th>Periodic Test</th>
                            <th>Practical</th>
                            <th>Term Work</th>
                            <th>Oral</th>
                            </thead> 

                            <% 
                               List list=StudCon.getRegularRegCourses(stud.getRollno(),stud.getTerm(),new Integer(stud.getYear()));
                               List list1=StudCon.getBacklogRegCourses(stud.getRollno(),stud.getTerm(),new Integer(stud.getYear()));
                               List list2=StudCon.getDetainRegCourses(list1);
                               list1.removeAll(list2);
                               int total=list.size()+list1.size()+list2.size();
                             
                               Courses course;
                                for(Object courseReg:list) 
                                {
                                    Course_reg coursereg=(Course_reg)courseReg;
                                    course=CourseCon.getCourseObject(coursereg.getCourse_code());

                            %>
                            <tr>
                                <td><%=coursereg.getCourse_code()%></td> 
                                <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                                <td><%=course.getCou_credit() %></td> 
                                <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                        </tr>
                            <%
                                } 
                                
                                for(Object courseReg:list1) 
                                {
                                    Course_reg coursereg=(Course_reg)courseReg;
                                    course=CourseCon.getCourseObject(coursereg.getCourse_code());

                            %>
                            <tr>
                                <td><%=coursereg.getCourse_code()%></td> 
                                <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                                <td><%=course.getCou_credit() %></td> 
                                <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                        </tr>
                            <%
                                } 
                            %>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-8">
                        <b>2-(b) I wish to Re-Register for the following courses, in which I was detained(ds) previously.</b>
                        <table border="1"> 
                            <thead>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Credits</th>
                            <th>Theory</th>
                            <th>Periodic Test</th>
                            <th>Practical</th>
                            <th>Term Work</th>
                            <th>Oral</th>
                            </thead> 
                            <tbody>
                                <%
                                for(Object courseReg:list2) 
                                {
                                    Course_reg coursereg=(Course_reg)courseReg;
                                    course=CourseCon.getCourseObject(coursereg.getCourse_code());

                            %>
                            <tr>
                                <td><%=coursereg.getCourse_code()%></td> 
                                <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                                <td><%=course.getCou_credit() %></td> 
                                <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                        </tr>
                            <%
                                } 
                            %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-8">
                        <b>2-(c) I wish to Register for the following Non Exam Credit Course</b>
                        <table border="1">
                            <thead>
                            <th>Course Code</th>
                            <th>Course Name</th>
                            <th>Credits</th>
                            <th>Theory</th> 
                            <th>Periodic Test</th>
                            <th>Practical</th>
                            <th>Term Work</th>
                            <th>Oral</th>
                            </thead> 
                            <tbody>
                                <tr>
                                    <td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div><br>

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-7"> 
                        Date : <% 
                            Date date=new Date();
                            SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                            out.print(f.format(date));
                        %>
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        Signature of Applicant :
                    </div>
                </div>

                <br><center><b>CERTIFICATE</b></center>
                <div class="row">
                    <p>&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp 
                    Certified that the relevant documents for eligibility for admission to this term in respect to above applicant are checked and is eligible to 
                    register with <b>Government Polytechnic Nashik</b> for the courses mentioned above.
                </div>

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <table border="1">
                            <thead>
                            <th>No.of Courses Register(1)</th>
                            <th>No.of Courses Re-register(2)</th>
                            <th>Total Courses(3)</th>
                            <th>No. of Backlog Courses(4)</th>
                            <th>Total [3+4]* (5)</th>
                            </thead> 
                            <tbody>
                                <tr>
                                    <td><%= list.size() %></td>
                                    <td><%=list2.size()%></td>
                                    <td><%= list.size() %></td>
                                    <td><%= list1.size() %></td>
                                    <td><%= total%></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                `*Total of COl 3 + Col 4 shall not be more than Eleven.
                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <table border="1">
                            <thead>
                            <th>Total of credits up till last exam(1)</th>
                            <th>Credits of backlog courses(2)</th>
                            <th>Credits of course registered in this form(3)</th>
                            <th>Credits of pending courses(4)</th>
                            <th>Total of 1+2+3+4(5)</th>
                            </thead> 
                            <tbody>
                                <tr>
                                    <td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <br>
                  <div class="pull-right">(Signature of Head of Department)</div> 

                <div class="row">                         
                       <form method="post">  
                           <div class="col-sm-2">      
                                <input type="button" id="printBtn" value="Print" onClick="printpage()" class="btn btn-lg btn-primary pull-left"> 
                           </div> 
                           <div class="col-sm-3">
                               <% homePath="studRegList.jsp";%>
                                <button id="homeBtn" value="Home" formaction="<%=homePath%>" class="btn btn-lg btn-primary">Home</button>
                           </div>
                       </form> 
                </div> 
                <%}catch(Exception e){System.out.print("_______Exception = "+e);}%>
          </div>
          
          
          <!--Examination Registration print started-->
            <div id="examRegPrint" class="collapse">
                <div class="row"> 
                   <div class="col-lg-1"></div> 
                   <div class="col-lg-2">  
                           <img style='float:left;' src="../../Images/gpnlogo1.png" alt="Image not found!" height="80" width="100">
                   </div>
                   <div class="col-lg-4" style='float:center'>
                        <center>
                            (Application for Examination Registration)
                            <h4>GOVERNMENT POLYTECHNIC NASHIK</h4>
                               <h6>(An Autonomous Institute Of Government Of Maharashtra)</h6>
                        </center>  
                    </div> 
                    <div style="clear:left;"></div>
               </div>

                   <% //Retrieving student information
                   //edit button is set with rollno of corresponding user.
                   try{ 
                       int cnt=1; 
              %> 

              <!--Printing student details--> 
                <div class="row">
                    <div class="col-sm-8"></div>
                    <div class="col-sm-4" style="float:right;">
                          <h5>
                              Name : <%=stud.getS_name().toUpperCase() %><br>
                              Roll No. : <%=stud.getRollno() %><br>
                              Branch : <%= stud.getProgramme() %> <br>    
                              Year : <%=stud.getYear() %>  &nbsp &nbsp
                              Term : <%= stud.getTerm() %> <br> 
                              Mobile No : <%=stud.getPhone_no()%> <br>
                              Email : <%=stud.getS_email()%><br>
                              NAD ID:
                          </h5> 
                    </div> 
                    <div style='clear: right'></div>
                </div> 

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">                   
                        To,<br>
                        The Controller of Examination<br>
                        Government Polytechnic, Nashik<br>
                        &nbsp&nbsp&nbsp&nbsp&nbspSub : Registration for Examination <b><%=term_year%></b><br>
                        Sir,<br>
                        &nbsp&nbsp&nbsp&nbsp&nbspI wish to appear for the <b><%=term_year%></b> Examination of the following courses. Kindly permit me.
                    </div>
                </div> 

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-10">
                        <table border="1" text-align="center">
                            <thead>
                                <th>Sr.</th>
                                <th>Course Code</th>
                                <th>Course Name</th>
                                <th>Theory</th>
                                <th>Periodic Test</th>
                                <th>Practical</th>
                                <th>Term Work</th>
                                <th>Oral</th>
                                <th>backlog</th>
                            </thead> 

                            <% 
                               List list=StudCon.getExRegCourse(stud.getRollno(),stud.getTerm(),new Integer(stud.getYear()));
                               //List list1=StudCon.getBackCourse((String)session.getAttribute("uname"));
                               Courses course;
                                for(Object obj:list) 
                                {
                                    Exam_reg exreg=(Exam_reg)obj;
                                    course=CourseCon.getCourseObject(exreg.getCourse_code());
                            %> 
                            <tr> 
                                <td><%=cnt++%></td>
                                <td><%=exreg.getCourse_code()%></td> 
                                <td><%=(course.getCourse_name()).toUpperCase()%></td> 
                                <td><%if(exreg.getEx_th()>0)out.print("Y"); else out.print("X"); %></td>  
                                <td><%if(exreg.getEx_pt()>0)out.print("Y"); else out.print("X"); %></td>  
                                <td><%if(exreg.getEx_pr()>0)out.print("Y"); else out.print("X"); %></td>  
                                <td><%if(exreg.getEx_tw()>0)out.print("Y"); else out.print("X"); %></td>  
                                <td><%if(exreg.getEx_or()>0)out.print("Y"); else out.print("X"); %></td>
                                <td><%if(exreg.getEx_back()!=1){out.print("--");}else{out.print("*");}%></td> 
                            </tr>
                            <%
                                }  
                            %>
                        </table>
                        Total examination fee (Rs. 450 + Rs. 100 per bklg. subject):450
                    </div> 
                </div>

                
               <br><b>NOTE : -<br>
               &nbsp&nbsp&nbsp&nbsp1. The student should check the correctness of his/her name and courses listed above.Also if the<br>
               student has already passed in any of the above courses , he/she shall inform to Examination Cell <br>immediately.</b><br>
               &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp * - Backlog Courses<br>
               &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp Y - Registered for particular head of course.<br>
               &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp X - Not registered for particular head of course.<br>
               
               &nbsp&nbsp&nbsp&nbsp 2. If any Exempted Course is shown in the list above, then contact the examination cell immediately.<br>
               
               <b>&nbsp&nbsp&nbsp&nbsp 3.Students should attach photocopies (Xerox copy) of the last Examination Marksheet and <br>
                   Marksheet of backlog courses along with this form.</b>
               
               &nbsp&nbsp&nbsp&nbsp 4. The Examination fees as mentioned above should be paid through Challan at any branch of Axis Bank.<br>
               &nbsp&nbsp&nbsp&nbsp 5. Student's can registered for Examination of Maximum <%= ad.getMax_reg_courses() %> courses.<br>
               
                   <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-7"> 
                        Date : <% 
                            Date date=new Date();
                            SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
                            out.print(f.format(date));
                        %>
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                        Signature of Applicant : ______
                    </div>
                </div>
                <div class="row"> 
                    The above information filed by the candidate is hereby checked and found correct, Marksheet of previous <br>
                    Examination and respective backlog subjects is attached here with.
                </div>

                <br><div class="pull-right">(Signature of Head of Department)</div> 

                <div class="row">                         
                       <form method="post">  
                           <div class="col-sm-2">      
                                <input type="button" id="printBtn1" value="Print" onClick="printpage()" class="btn btn-lg btn-primary pull-left"> 
                           </div> 
                           <div class="col-sm-3">
                                <button id="homeBtn1" value="Home" formaction="<%=homePath%>" class="btn btn-lg btn-primary">Home</button>
                           </div>
                       </form> 
                </div> 
                </div>  
                <%}catch(Exception e){System.out.print("_______Exception = "+e);}%>
            </div>
            <%   }catch(Exception e)
                {
                    System.out.println("-------------------------------outer catch------------------------------------------");
                }
                }
            else
            {
                response.sendRedirect("../../index.jsp");
            }%>
            
        <script type="text/javascript">
        function printpage() 
        {
           /* var demo=document.getElementById('demo'); 
            demo.style.visibility='hidden';*/
           
            var btn6=document.getElementById('backBtn'); 
            btn6.style.display='none';
            var btn2=document.getElementById('courseRegPrintBtn'); 
            btn2.style.display='none';
            var btn3=document.getElementById('examRegPrintBtn');  
            btn3.style.display='none';
            var btn=document.getElementById('printBtn'); 
            btn.style.visibility='hidden';
            var btn1=document.getElementById('homeBtn');  
            btn1.style.visibility='hidden';
            var btn4=document.getElementById('printBtn1'); 
            btn4.style.visibility='hidden';
            var btn5=document.getElementById('homeBtn1');  
            btn5.style.visibility='hidden';
            window.print();   
            btn.style.visibility='visible';
            btn1.style.visibility='visible';
            btn2.style.display='inline-block';
            btn3.style.display='inline-block';
            btn4.style.visibility='visible';
            btn5.style.visibility='visible';
            btn6.style.display='inline-block';
            //demo.style.visibility='visible';
            
        } 
    </script>
</html>