<%-- 
    Document   : courseRegPrint
    Created on : Jun 16, 2019, 7:11:50 PM
    Author     : Shubham Nehe
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Arrays"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
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
    <body>
        <% if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("registrar_user").equals("registrar")) 
           { String homePath=""; int year=-1,shift=-1;
               String term=null;
               try{
               Admin_data ad=AdminCon.getAdminInfo();
                String term_year=ad.getReg_term_year();
                List studRollnos;
                List<StudCon.studRegList> list1=new ArrayList<StudCon.studRegList>();
//               Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("studroll"));
              
                    List<StudCon.studRegList> list=new ArrayList<StudCon.studRegList>();
                if(session.getAttribute("inAllRegularCourse")=="yes")
                {    
                list=StudCon.getstudRegList((List)session.getAttribute("studList"));
                studRollnos=(List)session.getAttribute("studList");}
                else{ 
                List li=Arrays.asList((String)session.getAttribute("studroll"));
                studRollnos=li;
                list=StudCon.getstudRegList(li);
                 }
                StudCon.studRegList stud=(StudCon.studRegList)list.get(0);
                List<Courses> clist=StudCon.studRegCourse(stud.getRoll(),stud.getTerm(),stud.getYear());
                List<String> regCourses=new ArrayList<String>();
                for(Courses c:clist)
                {
                    regCourses.add(c.getCourse_code()); 
                }
               int count=0;
                
        %>
       <jsp:include page="../headerforallPanelviews.jsp"/>
       <% %> <div class="container"> 
           <a href='studRegList.jsp' id="BackBtn" value="back" class="btn btn-primary">Back</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
           
            <!--div id="demo"><h2>Registration print</h2> </div-->
            <%for(Object studroll:studRollnos){
               
            %>
           
               <div class="row"> 
                   <div class="col-lg-1"></div> 
                   <div class="col-lg-2">  
                           <img style='float:left;' src="../../Images/gpnlogo1.png" alt="Image not found!" height="80" width="100">
                   </div>
                   <div class="col-lg-4" style='float:center'> <br>
                       <center><h5><b>GOVERNMENT POLYTECHNIC NASHIK</b></h5>
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
                          <h6> <%Object a=list.get(count);
                                 StudCon.studRegList s=(StudCon.studRegList)a;
                                 if(((String)studroll).equals(s.getRoll())){
                               
                              
                              %>
                              Roll No. : <%=s.getRoll() %><br>
                              Name : <%=s.getStud_name().toUpperCase() %><br>
                              Branch : <%= s.getProgramme() %>  &nbsp &nbsp     
                              Year : <%=s.getYear() %>  &nbsp &nbsp
                              Term : <%= s.getTerm() %> <br>
                             <% year=s.getYear();
                                term=s.getTerm();
                                shift=s.getShift();
                                 
                              
                             
                                 }
                             
                             %>
                          </h6> 
                    </div> 
                    <div style='clear: right'></div>
                </div> 

                <div class="row">
                    <div class="col-lg-1"></div>
                    <div class="col-lg-11">                   
                        To, <br>
                        The Principal, <br>
                        Government Polytechnic, <br>
                        Nashik-422 101. <br>
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
                            <th>C_Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>Course Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>CR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>PT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>PR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>OR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            </thead> 

                            <% 
                              
                             
//                               Courses course;
                                 int listSize=0;           
                                while(count!=list.size()&&list.get(count).getRoll().equals((String)studroll))
                                {
//                                    Course_reg coursereg=(Course_reg)courseReg;
//                                    course=CourseCon.getCourseObject(coursereg.getCourse_code());
                                   StudCon.studRegList ss=(StudCon.studRegList)list.get(count);
                                   
                                   if(regCourses.contains(ss.getCourse_code()))
                                   {        
                            %>
                            <tr>
                                <td><%=ss.getCourse_code() %></td> 
                                <td><%=(ss.getCourse_name()).toUpperCase()%></td> 
                                <td><%=ss.getCou_credit() %></td> 
                                <td><%if(ss.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                        </tr>
                            <%      ++listSize;
                                    }else
                                    {
                                        list1.add(ss);
                             %>
                            <tr>
                                <td><%=ss.getCourse_code() %></td> 
                                <td><%=(ss.getCourse_name()).toUpperCase()%></td> 
                                <td><%=ss.getCou_credit() %></td> 
                                <td><%if(ss.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                                <td><%if(ss.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                                        </tr>
                            <%
                                    }
                              count++;
                              
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
                            <th>C_Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>Course Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>CR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>PT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>PR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>OR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            </thead> 
                            <tbody>
                                <tr>
                                    <td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td><td></td><td></td><td></td><td></td><td></td><td></td><td></td>
                                </tr>
                              
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
                            <th>C_Code&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>Course Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>CR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TH&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th> 
                            <th>PT&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>PR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>TW&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
                            <th>OR&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
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
                         &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp &nbsp
                          &nbsp &nbsp &nbsp &nbsp
                        Signature of Applicant :
                    </div>
                </div>

                <center><b>CERTIFICATE</b></center>
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
                                    <td><%= listSize %></td>
                                    <td>0</td>
                                    <td><%= listSize %></td>
                                    <td><%=list1.size()%></td>
                                    <td><%=listSize+list1.size()%></td>
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
                  <%if(listSize<7){%><br><br>
                            <%}%>
                
                <%}catch(Exception e){System.out.print("_______Exception = "+e);}
}
  
}catch(Exception e)
            {out.print(e);
                System.out.println("-------------------------------outer catch------------------------------------------"+e);
            }
        %><div class="row">                         
                       <form method="post">  
                           <div class="col-sm-2">      
                                <input type="button" id="printBtn" value="Print" onClick="printpage()" class="btn btn-lg btn-primary pull-left"> 
                           </div> 
                           <div class="col-sm-3">
                               <% homePath="studRegList.jsp";%>
                               
                               <button id="homeBtn" value="Home" formaction="<%=homePath%>" class="btn btn-lg btn-primary">Home</button>
                           </div>
                       </form> 
                </div> <%}
        else
        {
            response.sendRedirect("../../index.jsp");
        }%> 
           
        <script type="text/javascript">
        function printpage() 
        {   var btn3=document.getElementById('BackBtn'); 
            btn3.style.display='none';
            
            var btn=document.getElementById('printBtn'); 
            btn.style.visibility='hidden';
            var btn1=document.getElementById('homeBtn');  
            btn1.style.visibility='hidden';
            window.print();   
            btn.style.visibility='visible';
            btn1.style.visibility='visible';

                btn3.style.display='inline-block';
        } 
    </script>
    </body>
</html>