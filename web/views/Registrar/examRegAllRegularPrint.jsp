<%-- 
    Document   : examRegAllRegularPrint
    Created on : 24 May, 2021, 11:19:33 PM
    Author     : SHWETA
--%>

<%@page import="java.util.ArrayList"%>
<%response.setHeader("Cache-Control","no-cache,must-revalidate");%>
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
                margin: 13mm 12mm 13mm 12mm;
                }
            
            img{
               transition: none;          
            }
        </style> 
    </head>
    <body>      <jsp:include page="../headerforallPanelviews.jsp"/>
        
        
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
                Student_data stud=null;
                List<String>studLi=new ArrayList<String>();
                studLi=(List)session.getAttribute("EstudList");
                 String homePath="";
                int m=0;
           %> <div class="container"> <%     
                 for(int t=0;t<studLi.size();t++){
                    
                  stud=(Student_data)StudCon.getStudentInfo((String)studLi.get(t));
                
              
        if(m==0){%> 
        <a href='studRegList.jsp' id="BackBtn" class="btn btn-primary">Back</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
          <% homePath="studRegList.jsp";%>
          <% }
            m=1;%>
        
         <!--Examination Registration print started-->
            <div id="examRegPrint" >
                <div class="row"> 
                   <div class="col-lg-1"></div> 
                   <div class="col-lg-2">  
                           <img style='float:left;' src="../../Images/gpnlogo1.png" alt="Image not found!" height="80" width="100">
                   </div>
                   <div class="col-lg-4" style='float:center'>
                       <center>
                           (Application for Examination Registration)<br>
                            <h4>GOVERNMENT POLYTECHNIC NASHIK</h4>
                               <h6>(An Autonomous Institute Of Government Of Maharashtra)</h6>
                        </center>  
                    </div> 
                    <div style="clear:left;"></div>
               </div>

                   <% //Retrieving student information
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

               </div>

                  
                <% if(list.size()<=6){%><br>
                            <%}}catch(Exception e){System.out.print("_______Exception = "+e);}%>
            <%  }%> <div class="row">                         
                       <form method="post">  
                           <div class="col-sm-2">      
                                <input type="button" id="printBtn1" value="Print" onClick="printpage()" class="btn btn-lg btn-primary pull-left"> 
                           </div> 
                           <div class="col-sm-3">
                                <button id="homeBtn1" value="Home" formaction="<%=homePath%>" class="btn btn-lg btn-primary">Home</button>
                           </div>
                       </form> 
                </div></div> <% }catch(Exception e)
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
        
            var btn1=document.getElementById('BackBtn'); 
            btn1.style.display='none';
            var btn3=document.getElementById('printBtn1'); 
            btn3.style.visibility='hidden';
            var btn4=document.getElementById('homeBtn1');  
            btn4.style.visibility='hidden';
            
            window.print();   
            btn1.style.display='inline-block';
            btn3.style.visibility='visible';    
            btn4.style.visibility='visible';
            //demo.style.visibility='visible';
            
        } 
    </script>
</html>