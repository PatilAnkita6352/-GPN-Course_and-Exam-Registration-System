/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.math.BigInteger;
import java.security.MessageDigest;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Ghost
 */
public class NewClass {
    public static void main(String[] args)
    {try{
        String constring = "jdbc:mysql://localhost:3306/registration_system";
            String username="root";
            String pass ="";
            Connection con;
            con=(Connection) DriverManager.getConnection(constring,username, pass);
            if(con!=null){System.out.print("Connection");}else{System.out.println("hii");}
            String sql="Select * from hod_data";
            Statement s=(Statement) con.prepareStatement(sql);
            ResultSet rs= s.executeQuery(sql);
            
            while(rs.next())
            {
                PreparedStatement s1=con.prepareStatement("Update hod_data set password='"+md5(rs.getString("password"))+"' where username='"+rs.getString("username")+"'");
                int rs1=s1.executeUpdate();
                System.out.println(rs1);
            }
            
             sql="Select * from student_data";
            s=(Statement) con.prepareStatement(sql);
             rs= s.executeQuery(sql);
            
            while(rs.next())
            {
                PreparedStatement s1=con.prepareStatement("Update student_data set password='"+md5(rs.getString("password"))+"' where rollno='"+rs.getString("rollno")+"'");
                int rs1=s1.executeUpdate();
                System.out.println(rs1);
            }
            con.close();
    }catch(Exception e){System.out.println(e);}
    }
    public static String md5(String pass)
    {
        try{
            MessageDigest md=MessageDigest.getInstance("MD5");
            byte[] messageDigest=md.digest(pass.getBytes());
            BigInteger num=new BigInteger(1,messageDigest);
            String hashText=num.toString(16);
            while(hashText.length()<32)
            {
                hashText="0"+hashText;
            }
            return hashText;
            
        }
        catch(Exception e)
        {
            throw new RuntimeException(e);
        }
    }
}