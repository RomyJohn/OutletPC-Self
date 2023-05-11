package controllers;

import entities.CategoryData;
import helper.SessionFactoryProvider;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;

@Controller
public class Category {

    private SessionFactory sessionFactory = SessionFactoryProvider.getSessionFactory();

    public List<CategoryData> getCategories() {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from CategoryData");
            List<CategoryData> list = query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

}
