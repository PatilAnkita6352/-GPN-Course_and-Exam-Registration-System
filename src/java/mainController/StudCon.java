package mainController;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import SessionFact.SessionFact;
import beans.Admin_data;
import beans.Course_reg;
import beans.Courses;
import beans.Exam_reg;
import beans.Hod_data;
import beans.StudentCourses;
import beans.Student_data;
import static java.lang.System.out;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import static mainController.AdminCon.md5;
import static mainController.CourseCon.session;
import static mainController.HodCon.session;
import static mainController.HodCon.sf;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author sarvadnya
 */
//
public class StudCon {
    static Session session;
    static SessionFactory sf;
    static Student_data stud;
    
    public static Boolean login(String uname,String pword) 
    {
            Boolean bool=false; 
            sf=SessionFact.getSessionFact();              //sessionFactory creation
            Session session1=sf.openSession();
            pword=md5(pword);
            System.out.println("login check student started");
            Query qr=session1.createQuery("from Student_data"); 
            if(qr!=null)
            {
                List li=qr.list();
                if( li != null)
                {
                   for(Object obj:li) 
                   {
                        Student_data stud=(Student_data)obj;
                        if(uname.equals(stud.getUsername())&&pword.equals(stud.getPassword()))
                        {
                           bool=true;
                           break;                            
                        } 
                    }   //for close  
                }   //inner if close    
            }    //outer if closed
            System.out.println("login check student performed");
            session1.close();
            //sf.close(); 
            return bool;
    }
    
    //used to register a new student 
    public static int register(Student_data sd)
    {
        int i=0;
        //Session session=new Configuration().configure().buildSessionFactory().openSession();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        i=(Integer)session.save(sd);
        session.getTransaction().commit();
        session.close();
        return i;
    }  
    
    //studRegCourse() method is for showing the student available courses for him according
    //to his programme, term and year
  public static List studRegCourse(String uname,String term,int year)  
  {
            Session s;
            Student_data stud=new Student_data();
            Query qr;
            SessionFactory sf;
            Admin_data ad=AdminCon.getAdminInfo();
            sf=SessionFact.getSessionFact();
            s=sf.openSession();
            qr=s.createQuery("from Student_data where username =:uname").setString("uname",uname);
            List li=qr.list();
            if(li.size()==1 && li!=null) 
                stud=(Student_data)li.get(0);
            String programme=stud.getProgramme();
            System.out.println("----------------------------------------"+stud.getProgramme());
            //String t,y;
            System.out.print(term);
            System.out.print(year);
            li=s.createQuery("from Courses where is_offered=:yes and programme =:programme and term=:t and year=:y and Curriculum="+ad.getCurriculum()+"").setString("programme",stud.getProgramme()).setString("t",term).setInteger("y",year).setString("yes","y").list();  
            s.close();
            //sf.close();
            return li; 
  }
  
  //This method is for retrieving the courses which are registered by student. 
  public static List getRegCourse(String uname,String term,int year)
  {
      Session session;
      SessionFactory sf=SessionFact.getSessionFact(); 
      session=sf.openSession();
      System.out.println("__________StudCon.getRegCourse() Retrieving all registered courses by student.");                                   
      System.out.print("___________"+year);
      List list=null;       
       list=session.createQuery("from Course_reg where regno=:regno and reg_term=:term and year="+year+"").setString("regno", uname).setString("term", term).list();//System.out.println("----------------------------------------------------------------------------------------------------------Exception e = "+e);
      session.close();
      //sf.close();
      return list;
  }
  
   //This method is for retrieving the courses which are registered by student in given reg term year(For Ex.EVEN-19)
  public static List getRegCoursebyRegTermYear(String uname,String reg_term_year)
  {
      Session session;
      SessionFactory sf=SessionFact.getSessionFact(); 
      session=sf.openSession();
      System.out.println("__________StudCon.getRegCoursebyRegTermYear() Retrieving all registered courses by student.");                                   
      List list=null;    
      System.out.println(reg_term_year);
       list=session.createQuery("from Course_reg where regno=:regno and reg_term_year=:reg_term_year").setString("regno", uname).setString("reg_term_year", reg_term_year).list();//System.out.println("----------------------------------------------------------------------------------------------------------Exception e = "+e);
      session.close();
      //sf.close();
      return list;
  }
  
  //This method is for retrieving the courses which are registered for examination by student. 
  //ex_reg_date is checked in query.
  public static List getExRegCourse(String uname,String term,int year)
  {
      Session session;
      SessionFactory sf=SessionFact.getSessionFact(); 
      session=sf.openSession();
      List list=null;       
      System.out.print("^^INside getExRegCourse() method");
      list=session.createQuery("from Exam_reg where regno=:regno and ex_reg_term=:term and ex_reg_year="+year+"").setString("regno", uname).setString("term", term).list();
      session.close();
      //sf.close();
      return list;
  }
  
