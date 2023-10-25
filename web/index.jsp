
<%response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration System</title>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="//use.fontawesome.com/releases/v5.0.7/css/all.css">
        <script src="../../assets/js/jquery1.min.js"></script>
        <script src="../../assets/js/bootstrap1.min.js"></script>
       

<style>

/*assign full width inputs*/
input[type=text]{
width: 100%;
padding: 12px 20px;
margin: 8px 0;
display: inline-block;
border: 1px solid #ccc;
box-sizing: border-box;
}
input[type=password]{
width: 100%;
padding: 12px 20px;
margin: 8px 0;
display: inline-block;
border: 1px solid #ccc;
box-sizing: border-box;
}


body {
 background-image: url('Images/indexbackground.jpeg');
  background-repeat: no-repeat;
  background-size: 100% 100%;
}


/*set a style for the buttons*/
button {
background-color:#4CAF50;
color: white;
padding: 14px 20px;
margin: 8px 0;
border: none;
cursor: pointer;
width: 100%;
}

/* set a hover effect for the button*/
button:hover {
background-color:#ccc ;
                color:black;
opacity: 0.8;
}

.container {
            height: 500px;
            width: 350px;
            margin: 30px 400px 100px 400px;
            padding : 50px 150px 190px 150px;
            text-align: left;
            background-color:#001a33;
            color: white;  
 
}
.invalid-alert{
    border-radius: 20px;
    margin:10px 420px 10px 420px ;
    background-color:#ffcccc;
    font-size:20px;
    padding:20px 0px 20px 20px;
    color:#ff3333;
    
}


.wrapper {
    position: relative;
}
i.fa-eye {
      position: absolute;
      top: 18px; left: 320px;
      color: black;
      font-size:19px
}
i.fa-eye-slash {
     position: absolute;
     top: 18px;
     left: 320px;
     color: black;
     font-size:19px;
}
</style> </head>
<body>

<h1 style="text-align: center;background-color: white;padding: 0px 50px 0px 50px; font-size: 60px;"><img src="Images/logo.png"  alt="Image is unavailable"></center></h1>
 <%  try{
            if(!request.getParameter("failResult").equals(null))%>
<div class="invalid-alert" ><%out.print(request.getParameter("failResult"));%><a style="font-size:25px;padding:0px 10px 0px 100px;" href="index.jsp">&times;</a></div>   
        <%}catch(Exception e){}%>
<center><form method="post">
   
                          
<div class="container">

    <h1 style="text-align: center;padding: 20px 0px 30px 0px;margin: 20px 0px 75px 0px;font-size: 50px">Login Form</h1>

  <div>   
<label><b>Profile </b></label>
<input type="text" placeholder="Enter Profile " name="profile" list="profilelist" required>
<datalist id="profilelist">
<option>Administrator</option>
<option>Registrar</option>
 <option>HOD</option>
<option>Student</option>
</datalist><br><br><br>



<label><b>Username</b></label>
<input type="text" placeholder="Enter Username" name="uname" required><br><br><br>

<label><b>Password</b></label><br>
<div class="wrapper">
<input type="password" placeholder="Enter Password" name="psw" id="password-field" required >
<i id="pass-status" class="fas fa-eye" aria-hidden="true" onClick="viewPassword()"></i></div><br><br><br>

<center> <button style="width:150px;height: 50px; font-size: 25px;" formaction="Controller/loginasprofile.jsp" type="submit">
                <b>Login</b>
        </button> </center>
    
          
</div>
</div>
</form>
</center>
</div>
 
<script type="text/javascript">
function viewPassword()
{
  var passwordInput = document.getElementById('password-field');
  var passStatus = document.getElementById('pass-status');
 
  if (passwordInput.type == 'password'){
    passwordInput.type='text';
    passStatus.className='fas fa-eye-slash';
   
  }
  else{
    passwordInput.type='password';
    passStatus.className='fas fa-eye';
  }
}




</script>       
</body>
</html> 