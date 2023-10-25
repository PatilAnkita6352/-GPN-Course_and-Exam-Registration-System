<%-- 
    Document   : studRegistration
    Created on : Feb 21, 2019, 3:07:30 PM
    Author     : sarvadnya
--%>
<%@page import="mainController.StudentCoursesCon"%>
<%@page import="beans.StudentCourses"%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="mainController.CourseCon"%>
<%@page import="beans.Admin_data"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.awt.CheckboxGroup"%>
<%@page import="beans.Exam_reg"%>
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
        <link rel="stylesheet" href="../../assets/css/bootstrap-select.min.css">
        <script src="../../assets/js/jquery.min.js"></script>
        <script src="../../assets/js/bootstrap.min.js"></script>
        <script src="../../assets/js/bootstrap-select.min.js"></script>
        <script src="ajax"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Panel</title>
        <script type="text/javascript">
                var courses=new Array();
                var ischecked=false;
                //Reading the available course array into javascript array named courses.
                courses=document.getElementsByName("course[]");
                
                //Checking if any checkbox is checked to enable the save and register buttons.
                for(var i=0;i<courses.length;i++)
                {
                        if(courses[i].checked)
                        {
                                ischecked=true;
                                break;
                        }
                }
                document.getElementById('save').disabled=!ischecked;
                
            //this function is used to enable and disable buttons when courses are selected
            
            function onBtn(ch) 
            {
                    var courses=new Array();
                    var ischecked=false; 
                    courses=document.getElementsByName("course[]");
                    for(var i=0;i<courses.length;i++)
                    {
                        if(courses[i].checked)
                            {
                                    ischecked=true;
                                    break;
                            }
                    }
                    document.getElementById('save').disabled=!ischecked;
                    
            }
            //this function is used to check all buttons
            function checkAll()
            {
                var count=0,flag=false;        
                for(var i=0;i<courses.length;i++)
                {
                    if(courses[i].checked==true)
                        count++;
                } 
                if(count==courses.length)
                    flag=false;
                else
                    flag=true;
                for(var i=0;i<courses.length;i++)
                {
                    courses[i].checked=flag; 
                }
                onBtn();
            }
            function backlog(coursecode,j)
            {
                document.getElementsByName('courseB[]')[j].value=coursecode;
            }
            
            function setBacklog()
            {
                var j=document.getElementsByName("courseB[]").length;
                for(var k=0;k<j;k++)
                {
                    var courses=document.getElementsByName('courseB'+k);
                    
                    for(var i=0;i<courses.length;i++)
                    {    
                        if(courses[i].checked===true)
                        {   
                            document.getElementsByName('courseB[]')[k].value=document.getElementsByName('courseB'+k)[i].value;            
                        }
                    }
                }
            }
        </script>
    </head>
    <body onload="setBacklog()">
        
        <jsp:include page="../headerforallPanelviews.jsp"/>
   
         <% 
            if(session.getAttribute("stud_uname")==null || session.getAttribute("stud_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("stud_user").equals("student")) 
           {   
               
               //to check whether registration is started by HOD or not
               if(HodCon.getRegStatusForStud((String)session.getAttribute("stud_uname")))
               {
               //to get all information of student 
               Student_data stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("stud_uname"));
               
               //To get Exam registration status of student
               if(!StudCon.getExRegStatus((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear()))
               {System.out.println("hiiiiiii");
                int isYes=0,isNo=0,flag1=0,isExReg=0,isConfirm=0;
                //msg variable comes from saveOrRegCourse.jsp file when student is trying to register more than 10 subjects
               try{String msg=request.getParameter("msg");            
               if(!msg.equals(null))%><p class="alert alert-danger"><%out.print(msg);%></p><%}catch(Exception e){}
               
               //flag variable comes from saveCourse.jsp
               String flagS=null;
               flagS=request.getParameter("flag");
               try{if(!flagS.equals(null)){ flag1=1;
               }}catch(Exception e){} 
               
               //this list contains registered courses by student for current term and year
               List list=null;
               try{
                    list=StudCon.getRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm() ,stud.getYear()); 
               }catch(Exception e){System.out.print("///////////////////////getRegCourse throw exc in studRegistration.jsp.");}

               
               for(Object obj:list)
                {
                    Course_reg coursereg=(Course_reg)obj;
                    if(coursereg.getReg_can().equals("nd"))
                        isYes=isYes+1;
                    else if(coursereg.getReg_can().equals("y"))
                        isNo=isNo+1;
                    else if(coursereg.getReg_can().equals("n"))
                        isConfirm=isConfirm+1;
                }System.out.println("list size......................."+isNo);
               List listEx=StudCon.getExRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm() ,stud.getYear()); 
               for(Object obj:listEx)
               {
                   Exam_reg ex=(Exam_reg)obj;
                    if(ex.getEx_cancel()==1)
                        isExReg=isExReg+1;
               }
                //deciding whether to move for regCourse.jsp, saveCourse.jsp,printRegistration.jsp or continue on student panel

                //check if student want to edit courses or student haven't register any course
                if(flag1==1||(list.size()==0))
                {
                try{ 
                 
                int j=1;//to print index numbers 
                StudentCourses backCourseResult;
                //list1 gives available courses for student.
                List list1=StudCon.studRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear());
                //list2 gives courses which are registered by student.
                List list2=StudCon.getRegCourse((String)session.getAttribute("stud_uname"),stud.getTerm(),stud.getYear());
                //List3 gives backlog courses
                List list3=StudCon.getBackCourse((String)session.getAttribute("stud_uname"));
                //List4 gives pending courses
                List list4=null;
                if(stud.getYear()!=1)
                list4=StudCon.getPendingCourse((String)session.getAttribute("stud_uname"));
                
                String statusChk="unchecked",statusBtn="false",disabledChk="false";

                //If no courses are offered then show message
                if(list1.size()!=0)
                {
                %>
                
                <!Regular courses-->
                
             <h1>Welcome to Course Registration</h1>
             <br>
             (Note: Here Course Registration will only be SAVED. (won't be confirmed) )
             <center>
             <h2>Regular Courses</h2>
             <form method="POST" name="courses">
             <table border="1" class="table">
                 <thead>
               <tr>
            <th rowspan="2" style="text-align: center; padding-bottom: 20px; ">Sr.no</th> 
            <th rowspan="2" style="text-align: center;padding-bottom: 15px;" >Select Version</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 15px;">Course Code</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">Course Name</th>
            <th  colspan="4" style="text-align: center;"> Credits</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">TH</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">PT</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">PR</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">TW</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">OR</th>
            <th rowspan="2" style="text-align: center;padding-bottom: 20px;">Curriculum</th>
            </tr>
            <tr>
                
                <th >TH</th>
                <th >PR</th>
                <th >TU</th>
                <th>Total</th>
                
            </tr>
                 </thead>
                 
              <%if(stud.getS_regular().equals("d") && stud.getYear()==2)
              {  
                  StudCon.regDsyFirstYearCourses((String)session.getAttribute("stud_uname"),stud.getProgramme(),stud.getTerm());                
              }
              %>
                 
                 <%
                //Using for each loop for showing available courses.
                
                for(Object obj1:list1)
                {
                    Courses course=(Courses)obj1;
                    if(list2!=null) 
                    {
                        for(Object obj2:list2)
                        { 
                            Course_reg coursereg=(Course_reg)obj2;
                            
                            if((course.getCourse_code()).equals(coursereg.getCourse_code().trim()))
                            { 
                                //if course is already confirmed by student then it will be checked and disabled
                                if(coursereg.getReg_can().equals("n"))
                                  disabledChk="disabled";
                               else
                                disabledChk="";
                                //if course is already regestered by student then it will be checked
                                statusChk="checked";
                                statusBtn="false";
                                break;
                            } 
                            else
                            {
                                disabledChk="";
                                statusChk="unchecked";
                                statusBtn="true";
                            }
                           
                        } 
                     
              %>  
                <tr> 
                <td><%=j++%></td> 
                <td><input type="checkbox" name="course[]" value="<%=course.getCourse_code()%>" <%=statusChk%> onchange="onBtn()" <%=disabledChk%> ></td>
                <td><%=course.getCourse_code()%></td> 
                <td><%=course.getCourse_name()%></td>  
                <td><%=course.getCou_th_credits()%></td>
                <td><%=course.getCou_pr_credits()%></td>
                <td><%=course.getCou_tu_credits()%></td>
                <td><%=course.getCou_credit() %></td>  
                <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                <td><%=course.getCurriculum()%></td>
                </tr> 
              <%   }//if closing
                 
                }//for closing
             %>         
        </table>
        <a name="checkAll" class="btn btn-primary"  onclick="checkAll()">Check All</a> <br><br>
             <!Backlog courses-->
         <%   
             if(list3.size()==0)
             {}
             else 
             { %>
             <table border="1" class="table">
            <thead>
            <th>Sr.no</th> 
            <th>Select Version</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Credits</th> 
            <th>TH</th>
            <th>PT</th>
            <th>PR</th>
            <th>TW</th>
            <th>OR</th>
            <th>Curriculum</th>
            </thead>
             <h2>Backlog Courses</h2>
             <% 
                j=0;
                List<ArrayList<Courses>>backList=CourseCon.getBacklogForReg(list3);
                
                  for(ArrayList<Courses> aCr:backList)
                  {
                        //Course_reg coursereg=(Course_reg)obj;
                        //Courses course=CourseCon.getCourseObject(coursereg.getCourse_code().trim());
                    %><tr> 
                        <td rowspan="<%=aCr.size()%>"><%=j+1%></td>  
                        <input type="checkbox" name="courseB[]" hidden checked value="<%=j%>">
                        <%
                        
                        for(Courses course:aCr)
                        {   if(course.getCourse_code().equals(aCr.get(0).getCourse_code()))   
                            {statusChk="checked";}
                            else
                            {statusChk="unchecked";}
                            
                            backCourseResult=StudentCoursesCon.getStudCourseResult((String)session.getAttribute("stud_uname"), course.getCourse_code());
                            if(list2.size()!=0) 
                            {
                                for(Object obj2:list2)
                                { 
                                    Course_reg coursereg=(Course_reg)obj2;

                                    if((course.getCourse_code()).equals(coursereg.getCourse_code().trim()))
                                    { 
                                        statusChk="checked";
                                        statusBtn="false";
                                        break;
                                    } 
                                    else
                                    {
                                        statusChk="unchecked";
                                        statusBtn="true";
                                    }

                                }
                                
                            }
                    %>
                    
                    <td><input type="radio" name="courseB<%=j%>" <%=statusChk%> value="<%=course.getCourse_code()%>" onchange="backlog('<%=course.getCourse_code()%>',<%=j%>)"></td>       
                    <td><%=course.getCourse_code()%></td> 
                    <td><%=course.getCourse_name()%></td> 
                    <td><%=course.getCou_credit() %></td>  
                    <td><%if(course.getCou_th_min()>0 && course.getCou_th_max()>0){ if(backCourseResult.isTheoryIsPass())out.print("PASS"); else { out.print("Y");}} else out.print("--");%> </td>  
                    <td><%if(course.getCou_pt_min()>0 && course.getCou_pt_max()>0){ out.print("PASS");} else out.print("--");%> </td>  
                    <td><%if(course.getCou_pr_min()>0 && course.getCou_pr_max()>0){ if(backCourseResult.isPracticalIsPass())out.print("PASS"); else { out.print("Y"); }} else out.print("--");%> </td>  
                    <td><%if(course.getCou_tw_min()>0 && course.getCou_tw_max()>0){ if(backCourseResult.isTermworkIsPass())out.print("PASS"); else { out.print("Y"); }} else out.print("--");%> </td>  
                    <td><%if(course.getCou_or_min()>0 && course.getCou_or_max()>0){ if(backCourseResult.isOralIsPass())out.print("PASS"); else { out.print("Y"); }} else out.print("--");%> </td>               
                    <td><%=course.getCurriculum()%></td>
                </tr> 
                
             <% }//inner for close
                j++;
                }//for close
            }//outer if close
                    %>
               </table>     
              <%try{
              if(list4.size()>0){
              %>      
             <!Pending courses-->
             <h2>Pending Courses</h2><hr>
            
            <select class="selectpicker" data-live-search="true" name="cname">
                
             <%
               for(Object obj1:list4)
                {
                    Courses course=(Courses)obj1;  
               %>    
             <option value="<%=course.getCourse_name()%>|<%=course.getCourse_code()%>|<%=course.getCou_credit()%>|<%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %>|<%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %>"><%=course.getCourse_name()%></option>
             <%
                }
                 %>
             </select>
             <button type="button" class="btn btn-success" id="btn-add" onclick="addCourse();">Add Course</button>
             
             
             <!--Pending course table trial-->
             <center><br><br>
             <table id="ptable" class="table" border="1">
             <thead>
            <th>Sr.no</th> 
            <th>Select Course</th>
            <th>Course Code</th>
            <th>Course Name</th>
            <th>Credits</th>
            <th>TH</th>
            <th>PT</th>
            <th>PR</th>
            <th>TW</th>
            <th>OR</th>
            <th>Delete</th>
             </thead>
             <tbody>
                 
             </tbody>
             </table>
                 <script src="ajax"></script>
             </center>
             <%}}catch(Exception e){System.out.print("__________________________________(Pending course list found empty)Exception "+e);}%>
             <!--trial end -->
             <br><br><button class="btn btn-primary" formaction="../../Controller/saveOrRegCourse.jsp?flag=save&user=student" id="save" disabled="<%=statusBtn%>">Save</button> 
             <!--Course registration will only be saved means reg_can column in database table will be set as 'y' so as to 
             specify that it's done by student and not registrar-->
            </form>
             <% }//if close(list1)
                else
            {
            %><br><h1> <%out.print("No courses are offered yet!");%></h1><%
            }
              }//try close
            catch(Exception e)
            {out.print(e);}
            %>
             
               
    </center> 
        <%
            } //inner else closing
            else if(isExReg==listEx.size()&&isExReg>0)
                            response.sendRedirect("printRegForStud.jsp");
            else if(isYes==list.size()&&isYes>0)
                            response.sendRedirect("regCourse.jsp");
            else if(isNo>0)
                            response.sendRedirect("saveCourse.jsp");
            else if(isConfirm==list.size()&&isConfirm>0)
                            response.sendRedirect("regCourse.jsp");
            }
            else
            {
                response.sendRedirect("printRegForStud.jsp");
            }
        }
            else
            {
        %><h1>Sorry, but registration not started yet!</h1><%
          }
        } //else closing used for session checking.   
        %> 
        
    <!--############################## JAVASCRIPT ####################################-->    
   
    <script type="text/javascript">
        var j=0;
        var courses=new Array();
                var ischecked=false;
                //Reading the available course array into javascript array named courses.
                courses=document.getElementsByName("course[]");
                
                //Checking if any checkbox is checked to enable the save and register buttons.
                for(var i=0;i<courses.length;i++)
                {
                        if(courses[i].checked)
                        {
                                ischecked=true;
                                break;
                        }
                }
                document.getElementById('save').disabled=!ischecked;
    function addCourse()
    { 
        var v=document.courses.cname.value; 
        var x=v.split("|",8);
        
        var tr = document.createElement('tr');
        
        var td1 = tr.appendChild(document.createElement('td'));
        var td2 = tr.appendChild(document.createElement('td'));
        var td3 = tr.appendChild(document.createElement('td'));
        var td4 = tr.appendChild(document.createElement('td'));
        var td5 = tr.appendChild(document.createElement('td'));
        var td6 = tr.appendChild(document.createElement('td'));
        var td7 = tr.appendChild(document.createElement('td'));
        var td8 = tr.appendChild(document.createElement('td'));
        var td9 = tr.appendChild(document.createElement('td'));
        var td10 = tr.appendChild(document.createElement('td'));
        var td11 = tr.appendChild(document.createElement('td'));
        td1.height="40";
        td1.innerHTML =++j;
        td2.innerHTML="<input type='checkbox' name='courseP[]' value='"+x[1]+"' onchange='onBtn()'>";
        td3.innerHTML=x[1];
        td4.innerHTML=x[0];
        td5.innerHTML=x[2];
        td6.innerHTML=x[3];
        td7.innerHTML=x[4];
        td8.innerHTML=x[5];
        td9.innerHTML=x[6];
        td10.innerHTML=x[7];
        td11.innerHTML="<input type='button' value='Delete' onclick='delCourse(this)' class='btn btn-danger'>";
        document.getElementById("ptable").appendChild(tr);
    }
    function delCourse(course)
    {
        var cou=course.parentNode.parentNode;
        cou.parentNode.removeChild(cou);
    }
    
    </script>
    
    <%@include file="../../footer.jsp" %> 
    </body>
</html>