    //This method is for retrieving the courses which are registered for examination by student for given reg_term_year(For Ex.EVEN-19)
  //ex_reg_date is checked in query.
  public static List getExRegCourseByRegTermYear(String uname,String reg_term_year)
  {
      Session session;
      SessionFactory sf=SessionFact.getSessionFact(); 
      session=sf.openSession();
      List list=null;       
      System.out.print("^^INside getExRegCourse() method");
      list=session.createQuery("from Exam_reg where regno=:regno and ex_reg_date=:ex_reg_date").setString("regno", uname).setString("ex_reg_date", reg_term_year).list();
      session.close();
      //sf.close();
      return list;
  }
  
  public static List getRegularRegCourses(String rollno,String term,int year)
  {
      sf=SessionFact.getSessionFact();
      session=sf.openSession();
      List list=null; 
      System.out.println("in getregularregcourses");
      list=session.createQuery("from Course_reg where course_code in (select course_code from Courses where term=:term and year="+year+") and regno=:regno and reg_term=:term and year="+year+"").setString("regno",rollno).setString("term", term).list();
      System.out.println("REGULAR list size"+list.size());
      session.close();

      return list;
  }
  
  public static List getBacklogRegCourses(String rollno,String term,int year)
  {
      sf=SessionFact.getSessionFact();
      session=sf.openSession();
      List list=null; 
      System.out.println("in getbacklogregcourses");
      list=session.createQuery("from Course_reg where course_code not in (select course_code from Courses where term=:term and year="+year+") and regno=:regno and reg_term=:term and year="+year+"").setString("regno",rollno).setString("term", term).list();
      System.out.println("BACKLOG list size"+list.size());
      session.close();

      return list;
  }
  
  //returns the records which are continuation of detained student courses
   public static List getDetainRegCourses(List backCoursesList)
    {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        Admin_data ad=AdminCon.getAdminInfo();
        Query q;
    List li=new ArrayList<>();   
        for(Course_reg c:(List<Course_reg>)backCoursesList)
        {
            String coursecode=c.getCourse_code();
            List<String> eqCourse=new ArrayList<String>();
            System.out.println("hiiiiiiiiiiiiii");
            while(coursecode!=null)
            {
                eqCourse.add(coursecode);
                List temp=session.createQuery("select course_code from Courses where newEquivalentCourse=:code").setString("code",coursecode).list();
                if(temp.size()==0)
                    coursecode=null;
                else
                    coursecode=(String)temp.get(0);
            }
            List l;
            if(eqCourse.size()==0)
            {
                 l=session.createQuery("from Course_reg where regno=:reg_no and course_code in (:codes) and (re_register=:term_year or re_register=null) and reg_term_year in (select ex_reg_date from Exam_reg where regno=:reg_no and course_code in (:codes) and ex_det=1)").setString("reg_no",c.getRegno()).setParameterList("codes",eqCourse).setString("term_year",c.getReg_term_year()).list();
            }else
            {
                 l=session.createQuery("from Course_reg where regno=:reg_no and course_code in (:codes) and (re_register=:term_year or re_register=null) and reg_term_year in (select ex_reg_date from Exam_reg where regno=:reg_no and course_code in (:codes)  and ex_det=1)").setString("reg_no",c.getRegno()).setString("term_year",c.getReg_term_year()).setParameterList("codes",eqCourse).list();
            }    
            
            if(l.size()!=0)
                li.add(c);
        }
        session.close();
    return li;
    }
  
  //getBackCourse() method returns  backlog courses
  public static List getBackCourse(String uname)
  {
      Session session;
      SessionFactory sf=SessionFact.getSessionFact();
      session=sf.openSession();
      //System.out.println("000000000000000000000000000000000000000000000000000000000000000000000000000000Reached for displaying all registered courses by student\n\nAnd rollno = "+uname);
      List list=null; 
      Admin_data admin=AdminCon.getAdminInfo();
      list=session.createQuery("from Course_reg where regno=:regno and fail=:y and reg_term_year!=:term_year and (re_register=NULL or re_register=:term_year)").setString("regno", uname).setString("y","y").setString("term_year", admin.getReg_term_year()).list();
      //System.out.println("----------------------------------------------------------------------------------------------------------Exception e = "+e);
      session.close();
      //sf.close();
      return list;
  }
  
