<%-- 
    Document   : hallTicketGeneration
    Created on : Feb 7, 2019, 7:52:42 PM
    Author     : User
--%>
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page import="org.hibernate.Session"%>
<%@page import="mainController.AdminCon"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.hibernate.SessionFactory"%>
<%@page import="org.hibernate.Query"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Hall ticket generation</title>
        <link rel="stylesheet" type="text/css" href="../../assets/css/bootstrap.min.css">

    </head>
    <body>
         <%
            if(session.getAttribute("admin_uname").equals(null))
            {
               response.sendRedirect("../../index.jsp");
            }
            else if(session.getAttribute("admin_user").equals("admin"))
            {    %>
        <jsp:include page="../headerforallPanelviews.jsp"/>
        
        <a href="adminPanel.jsp"><button id="BackBtn" value="Back" class="btn btn-lg btn-primary">Back</button></a>
        <div class="container">
           
            <%
            try{
                if(!request.getParameter("failResult").equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-danger"><%= request.getParameter("failResult") %></p></div></div>
            <%} }catch(Exception e){}

            try{
            if(!request.getParameter("result").equals(null)){%>
            <div class="row"><div class="col-lg-8"> <p class="alert alert-success"><%= request.getParameter("result") %></p></div></div>
            <%} }catch(Exception e){}
               
                
        %><br>
            <h2>Generate Hall Ticket</h2>
         
          
              
               <div class="row">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                        PT Hall Ticket generation
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <form  method="POST">
                       <div class="panel panel-info">
                        <div class="panel-body">
                            <p>Generate PT Hall Ticket For all Students</p><br>
                            <label> Branch:  </label>
                            <select name="branch" style="width: 200px;height: 30px" required>
                                    <option value="" selected disabled hidden>Select branch</option> 
                                    <option value="AE">AE</option>
                                    <option value="CE">CE</option>
                                    <option value="CM">CM</option>
                                    <option value="Ddgm">DDGM</option>
                                    <option value="EE">EE</option>
                                    <option value="E&TC">E&TC</option>
                                    <option value="IF">IF</option>
                                    <option value="IDD">IDD</option>
                                    <option value="ME">ME</option>
                                    <option value="PE">PE</option>
                            </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<br/><br/>
                            <label> Shift :  </label>
                                <select name="shift"  style="width: 200px; height: 30px" required>
                                    <option value="" selected disabled hidden>Select shift</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select><br><br>
                            <label>Year </label> : 
                            <select name="year"  style="width: 200px; height: 30px" required>
                                    <option value="" selected disabled hidden>Select year</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select><br/><br/>
                            <label>Examination Registration Date </label> : <input type="date" name="exRegDate" required/><br><br>
                            <label>First PT Date</label> : <input type="date" name="firstPTDate" required/><br><br>
                            <label>Second PT Date</label> : <input type="date" name="secondPTDate" required/><br><br>
                            <label>End of Term</label> : <input type="date" name="endOfTerm" required /><br><br>
                            <label>OR/PR/TW Exam Date</label> : <input type="date" name="or_pr_tw" placeholder="Before TH Exam" required/><br><br>
                            <label>Final Exam Date</label> : <input type="date" name="finalExDate" required/><br><br>
                            
                            
                            <center><button type="submit" formaction="../../Controller/generateAllHallTicket.jsp?hallTicketType=pt" class="btn btn-primary">Generate All PT HallTicket</button></center>
                        </div>
                       </div>
                        </form>
                    </div>
                   <div class="col-lg-6">
                       <form  method="POST">
                       <div class="panel panel-info">
                        <div class="panel-body">
                            <p>Generate PT Hall Ticket For Individual Students</p><br>
                            <label>Roll number:</label> <input  type="text" name="rollnumber"><br><br>
                            <center><button type="submit" formaction="../../Controller/generateIndividualHallTicket.jsp?hallTicketType=pt" class="btn btn-primary">Generate Individual PT HallTicket</button></center>
                        </div>
                       </div>
                       </form>
                   </div>
               </div>
                   <div class="row">
                            <div class="panel panel-info">
                            <div class="panel-heading">
                            Final Hall Ticket generation
                            </div>
                            </div>
                       <div class="col-lg-6">
                           <form  method="POST">
                           <div class="panel panel-info">
                        <div class="panel-body">
                            <p>Generate Final Hall Ticket For All Students</p><br/>
                            <label> Branch:  </label>
                            <select name="branch" style="width: 200px;height: 30px" required>
                                    <option value="" selected disabled hidden>Select branch</option> 
                                    <option value="AE">AE</option>
                                    <option value="CE">CE</option>
                                    <option value="CM">CM</option>
                                    <option value="Ddgm">DDGM</option>
                                    <option value="EE">EE</option>
                                    <option value="E&TC">E&TC</option>
                                    <option value="IF">IF</option>
                                    <option value="IDD">IDD</option>
                                    <option value="ME">ME</option>
                                    <option value="PE">PE</option>
                            </select>&nbsp &nbsp &nbsp &nbsp&nbsp &nbsp &nbsp &nbsp &nbsp &nbsp<br/><br/>
                                
                                <label> Shift :  </label>
                                <select name="shift" value="0" style="width: 200px; height: 30px" required>
                                    <option value="0" selected disabled hidden>Select shift</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                </select><br><br>
                                 <label>Year </label> : 
                                 <select name="year"  style="width: 200px; height: 30px" required>
                                    <option value="" selected disabled hidden>Select year</option> 
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                </select><br/><br/>
                            <center><button type="submit" formaction="../../Controller/generateAllHallTicket.jsp?hallTicketType=final" class="btn btn-primary">Generate All Final HallTicket</button></center>
                        </div>
                       </div>
                           </form>
                        </div>
                       <div class="col-lg-6">
                           <form  method="POST">
                           <div class="panel panel-info">
                        <div class="panel-body">
                            <p>Generate Final Hall Ticket For Individual Student</p><br>
                            <label>Roll number:</label> <input type="text" name="roll_number" required/><br><br>
                            <center><button type="submit" formaction="../../Controller/generateIndividualHallTicket.jsp?hallTicketType=final" class="btn btn-primary">Generate Individual Final HallTicket</button></center>
                        </div>
                       </div>
                           </form>
                        </div>
                    </div>
              </form> 
        </div>
        <!--form action="../../Controller/generateAllHallTicket.jsp" method="POST">
               <button type="submit" class="btn btn-primary">Generate All HallTicket</button>
        </form-->
             

          
       
             <%}%>
    </body>
</html>
