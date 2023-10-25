/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package SessionFact;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

/**
 *
 * @author sarvadnya
 */
public class SessionFact {
    static SessionFactory sf;
    private static ServiceRegistry serviceRegistry;
    static Configuration cfg;
    static
    {
	cfg = new Configuration();
        cfg.configure("hibernate.cfg.xml");
        serviceRegistry=new StandardServiceRegistryBuilder().applySettings(cfg.getProperties()).build();
        sf=cfg.buildSessionFactory(serviceRegistry);
    }

    
    public static SessionFactory getSessionFact()
    {
        return sf;
    }
}