   //getPendingCourse() method returns All offered courses
  public static List getPendingCourse(String uname)
  {
      Session session;
      Query qr;
      SessionFactory sf=SessionFact.getSessionFact();
      session=sf.openSession();
       qr=session.createQuery("from Student_data where username = "+uname);
            List li=qr.list();
            if(li.size()==1 && li!=null) 
                stud=(Student_data)li.get(0);
            String programme=stud.getProgramme();
     // System.out.println("000000000000000000000000000000000000000000000000000000000000000000000000000000Reached for displaying all registered courses by student\n\nAnd rollno = "+uname);
      List list=null; 
      list=session.createQuery("from Courses where programme=:programme and is_offered=:y").setString("programme",programme).setString("y","y").list();
      //System.out.println("----------------------------------------------------------------------------------------------------------Exception e = "+e);
      session.close();
      //sf.close();
      return list;
  }
  //confirmCourse changes reg_can from 'y' to 'n'
  public static void confirmCourse(Course_reg cr)
  {
        Boolean bool=false;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        session.beginTransaction();
        cr.setReg_can("nd");
        
        session.merge(cr);  
        session.getTransaction().commit();
       
   
  }
     
//regCourse() this method is for registering the courses selected by student in courseReg table
  public static int[] regCourse(String[] course,List uuname,String saveOrReg,String date,String term,String year,String user) 
  {
      List list=new ArrayList();
      String uname=null;
      String hql,cou_code;
      
      Query qr,qr1;
      Course_reg cr=new Course_reg();
      sf=SessionFact.getSessionFact();
      Student_data stud=new Student_data();
      Admin_data ad=new Admin_data();
      int res[]=new int[course.length];
      Boolean flag=false;
      int looplength=1;
      looplength=uuname.size();
        
      //Applying loop to register all students in uuname list
      for(int k=0;k<looplength;k++)
      {
            uname=(String)uuname.get(k);
            List<String> li5=new ArrayList<String>(),li1=new ArrayList<String>(),li2=new ArrayList<String>(),li3=new ArrayList<String>(),li4=new ArrayList<String>();
      
        try{
          //Retrieving registered courses by student.
          List li=getRegCourse(uname,term,(new Integer(year)));   

        //li1 is a list which holds the course_code of all registered courses.
        for(Object obj:li)
        {
            Course_reg creg=(Course_reg)obj;
            li1.add((creg.getCourse_code()));
            
        }System.out.println(li1+"liiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii1");
        
        //array "course" contains the selected courses and backlog courses
        
        li5=Arrays.asList(course);  //copies array course into a list li5.
        li2.addAll(li5);//li2 is the list of all selected courses.
        System.out.println(li2+"liiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii2");
        
        session=sf.openSession(); 
        session.beginTransaction();
       
        System.out.println("____________Now in StudCon.regCourse()");
        int j=0;
        try{
        list=session.createQuery("from Student_data where username=:username").setString("username",uname).list();
        }
        catch(Exception e){System.out.print("Sorry");}
        
        //Getting student programme for writing it into coursereg table.
        if(list.size()==1) 
              stud=(Student_data)list.get(0);
                
        //Adding list "li1" (registered courses in this semester) to list "li3"
        li3.addAll(li1);
        //Adding list "li1" (registered courses in this semester) to list "li4"
        li4.addAll(li1);    //now li4 holds already registered courses
        //retainAll() returns the common elements from both lists and all common elements are placed into calling list.
        li4.retainAll(li2); //now list "li4" holds courses that are common in previous and current registration
        li1.removeAll(li2); //now "li1" holds already registered courses that are not selected now
        li2.removeAll(li3); //now "li2" holds newly selected courses that aren't already registered 
        System.out.print("__________Courses to be deleted = "+li1);
        System.out.print("__________Courses to be newly added = "+li2);
        System.out.print("__________Courses that are common in previous and current one to be updated = "+li4);
        try{for(String str:li1)
        {
            System.out.println("******delete*********"+str);
        }}catch(Exception e){ System.out.println("***************li1 is empty"+e);}
        try{for(String str:li2)
        {
            System.out.println("*******add********"+str);
        }}catch(Exception e){ System.out.println("***************li2 is empty"+e);}
        try{for(String str:li4)
        {
            System.out.println("*********update******"+str);
        }}catch(Exception e){ System.out.println("***************li4 is empty"+e);}
        //Now li1 has its unique members which is to be deleted.
        //Now li2 has its unique members which is to be newly added.
        //li4 has common members in original li1 and li2 which is to be updated.
         
        //deleting old courses using list li1.
        try{
            if(!li1.isEmpty())
            {
                System.out.println("___________________Calling delOldCourses() to delete old courses");
                delOldCourses(uname,li1,term,year);
            }
        }catch(Exception e){ System.out.println("********li1 is empty(deletion list)*******"+e);}
            //updating old courses using list li4
            try{
            if(!li4.isEmpty())
            {
                if(user.equals("student"))
                    updateOldCourses(uname,li4,"y");
                else if(user.equals("registrar")) 
                    updateOldCourses(uname,li4,"n");
            } 
            }catch(Exception e){ System.out.println("********li4 is empty(updation list)*******"+e);}
            
            //adding new courses using list li2 
            try{
            if(!li2.isEmpty())
            {
               ad=AdminCon.getAdminInfo();
                for(String coucode:li2) 
                {      
                    try
                    {   
                        li=session.createQuery("from Courses where course_code=:coursecode").setString("coursecode", coucode).list();
                        Courses c=(Courses)li.get(0);
                        System.out.println("course[] = "+coucode);
                        //storing all details of a course registration record in Course_reg object to add in database
                        cr.setCourse_code(coucode);
                        cr.setRegno(uname);
                        cr.setProgram(stud.getProgramme());
                        cr.setReg_date(date);
                        cr.setReg_term(term);
                        int year1=Integer.parseInt(year);
                        cr.setYear(year1);
                        cr.setReg_exmt("n"); 
                        cr.setReg_term_year(ad.getReg_term_year()); 
                        cr.setShift(stud.getShift()); 
                        cr.setCurriculum(c.getCurriculum());
                        //checking if save is clicked or register, and setting the reg_cancel field accordingly.
                        //save means registration by student and register means registration by registrar
                        System.out.print("__________________course  reg_can is "+saveOrReg);
                        if(saveOrReg.equals("save"))
                        {   
                            cr.setReg_can("y");
                            cr.setFail("n");
                            cr.setPass("n");
                        }
                        else if(saveOrReg.equals("register")) 
                        {
                            cr.setReg_can("n");
                            cr.setFail("n");
                            cr.setPass("n");
                        }
                        System.out.print("________Going to register_"+cr.getCourse_code()+"__"+cr.getRegno()+"__"+cr.getProgram()+"__"+cr.getId()+"____"+cr.getReg_can());
                        //calling method for storing courses of a student.
                        int result=CourseRegCon.Cou_register(cr);                            
                        res[j]=result;   //putting the result in result array.
                    } 
                    catch(Exception e) 
                    {
                        out.println("____________________Failed\n\n\n\n"+e);
                    }
                }//for close
               Query q=session.createQuery("Update Course_reg set re_register=:term_year where re_register=NULL and regno=:roll and reg_term_year!=:term_year and fail=:y").setString("term_year",ad.getReg_term_year()).setString("roll",uname).setString("term_year",ad.getReg_term_year()).setString("y","y");
               q.executeUpdate();
            }//if close 
            
            }catch(Exception e){ System.out.println("********li2 is empty(addition list)*******"+e);}
             session.getTransaction().commit();
     session.close(); 
      }catch(Exception e)
      {
          out.println("*****************Exception "+e+" occured.");
      }}
      return res;
  }//method regCourse() closed
  
// regExam() this method is for registering the courses selected by student in examreg table
  public static int[] regExam(String[] course,String[] courseB,String uname,String date,String term,int year,String saveOrReg) 
  {
        int res[]=new int[course.length];
        List list=new ArrayList();
        List li=null;
        Courses cr;
        
        Query qr,qr1,qr2 = null;
        Exam_reg er=new Exam_reg();
        Course_reg creg=new Course_reg();
        sf=SessionFact.getSessionFact();
        Student_data stud=new Student_data();
        session=sf.openSession();

       System.out.println("$$######################################################Reached to regExam method...");
        int j=0;
        list=session.createQuery("from Student_data where username=:username").setString("username",uname).list();
         session.beginTransaction();
        if(saveOrReg.equals("registrar"))
        {
       
        qr2=session.createQuery("delete Exam_reg where regno=:regno and ex_reg_term=:term and ex_reg_year=:y1 and ex_cancel=1").setString("regno", uname).setString("term",term).setInteger("y1",year);
        qr2.executeUpdate();
        
        }
        session.getTransaction().commit();
        
        session.beginTransaction();
        if(list!=null && list.size()==1)
              stud=(Student_data)list.get(0);
        for(int i=0;i<course.length;i++)
        {   
   
            cr=CourseCon.getCourseObject(course[i]);
            try
            { 
              /* try{ 
                   if(cr.getIs_exempted().equals("Ex"))
                    {
                      li=s.createQuery("from Course_reg where regno=:regno and reg_term=:term and year=:year and cou_code=:coucode").setString("regno", uname).setString("term", term).setInteger("year",year).setString("coucode", cr.getCourse_code()).list();
                      creg=(Course_reg)li.get(0);
                       if(creg.getReg_exmt().equals("y"))er.setEx_exmt(1);else er.setEx_exmt(0);
                    }
                  }catch(Exception e){}*/
                er.setCourse_code(course[i]);
                er.setRegno(uname);
                er.setProg(stud.getProgramme()); 
                er.setEx_reg_date(date);
                er.setEx_reg_term(term);
                er.setEx_reg_year(year);
                if(cr.getCou_th_min()>0)er.setEx_th(1); else er.setEx_th(0);
                if(cr.getCou_pt_min()>0)er.setEx_pt(1); else er.setEx_pt(0);
                if(cr.getCou_pr_min()>0)er.setEx_pr(1); else er.setEx_pr(0);
                if(cr.getCou_tw_min()>0)er.setEx_tw(1); else er.setEx_tw(0);
                if(cr.getCou_or_min()>0)er.setEx_or(1); else er.setEx_or(0);
                er.setShift(stud.getShift()); 
                //checking if save is clicked or register, and setting the Ex_cancel field accordingly.
                if(saveOrReg.equals("student"))
                {   //Exam registration by student
                    er.setEx_cancel(1);
                }
                else
                {   //Exam registration by registrar
                    er.setEx_cancel(0);
                }
                //calling method for storing courses of a student for exam registration.
                int result=ExamRegCon.exRegister(er);                            
                res[i]=result;   //putting the result in result array.
            } 
            catch(Exception e)
            {
                out.println("______________________________________________________Failed"+e);
            }
        }   
            er=new Exam_reg();
            StudentCourses backCourseResult=new StudentCourses();
               
               //EcourseBxam registration of backlog courses.
               if(courseB!=null)
               {
                   System.out.print("@@@@@@@@@@@@@@@@@@@@@@  courseB  array size greater than zero @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"); 
                   for(int k=0;k<courseB.length;k++)
                    { 
                        try
                        { 
                        System.out.print("@@@@@@@@@@@@@@@@@@@@@@  courseB  "+courseB[k]+" @@@@@@@@@@@@@@@@@@"); 
                         cr=CourseCon.getCourseObject(courseB[k]);
                         System.out.print("_______________(in regExamByRegistrar.jsp_____controller file) calling getStudCourseResult()");
                         backCourseResult=StudentCoursesCon.getStudCourseResult(uname, courseB[k]);
                         System.out.print("_______________(in regExamByRegistrar.jsp_____controller file)getStudCourseResult() called success__________");
                         //Setting Ex_th field
                         try{cr.getCou_th_max();}catch(Exception e){System.out.print("______theory max_________"+e);}
                         
                         try{System.out.print("________________VALUE_______________"+backCourseResult.isTheoryIsPass());}catch(Exception e){System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n______theory pass_________"+e);}
 ////////////////////////////////////////////////                   EXCEPTION                       //////
                         
                         
                         if(cr.getCou_th_max()>0)
                         {
                             if(backCourseResult.isTheoryIsPass())//If PASS
                                 er.setEx_th(0);
                             else //IF BACK
                                 er.setEx_th(1);
                         } 
                         else
                             er.setEx_th(0);
                         System.out.print("_______________th set__________");
                         //Setting Ex_pt field
                         er.setEx_pt(0);
                         System.out.print("_______________pt set__________");
                         //As the course is backlog, so setting ex_back field to 1.
                         er.setEx_back(1);
                         //Setting Ex_pr field
                         if(cr.getCou_pr_max()>0)
                         {
                             if(backCourseResult.isPracticalIsPass())//If PASS
                                 er.setEx_pr(0);
                             else //IF BACK
                                 er.setEx_pr(1);
                         }
                         else
                             er.setEx_pr(0);
                         System.out.print("_______________pr set__________");
                         
                         //Setting Ex_or field
                         if(cr.getCou_or_max()>0)
                         {
                             if(backCourseResult.isOralIsPass())//If PASS
                                 er.setEx_or(0);
                             else //IF BACK
                                 er.setEx_or(1);
                         }
                         else
                             er.setEx_or(0);
                         System.out.print("_______________or set__________");
                         
                         //Setting Ex_tw field
                         if(cr.getCou_tw_max()>0)
                         {
                             if(backCourseResult.isTermworkIsPass())//If PASS
                                 er.setEx_tw(0);
                             else //IF BACK
                                 er.setEx_tw(1);
                         }
                         else
                             er.setEx_tw(0);
                         System.out.print("_______________tw set__________");
                         
                         er.setCourse_code(courseB[k].trim());
                         er.setProg(stud.getProgramme());
                         er.setEx_reg_date(date);
                         er.setEx_reg_term(stud.getTerm());
                         er.setEx_reg_year(stud.getYear());
                                                  
                         er.setShift(stud.getShift()); 
                         System.out.print("_______________shift set__________");
                         if(saveOrReg.equals("registrar"))
                         {   
                             //Exam registration by registrar
                             er.setEx_cancel(0);
                         }
                         else
                         {   
                             //Exam registration by student
                             er.setEx_cancel(1);
                         }
                         
                         System.out.print("_______________setting regno __________");
                         er.setRegno(uname);
                         
                         System.out.print("_______________Calling");
                         ExamRegCon.exRegister(er);  //putting the result in result array.
                         System.out.print("__________"+courseB[k]+"_________Success");
                         } 
            catch(Exception e)
            {
                out.println("______________________________________________________Failed"+e);
            }
                    }//for loop close
            }
        session.getTransaction().commit();
     session.close(); 
        //sf.close();
      return res;
  }//method regCourse() closed
  
  
   public static int[] AllRegularRegExam(String[] course,String[] courseB,List uuname,String date,String term,int year,String saveOrReg) 
  {
        int res[]=new int[course.length];
        List list=new ArrayList();
        List li=null;
        Courses cr;
       // String uname="";
        int looplength;
        
        Query qr,qr1,qr2 = null;
        Exam_reg er=new Exam_reg();
        Course_reg creg=new Course_reg();
        sf=SessionFact.getSessionFact();
        Student_data stud=new Student_data();
        session=sf.openSession();
        
        looplength=uuname.size();
        
       System.out.println("$$######################################################Reached to regExam method...");
     int j=0;
     int result;
    for(int t=0;t<looplength;t++){
       if(!getExRegStatus((String)uuname.get(t),term,year)){
        list=session.createQuery("from Student_data where username=:username").setString("username",(String)uuname.get(t)).list();
         session.beginTransaction();
        if(saveOrReg.equals("registrar"))
        {
        qr2=session.createQuery("delete Exam_reg where regno=:regno and ex_reg_term=:term and ex_reg_year=:y1 and ex_cancel=1").setString("regno",(String)uuname.get(t)).setString("term",term).setInteger("y1",year);
        qr2.executeUpdate();
        
        }  session.getTransaction().commit();
    
        if(list!=null && list.size()==1)
              stud=(Student_data)list.get(0);
        for(int i=0;i<course.length;i++)
        {   
   
            cr=CourseCon.getCourseObject(course[i]);
            try
            { 
              /* try{ 
                   if(cr.getIs_exempted().equals("Ex"))
                    {
                      li=s.createQuery("from Course_reg where regno=:regno and reg_term=:term and year=:year and cou_code=:coucode").setString("regno", uname).setString("term", term).setInteger("year",year).setString("coucode", cr.getCourse_code()).list();
                      creg=(Course_reg)li.get(0);
                       if(creg.getReg_exmt().equals("y"))er.setEx_exmt(1);else er.setEx_exmt(0);
                    }
                  }catch(Exception e){}*/
                er.setCourse_code(course[i]);
                er.setRegno((String)uuname.get(t));
                er.setProg(stud.getProgramme()); 
                er.setEx_reg_date(date);
                er.setEx_reg_term(term);
                er.setEx_reg_year(year);
                er.setEx_cancel(0);
                if(cr.getCou_th_min()>0)er.setEx_th(1); else er.setEx_th(0);
                if(cr.getCou_pt_min()>0)er.setEx_pt(1); else er.setEx_pt(0);
                if(cr.getCou_pr_min()>0)er.setEx_pr(1); else er.setEx_pr(0);
                if(cr.getCou_tw_min()>0)er.setEx_tw(1); else er.setEx_tw(0);
                if(cr.getCou_or_min()>0)er.setEx_or(1); else er.setEx_or(0);
                er.setShift(stud.getShift()); 
        
                //calling method for storing courses of a student for exam registration.
               result=ExamRegCon.exRegister(er);                            
                res[i]=result;   //putting the result in result array.
            } 
            catch(Exception e)
            {
                out.println("______________________________________________________Failed"+e);
            }
        }
            //System.out.print("Shwetaaa");
    } }session.close(); 
        //sf.close();
      return res;}
  
  
   private static Boolean updateOldCourses(String uname,List list,String reg_can)
  {
      System.out.println("*****************************************************************************************************");
      for(Object o:list)
      {
          System.out.println("\n^^^^^^^^^^      ^^^^^^^^^^^^       ^^^^^^^^^^^^^^"+String.valueOf(o));
      }
      Session session;
      SessionFactory sf=SessionFact.getSessionFact();
      session=sf.openSession();
      session.beginTransaction();
      Admin_data ad=AdminCon.getAdminInfo();
      for(Object str:list)
      {
            System.out.print("______________________________________________Updation of course "+str+" is started.");
            List li=session.createQuery("from Course_reg where regno=:regNo and course_code=:course_code and reg_term_year=:term_year").setString("regNo", uname).setString("course_code",String.valueOf(str)).setString("term_year",ad.getReg_term_year()).list();
            
            Course_reg cr=(Course_reg)li.get(0);
            System.out.print("____________Student tuple for course-reg = "+cr.getCourse_code()+"    "+cr.getReg_can());
            if(cr.getReg_exmt().trim().equals("y"))   //If course is 
            {              
                      cr.setFail("n");
                      cr.setPass("n");
                      cr.setReg_can(reg_can);
                      cr.setReg_exmt("n");
            }
            else
                cr.setReg_can(reg_can);
            Object o=session.merge(cr);
            System.out.print("After updation "+((Course_reg)o).getReg_can());
            
            //Query qr=session.createQuery("update Course_reg set reg_can = :regCan"+" where regno= :regNo and cou_code=:course_code")/*.setString("regno", uname)*/;
            /*qr.setParameter("regCan", reg_can);
            qr.setParameter("regNo",uname );
            qr.setParameter("course_code",str ); */ 
            
            //System.out.print("____________________Updation RESULT = "+qr.executeUpdate()+" for course "+str+" reg_can = "+reg_can); 
      }
      System.out.println(".........................................EXITING UPDATE OLD COURSE......................");
      session.getTransaction().commit();
      session.close();
      //sf.close();
      return true;
  }
 //delOldCourse() method is used for deleting older courses for a student from course_reg.
  private static Boolean delOldCourses(String uname,List<String> list,String term,String year)
  {
      Boolean flag=false;
      Session session;
      SessionFactory sf=SessionFact.getSessionFact();
      session=sf.openSession();
      session.beginTransaction();
      System.out.print("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~Now in StudCon.delOldCourses() to delete previous but currently unselected courses by student.");
      for(String str:list) 
      { 
            Query qr=session.createQuery("delete Course_reg where regno=:regno and course_code=:course_code and reg_term=:term and year=:y1").setString("regno", uname).setString("term",term).setString("y1",year);
            qr.setParameter("course_code",str); 
            qr.executeUpdate();
            
      }
      session.getTransaction().commit();
      session.close();
      //sf.close();
      return flag;
  }
  
  public static Boolean changeStudPwd(String uname,String oldPwd,String newPwd)
    {
            SessionFactory sf=SessionFact.getSessionFact();
            session=sf.openSession(); 
            session.beginTransaction();
            List list=session.createQuery("from Student_data where username=:username").setString("username",uname).list();
            Student_data sd=(Student_data)list.get(0);
            
              /*ListIterator listIter=list.listIterator();
            while(listIter.hasNext()) 
            {
                Student_data sd=(Student_data)listIter.next();
                if(sd.getUsername().equals(uname) && sd.getPassword().equals(oldPwd))
                {*/
                    sd.setPassword(newPwd);
                    session.merge(sd);
                    System.out.println("Password updation done successfully in stu account");
                    session.getTransaction().commit();
                    
                   
              /*  }
            } */
            return true;
    }
  
  
  //to fetch old details of student & display them in form
  public static List editStudProfile(String uname)
  {
      List li =new ArrayList();
      List li1 =new ArrayList();
      Session s;
      SessionFactory sf;
      Query qr;
      Student_data sd = new Student_data();
      sf=SessionFact.getSessionFact();
      s=sf.openSession();
      qr=s.createQuery("from Student_data");
      if(qr!=null)
      {
       
          li = qr.list();
          if(li!=null)
          {
              ListIterator lit=li.listIterator();
              while(lit.hasNext())
              {
                  sd=(Student_data) lit.next();
                  if(uname.equals(sd.getUsername()))
                  {
                      li1.add(sd);
                      break;
                  }//end if 
              }//while
          }//inner if
      
      }//outer if
      
    
      return li1;
    }//end of method
  
  
 //to save modified details of a student  
  public static int saveStudentProfile(Student_data sd,String uname)
  {
        int i=0;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        session.beginTransaction();
        List list=session.createQuery("from Student_data where username=:username").setString("username",uname).list();
        Student_data sd1=(Student_data)list.get(0);
        sd1.setPhone_no(sd.getPhone_no());
        sd1.setS_email(sd.getS_email()); 
        session.merge(sd1);
        i=1;
        session.getTransaction().commit();
        return i;
  }
  //to get individual student information by username
  public static Object getStudentInfo(String uname)
  { 
      out.println("..................getStudentInfo..............."+uname+".................................");
      sf=SessionFact.getSessionFact();
      session=sf.openSession();
      List li=session.createQuery("from Student_data where rollno=:roll_no").setString("roll_no", uname).list();
      for(Object ob:li)
      {
          System.out.println("000000000000000000000000000000000000000"+ob);
      }
      session.close();
      //sf.close();
      if(li.size()!=0) 
        return li.get(0);
      else
          return null;
  }
  
  //Check exam registration status of student
    static public Boolean getExRegStatus(String rollno,String term,int year)
    {
        int result=0;
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        List li=session.createQuery("from Exam_reg where regno=:reg_no and ex_reg_term=:term and ex_reg_year=:year").setInteger("year", year).setString("reg_no", rollno).setString("term", term).list();
        if(li.size()>0) 
        {
            for(Object o:li)
            {
                Exam_reg examreg=(Exam_reg)o;
                if(examreg.getEx_cancel()==0)
                    result++;
            }
        }
        if(result==li.size() && result>0) 
            return true;
        else
            return false;
    }
    
  //returns the examination registration status of student
  /*public static boolean getExamRegStatus(String uname,String term,int year)
  { 
      int result=0; 
      sf=SessionFact.getSessionFact();
      session=sf.openSession();
      List li=session.createQuery("from Exam_reg where regno=:regno and ex_reg_term=:term and ex_reg_year=:y1").setString("regno", uname).setString("term",term).setInteger("y1",year).list();
      session.close();
      //sf.close();
      if(li.size()>0)
        {
            for(Object o:li)
            {
                Exam_reg examreg=(Exam_reg)o;
                if(examreg.getEx_cancel()==0)
                    result++;
            }
        }
        if(result==li.size() && result>0) 
            return true;
        else
            return false;
  }*/
  public static void regDsyFirstYearCourses(String uname,String programme,String term)
  {  
      try
      {
      System.out.print(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>reached to getDsyFirstYearCourse");
      Admin_data ad=AdminCon.getAdminInfo();
      Student_data sd=(Student_data)StudCon.getStudentInfo(uname);
      sf=SessionFact.getSessionFact();
      session=sf.openSession();
      session.beginTransaction();
      List li1=session.createQuery("from Courses where programme=:programme and year=1 and term=:term").setString("programme", programme).setString("term", term).list();   
      out.print("++++++++++++++++++++++++++++++++++++++++++++++++getDsyFirstYearCourse+++++++++++++++++++++++++++++++++++++++++++"+li1.size());
      SimpleDateFormat f=new SimpleDateFormat("dd/MM/yyyy");
      String date=f.format(new Date());
      Courses c;
      Course_reg cr;
     
      for(Object obj:li1) 
        {
            try
            {
          c=(Courses)obj;
           cr=new Course_reg();
           out.print("+___________________________++++++++getDsyFirstYearCourse______________________________________"+c.getCourse_code());
            cr.setCourse_code(c.getCourse_code());               
            cr.setFail("n");
            cr.setPass("y");
            cr.setProgram(programme);
            cr.setReg_date(date);
            cr.setReg_can("n");
            cr.setReg_exmt("y");
            cr.setRegno(uname);
            cr.setYear(1);
            cr.setReg_term(term); 
            cr.setReg_term_year(ad.getReg_term_year());
            cr.setShift(sd.getShift());
            session.save(cr);
             out.print("___________________________saved course code_____________________________________"+c.getCourse_code());
            }
            catch(Exception e){out.print("+_________________________exception : __________________________________"+e);}
        }  
      session.getTransaction().commit();
      
      }
      catch(Exception e){} 
      session.close();
      //sf.close();
  }
  
  public static int getStudTerm(String term,int year)
  {
      if(term.equals("ODD") && year==1)
      {
          return 1;
      }
      else if(term.equals("EVEN") && year==1)
      {
          return 2;
      }
      else if(term.equals("ODD") && year==2)
      {
          return 3;
      }
      else if(term.equals("EVEN") && year==2)
      {
          return 4;
      } 
      else if(term.equals("ODD") && year==3)
      {
          return 5;
      } 
      else if(term.equals("EVEN") && year==3)
      {
          return 6;
      } 
      else
      return 0;
  }
  
  public static int registerStudent(Student_data stud)
  {
      int i=0;
        sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
        session.beginTransaction();
       
        stud.setPassword(stud.getRollno());
        session.merge(stud);
        i=1;
        session.getTransaction().commit();
        return i;
  }
  public static class studRegList {
    private String course_code ,course_name,roll,stud_name,programme,email,phone_no,term;
     private int cou_credit,cou_th_min ,cou_pt_min ,cou_tw_min,cou_pr_min,cou_or_min,year,shift;

        public int getShift() {
            return shift;
        }

        public void setShift(int shift) {
            this.shift = shift;
        }

        public String getTerm() {
            return term;
        }

        public void setTerm(String term) {
            this.term = term;
        }
        public int getYear() {
            return year;
        }

        public void setYear(int year) {
            this.year = year;
        }

        public String getProgramme() {
            return programme;
        }

        public void setProgramme(String programme) {
            this.programme = programme;
        }

        public String getEmail() {
            return email;
        }

        public void setEmail(String email) {
            this.email = email;
        }

        public String getPhone_no() {
            return phone_no;
        }

        public void setPhone_no(String phone_no) {
            this.phone_no = phone_no;
        }

        public int getCou_credit() {
            return cou_credit;
        }

        public void setCou_credit(int cou_credit) {
            this.cou_credit = cou_credit;
        }

        public String getCourse_code() {
            return course_code;
        }

        public void setCourse_code(String course_code) {
            this.course_code = course_code;
        }

        public String getCourse_name() {
            return course_name;
        }

        public void setCourse_name(String course_name) {
            this.course_name = course_name;
        }

        public String getRoll() {
            return roll;
        }

        public void setRoll(String roll) {
            this.roll = roll;
        }

        public String getStud_name() {
            return stud_name;
        }

        public void setStud_name(String stud_name) {
            this.stud_name = stud_name;
        }

        public int getCou_th_min() {
            return cou_th_min;
        }

        public void setCou_th_min(int cou_th_min) {
            this.cou_th_min = cou_th_min;
        }

        public int getCou_pt_min() {
            return cou_pt_min;
        }

        public void setCou_pt_min(int cou_pt_min) {
            this.cou_pt_min = cou_pt_min;
        }

        public int getCou_tw_min() {
            return cou_tw_min;
        }

        public void setCou_tw_min(int cou_tw_min) {
            this.cou_tw_min = cou_tw_min;
        }

        public int getCou_pr_min() {
            return cou_pr_min;
        }

        public void setCou_pr_min(int cou_pr_min) {
            this.cou_pr_min = cou_pr_min;
        }

        public int getCou_or_min() {
            return cou_or_min;
        }

        public void setCou_or_min(int cou_or_min) {
            this.cou_or_min = cou_or_min;
        }
  }
  public static List getstudRegList(List studLi)
  { 
       Student_data li;
        List <Course_reg> li1=new ArrayList<Course_reg>();
              List  li2;
         List<studRegList> list=new ArrayList<studRegList>();
    Course_reg cr=new Course_reg();
    Courses course;
    StudCon stud=new StudCon();
    StudCon.studRegList student;
    sf=SessionFact.getSessionFact(); 
        session=sf.openSession();
    for(Object oo:studLi)
    {
        li=(Student_data)getStudentInfo((String) oo);
         
                li1=(List)getRegCourse(li.getRollno(),li.getTerm(),li.getYear());  
              
                    for(Object obj2:li1){
                
                    Course_reg cr1=(Course_reg)obj2;
                    
                    course =CourseCon.getCourseObject(cr1.getCourse_code());
                   student=new StudCon.studRegList();
                    student.setRoll(li.getRollno());
                    student.setStud_name(li.getS_name());
                    student.setProgramme(li.getProgramme());
                    student.setYear(li.getYear());
                    student.setTerm(li.getTerm());
//                    student.setEmail(li.getS_email());
//                    student.setPhone_no(li.getPhone_no());
                    student.setShift(li.getShift());
                    
                    student.setCourse_code(course.getCourse_code());
                    student.setCourse_name(course.getCourse_name());
                    student.setCou_credit(course.getCou_credit());
                    student.setCou_th_min(course.getCou_th_min());
                    student.setCou_pt_min(course.getCou_pt_min());
                    student.setCou_tw_min(course.getCou_tw_min());
                    student.setCou_pr_min(course.getCou_pr_min());
                    student.setCou_or_min(course.getCou_or_min());
                    
                   
                    list.add(student);
                   
             
                  }
            
    } 
    //session.close();
   
    return list;
  }
  
}//class closed