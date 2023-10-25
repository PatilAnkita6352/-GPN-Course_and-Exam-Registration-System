/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mainController;

import beans.StudentCourses;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

/**
 *
 * @author Shubham Nehe
 */
public class StudentCoursesCon {
    static Session session;
    static SessionFactory sf;
     public static StudentCourses getStudCourseResult(String rollNo,String courseCode)
    {
        List li=null;
        try
        {
            sf=SessionFact.SessionFact.getSessionFact();
            session=sf.openSession();
            System.out.print("__________________Reached to getStudCourseResult method \nRoll no. = "+rollNo+"\nCourseCode = "+courseCode);
            //li=session.createQuery("from StudentCourses where studentId=:rollNo and courseCode=:courseCode").setString("rollNo",rollNo).setString("courseCode", courseCode).list(); 
            session.close();
            //sf.close();
            
        }
        catch(Exception e){System.out.print("__________________getStudCourseResult() exception");}
        System.out.print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nn\n\n\n\n\n\n\n________returning from getStudCourseResult()________________");
        /*if(li.size()>0)
            return (StudentCourses)li.get(0);
        else 
            return null;*/
        
        
        return new StudentCourses();
    }
}
