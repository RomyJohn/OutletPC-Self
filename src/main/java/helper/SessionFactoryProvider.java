package helper;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class SessionFactoryProvider {

    private static SessionFactory sessionFactory;

    public static SessionFactory getSessionFactory() {

        try {
            if (sessionFactory == null) {
                return sessionFactory = new Configuration().configure().buildSessionFactory();
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return sessionFactory;
    }
}
