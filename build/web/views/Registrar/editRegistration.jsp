<%-- 
    Document   : editRegistration
    Created on : Dec 2, 2018, 5:38:12 PM
    Author     : Shubham Nehe
--%>
<%response.setHeader("Cache-Control","no-cache,must-revalidate");%>
<%@page import="mainController.HodCon"%>
<%@page import="beans.Exam_reg"%>
<%@page import="mainController.StudentCoursesCon"%>
<%@page import="beans.StudentCourses"%>
<%@page import="mainController.CourseCon"%>
<%@page import="java.util.ArrayList"%>
<%@page import="beans.Student_data"%>
<%@page import="mainController.StudCon"%>
<%@page import="java.util.List"%>
<%@page import="beans.Course_reg"%>
<%@page import="beans.Courses"%>
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
        <title>Edit Registration</title> 
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">

        <script type="text/javascript">
                var courses=new Array();
                var ischecked=false;
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
                
                document.getElementById('register').disabled=!ischecked;
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
                    document.getElementById('register').disabled=!ischecked;
            }
            
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
        
        <% //checking if user is login or not.
            if(session.getAttribute("registrar_uname")==null || session.getAttribute("registrar_user")==null)
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("registrar_user").equals("registrar")) 
           {
               %><jsp:include page="../headerforallPanelviews.jsp"/><%
               //Displaying flash data.
               try{
                   if(!request.getParameter("result").equals(null)) %>
                   <p class="alert alert-danger"><a href="#" class="close" data-dismiss="alert">&times;</a><% out.print(request.getParameter("result"));%></p>
              <% }catch(Exception e){} 
              String editBtnValue="";
        if(request.getParameter("editBtn")!=null)  editBtnValue=request.getParameter("editBtn");
          if(editBtnValue.equals("coursereg"))
            { session.setAttribute("inAllRegularCourse","yes");
             List<String>studLi=new ArrayList<String>();
           
            //Below mentioned Allstud is a list of students' which is set as session attribute in studregList.jsp file
                for (Object oo:(List)session.getAttribute("Allstud")) 
                {
                                HodCon.StudentReg studo=(HodCon.StudentReg)oo;
                                
                                if(StudCon.getBackCourse(studo.getRollno()).size()==0 
                                    && !HodCon.checkRegStatus(studo.getRollno(),studo.getTerm(),studo.getYear())
                                    && !studo.getS_regular().equals("d"))
                                { studLi.add(studo.getRollno());
                                }
           }
            session.setAttribute("studList",studLi);
            if(studLi.size()!=0){
      
      Student_data stud=(Student_data)StudCon.getStudentInfo(studLi.get(0));
           %>
               <a href='studRegList.jsp'>
                  <button id="BackBtn" value="Back" class="btn btn-lg btn-primary">Back</button></a>
                  <h1>Course Registration for All Regular Students</h1>
           <%   
             //Retrieving Regular Courses
            List list1=StudCon.studRegCourse(studLi.get(0),stud.getTerm(),stud.getYear());
           
       if(list1.size()!=0){%><br><br><form method="POST" action="../../Controller/saveOrRegCourse.jsp" name="courses">
           <table border="1" class="table">
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
            <th>Curriculum</th>
            </thead><%     int j=1; 
            
             for(Object obj1:list1) 
                {
                    Courses course=(Courses)obj1; 
                    %> 
                    
                <tr> 
                    <td><%=j++%></td> 
                    <td><input type="checkbox" name="course[]" value="<%=course.getCourse_code()%>"checked  onchange="onBtn()"></td>
                    <td><%=course.getCourse_code()%></td> 
                    <td><%=course.getCourse_name()%></td>  
                    <td><%=course.getCou_credit() %></td>  
                    <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                    <td><%=course.getCurriculum()%></td>
                </tr> 
          
             <%} %></table>
             <br><h4> Selected Regular Students whose course registartion is not done (Total - <%=studLi.size()%>) :</h4><br><% out.print(studLi.toString().replace(",","&nbsp;&nbsp;"));%><br><br>
       <!--<button class="btn btn-primary" formaction="../../Controller/saveOrRegCourse.jsp?flag=register&user=registrar" name.jsp?="confirm" id="register" >Confirm</button>--> 
       <center><button class="btn btn-primary" formaction="../../Controller/saveOrRegCourse.jsp?flag=register&user=registrar" name="confirmBtn" id="register" >Confirm</button> 
       </center>
       </form><%  }
else{%>
<div  class="row"><div class="col-lg-8"> <p class="alert alert-danger">
            <a href="registrarPanel.jsp" style="margin-left: 700px;font-size: 20px">&times;</a>
            <br>
            <%out.print("Regular Courses of Latest curriculum hasn't offered by HOD");%></p></div></div>
<%           
}}
else
response.sendRedirect("studRegList.jsp?failResult=Course Registration of all Regular students is already done");
}
else{
session.setAttribute("inAllRegularCourse","no");
               
                //Retrieving student information
               //edit button is set with rollno of corresponding user.
               try{
               Student_data stud;
               if(!editBtnValue.equals(""))  
                {stud=(Student_data)StudCon.getStudentInfo(editBtnValue);
                session.setAttribute("studroll",(String)stud.getRollno());}
                else
                stud=(Student_data)StudCon.getStudentInfo((String)session.getAttribute("studroll"));
          %> 
          
        <div class="container" >
              <a href='studRegList.jsp'>
                  <button id="BackBtn" value="Back" class="btn btn-lg btn-primary">Back</button></a>
            <div class="row">
                <center><h2><u>Course Registration</u></h2></center>
                <div class="col-sm-10">
                    
                    <h3> <u>Student details </u></h3><br>
                    <h4> 
                        Roll No. : <%=stud.getRollno()%><br><br>
                        Name : <%=stud.getS_name()%><br><br>
                        Mobile No. : <%=stud.getPhone_no()%><br><br>
                        Email Id : <%=stud.getS_email()%>
                    </h4> 
                </div>
            </div>
        </div> 
        <center> 
        <form method="POST" action="../../Controller/saveOrRegCourse.jsp" name="courses"> 
        <div class="container" >
        <div class="row">
            <div class="col-lg-1"></div>
            <div class="col-lg-10"> 
                <center><h2>Regular Courses</h2></center>      
        <table border="1" class="table">
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
            <th>Curriculum</th>
            </thead>
             
             <% 
              
              if(stud.getS_regular().equals("d") && stud.getYear()==2)
              {  
                  StudCon.regDsyFirstYearCourses(stud.getRollno(),stud.getProgramme(),stud.getTerm());
                 
              }
              
                 int j=1; 
                //list1 gives available courses for student.
                List list1=StudCon.studRegCourse(stud.getRollno(),stud.getTerm(),stud.getYear());
                
                //list2 gives courses which are registered by student.
                List list2=StudCon.getRegCourse(stud.getRollno(),stud.getTerm(),stud.getYear());
                
                //list3 gives backlog courses of student
                List list3=StudCon.getBackCourse(stud.getRollno());
                
                //List4 gives pending courses
                List list4=StudCon.getPendingCourse(stud.getRollno());
                
                //Using for each loop for showing available courses.
                String statusChk="unchecked",statusBtn="false";
                /*
                if(stud.getS_regular().equals("d") && stud.getYear()==2)
                {  
                    int s=StudCon.getDsyFirstYearCourse(stud.getProgramme(),1,(String)session.getAttribute("uname"));
                }
              */
                
                //Redirecting to printRegistration.jsp if exam registartion has been completed.
                if(StudCon.getExRegStatus(stud.getRollno(),stud.getTerm(),stud.getYear()))
                    response.sendRedirect("printRegistration.jsp");

                //Redirecting to regExam.jsp if course registartion has been completed.
                else if(HodCon.checkRegStatus(stud.getRollno(),stud.getTerm(),stud.getYear()))
                {response.sendRedirect("regExam.jsp");}
                
                
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
              %>  
                <tr> 
                    <td><%=j++%></td> 
                    <td><input type="checkbox" name="course[]" value="<%=course.getCourse_code()%>" <%=statusChk%> onchange="onBtn()"></td>
                    <td><%=course.getCourse_code()%></td> 
                    <td><%=course.getCourse_name()%></td>  
                    <td><%=course.getCou_credit() %></td>  
                    <td><%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %></td>  
                    <td><%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %></td>
                    <td><%=course.getCurriculum()%></td>
                </tr> 
             <%}
            }//for closing%>  
             
        </table>
                <a name="checkAll" class="btn btn-primary"  onclick="checkAll()">Check All</a> 
       <%
             if(list3.size()!=0)
             { 
                StudentCourses backCourseResult;
       %>
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
             <h2>Backlog Courses and Detention Courses</h2>
             <% 
                j=0;
               
            List<ArrayList<Courses>>backList=CourseCon.getBacklogForReg(list3);
          for(ArrayList<Courses> aCr:backList)
                  {
                        //Course_reg coursereg=(Course_reg)obj;
                        //Courses course=CourseCon.getCourseObject(coursereg.getCourse_code().trim());
                    %><tr> 
                        <td rowspan="<%=aCr.size()%>"><%=j+1%></td>  
                        <input type="checkbox" name="courseB[]" hidden checked value="<%=j%>" >
                        <%
                        
                        for(Courses course:aCr)
                        {   if(course.getCourse_code().equals(aCr.get(0).getCourse_code()))   
                            {statusChk="checked";}
                            else
                            {statusChk="unchecked";}
                            
                            backCourseResult=StudentCoursesCon.getStudCourseResult(stud.getRollno(), course.getCourse_code());
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
                    
                    <td><input type="radio" name="courseB<%=j%>" <%=statusChk%> value="<%=course.getCourse_code()%>" onchange="backlog('<%=course.getCourse_code()%>',<%=j%>)" ></td>       
                    <td><%=course.getCourse_code()%></td> 
                    <td><%=course.getCourse_name()%></td> 
                    <td><%=course.getCou_th_credits()%></td>
                    <td><%=course.getCou_pr_credits()%></td>
                    <td><%=course.getCou_tu_credits()%></td>
                    <td><%=course.getCou_credit()%></td>
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
             <h2>Pending Courses</h2><hr>
             <select class="selectpicker" data-live-search="true" name="cname">
                
             <%
               for(Object obj1:list4)
                {
                    Courses course=(Courses)obj1;  
               %>    
             <option value="<%=course.getCourse_name()%>|<%=course.getCourse_code()%>|<%=course.getCou_credit()%>|<%if(course.getCou_th_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_pt_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_pr_min()>0)out.print("Y"); else out.print("--");%>|<%if(course.getCou_tw_min()>0)out.print("Y"); else out.print("--"); %>|<%if(course.getCou_or_min()>0)out.print("Y"); else out.print("--"); %>"><%=course.getCourse_name()%><%out.print("("+course.getCourse_code()+")"); %></option>
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
            
      
        
        </div>
        </div>
        </div> 
        <center>
            
            <button class="btn btn-primary" formaction="../../Controller/saveOrRegCourse.jsp?flag=register&user=registrar" name="confirmBtn" id="register" value="<%=stud.getRollno()%>" disabled>Confirm</button> 
        </center>
        </form>
               
            
    </center> 
        <%}
          catch(Exception e) 
          {%>
          <h2><center><% out.println("Exception occured : "+e);%></center></h2>
          <%}
} }//else closing used for session checking.%> 
          
    <!--############################## JAVASCRIPT ####################################-->    
   
    <script type="text/javascript">
        var j=0;
        
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
