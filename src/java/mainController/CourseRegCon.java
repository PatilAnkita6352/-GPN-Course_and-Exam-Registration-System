/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import beans.Course_reg;

import java.util.ArrayList;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import beans.Student_data;
import java.util.ListIterator;
import org.hibernate.Query;
import SessionFact.SessionFact;

/**
 *
 * @author sarvadnya
 */
public class CourseRegCon {
    static Session session;
    static SessionFactory sf;
    static Course_reg cr;
    
    public static int Cou_register(Course_reg creg)
    {
        int i=0;
        //Session session=new Configuration().configure().buildSessionFactory().openSession();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        System.out.print("_______________________________________________________________________________Reached to Cou_register method");
        //System.out.print("_______________________________________________________________________________Cou_code = "+creg.getCou_code());
        System.out.print("Going to register(in Cou_register method) _____"+creg.getId()+"_________"+creg.getCourse_code()+"________"+creg.getRegno()+"______"+creg.getProgram());
        session.beginTransaction();
        i=(Integer)session.save(creg);
        session.getTransaction().commit();
        session.close();
        //sf.close();
        return i;
    }
    
    /*This nested static class of CourseRegCon class is used in getCourseReportbyFilter() method of CourseRegCon class
            CourseRegRep class is created to combine data of 2 tables into one object */
    public static class CourseRegRep
     {
        String regno,studName,course_code,courseName,reg_term_year,program;
         int year,shift;

        public CourseRegRep(String regno, String course_code, String reg_term_year, String program, int year, int shift) {
            this.regno = regno;
            this.course_code = course_code;
            this.reg_term_year = reg_term_year;
            this.program = program;
            this.year = year;
            this.shift = shift;
        }

        public void setStudName(String studName) 
        {this.studName = studName;}
        public void setCourseName(String courseName) 
        {this.courseName = courseName;}

        public String getRegno() 
        { return regno;}
        public String getStudName() 
        {return studName;}
        public String getCourse_code() 
        {return course_code;}
        public String getCourseName() 
        {return courseName;}
        public String getReg_term_year() 
        {return reg_term_year;}
        public String getProgram() 
        {return program;}
        public int getYear() 
        {return year;}
        public int getShift() 
        {return shift;}   
     }
    
    //Retrieving course registration report according to filter set by user.
     public static List getCourseReportbyFilter(String coursecode,String reg_year,String branch,int stud_reg_year,int shift)
     {
        int i=0;
        Query qr;
        List list,liStud,liCourse;
        List<CourseRegRep>li=new ArrayList<>();
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        String query="FROM Course_reg where reg_term_year=:reg_year";
        
        if(coursecode!=null)
        {
            query=query+" and course_code=:coursecode";    
        }
        if(branch!=null)
        {
            query=query+" and program=:branch";
        }
        if(stud_reg_year!=0)
        {
            query=query+" and year="+stud_reg_year+"";
        }
        if(shift!=0)
        {
            query=query+" and shift="+shift+"";
        }
        query=query+" and reg_can=:n order by regno asc";
        
        qr=session.createQuery(query);
        qr.setString("reg_year",reg_year);
        qr.setString("n","n");
          if(coursecode!=null)
        {
            qr.setString("coursecode",coursecode);
        }
        if(branch!=null)
        {
            qr.setString("branch",branch);
        }
       list=qr.list();
        for(Object a:list)
        {
            Course_reg c=(Course_reg)a;
            
            /*CourseRegRep is a static nested class of CourseRegCon class .
            CourseRegRep class is created to combine data of 2 tables into one object ,it also helps 
            while adding proper data in the list ,we are using list to avoid too many connection error */
            
            CourseRegRep cr=new CourseRegRep(c.getRegno(),c.getCourse_code(),c.getReg_term_year(),c.getProgram(),c.getYear(),c.getShift());
            qr=session.createQuery("Select s_name FROM Student_data where rollno=:regno").setString("regno",c.getRegno());
            liStud=qr.list();
            if(liStud.size()!=0)
            cr.setStudName((String)liStud.get(0));
            
            qr=session.createQuery("Select course_name FROM Courses where course_code=:coursecode").setString("coursecode",c.getCourse_code());
            liCourse=qr.list();
            if(liCourse.size()!=0)
            cr.setCourseName((String)liCourse.get(0));
            li.add(cr);
        }
       
        session.close();
        return li;
     }
     
      public static List getStudName(String rollno)
     {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        Query q =session.createQuery(" select st.s_name FROM Student_data st  WHERE st.rollno=:rollno").setString("rollno",rollno);
        List name=q.list();
        return name;
     }
      public static List getCourseName(String course_code)
     {
        sf=SessionFact.getSessionFact();
        session=sf.openSession();
        session.beginTransaction();
        Query q =session.createQuery(" select st.course_name FROM Courses st  WHERE st.course_code=:course_code").setString("course_code",course_code);
        List name=q.list();
        return name;
     }
      
      
}
