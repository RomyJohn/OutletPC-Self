package controllers;

import entities.Orders;
import entities.UserData;
import helper.SessionFactoryProvider;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class User {

    private SessionFactory sessionFactory = SessionFactoryProvider.getSessionFactory();

    @PostMapping("/signup")
    public String signup(UserData userData) {

        boolean state = false;
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from UserData where number='" + userData.getNumber() + "'");
            UserData retrieve1 = (UserData) query.uniqueResult();
            if (retrieve1 == null) {
                if (userData.getEmail().equals("")) {
                    userData.setEmail("null");
                    state = true;
                } else {
                    query = session.createQuery("from UserData where email='" + userData.getEmail() + "'");
                    UserData retrieve2 = (UserData) query.uniqueResult();
                    if (retrieve2 == null || retrieve2.getEmail().equals("null")) {
                        state = true;
                    } else {
                        session.close();
                        return "eused";
                    }
                }
                if (state) {
                    Transaction transaction = session.beginTransaction();
                    session.save(userData);
                    transaction.commit();
                    session.close();
                    return "success";
                }
            } else {
                session.close();
                return "nused";
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/login")
    public String login(UserData userData, HttpSession servletSession) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from UserData where email='" + userData.getUsername() + "' or number='" + userData.getUsername() + "' and password='" + userData.getPassword() + "'");
            UserData retrieve = (UserData) query.uniqueResult();
            if (retrieve != null && retrieve.getPassword().equals(userData.getPassword())) {
                servletSession.setAttribute("user", retrieve);
                session.close();
                return "success";
            } else {
                session.close();
                return "error";
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/reset")
    public String reset(UserData userData) {
        UserData retrieve = null;
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from UserData where email='" + userData.getUsername() + "' or number='" + userData.getUsername() + "'");
            retrieve = (UserData) query.uniqueResult();
            if (retrieve != null) {
                session.close();
                return retrieve.getPassword();
            } else {
                session.close();
                return "error";
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @GetMapping("/logout")
    public String logout(HttpSession servletSession) {
        servletSession.removeAttribute("user");
        return "success";
    }

    @PostMapping("/updateName")
    public String updateName(UserData userData, HttpSession servletSession) {
        try {
            UserData currentUser = (UserData) servletSession.getAttribute("user");
            if (userData.getName().equals(currentUser.getName())) {
                return "success";
            } else {
                Session session = sessionFactory.openSession();
                Query query = session.createQuery("update UserData set name='" + userData.getName() + "' where id='" + currentUser.getId() + "'");
                Transaction transaction = session.beginTransaction();
                query.executeUpdate();
                transaction.commit();
                query = session.createQuery("from UserData where id='" + currentUser.getId() + "'");
                UserData retrieve = (UserData) query.uniqueResult();
                servletSession.setAttribute("user", retrieve);
                session.close();
                return "success";
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/updateNumber")
    public String updateNumber(UserData userData, HttpSession servletSession) {
        try {
            UserData currentUser = (UserData) servletSession.getAttribute("user");
            if (userData.getNumber() == currentUser.getNumber()) {
                return "success";
            } else {
                Session session = sessionFactory.openSession();
                Query query = session.createQuery("from UserData where number='" + userData.getNumber() + "'");
                UserData retrieve1 = (UserData) query.uniqueResult();
                if (retrieve1 == null) {
                    query = session.createQuery("update UserData set number='" + userData.getNumber() + "' where id='" + currentUser.getId() + "'");
                    Transaction transaction = session.beginTransaction();
                    query.executeUpdate();
                    transaction.commit();
                    query = session.createQuery("from UserData where id='" + currentUser.getId() + "'");
                    UserData retrieve2 = (UserData) query.uniqueResult();
                    servletSession.setAttribute("user", retrieve2);
                    session.close();
                    return "success";
                } else {
                    session.close();
                    return "nused";
                }
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/updateEmail")
    public String updateEmail(UserData userData, HttpSession servletSession) {
        try {
            UserData currentUser = (UserData) servletSession.getAttribute("user");
            if (userData.getEmail().equals(currentUser.getEmail())) {
                return "success";
            } else {
                if (userData.getEmail().equals("")) {
                    userData.setEmail(null);
                }
                Session session = sessionFactory.openSession();
                Query query = session.createQuery("from UserData where email='" + userData.getEmail() + "'");
                UserData retrieve1 = (UserData) query.uniqueResult();
                if (retrieve1 == null || retrieve1.getEmail().equals("null")) {
                    query = session.createQuery("update UserData set email='" + userData.getEmail() + "' where id='" + currentUser.getId() + "'");
                    Transaction transaction = session.beginTransaction();
                    query.executeUpdate();
                    transaction.commit();
                    query = session.createQuery("from UserData where id='" + currentUser.getId() + "'");
                    UserData retrieve2 = (UserData) query.uniqueResult();
                    servletSession.setAttribute("user", retrieve2);
                    session.close();
                    return "success";
                } else {
                    session.close();
                    return "eused";
                }
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/updatePassword")
    public String updatePassword(HttpSession servletSession, HttpServletRequest request) {

        String currentPassword = request.getParameter("currentPassword");
        String password = request.getParameter("password");
        String cpassword = request.getParameter("cpassword");

        if (password.equals(cpassword)) {
            UserData currentUser = (UserData) servletSession.getAttribute("user");
            if (currentPassword.equals(currentUser.getPassword())) {
                if (password.equals(currentUser.getPassword())) {
                    return "pused";
                } else {
                    try {
                        Session session = sessionFactory.openSession();
                        Query query = session.createQuery("update UserData set password='" + password + "' where id='" + currentUser.getId() + "'");
                        Transaction transaction = session.beginTransaction();
                        query.executeUpdate();
                        transaction.commit();
                        query = session.createQuery("from UserData where id='" + currentUser.getId() + "'");
                        UserData retrieve = (UserData) query.uniqueResult();
                        servletSession.setAttribute("user", retrieve);
                        session.close();
                        return "success";
                    } catch (HibernateException e) {
                        System.out.println(e);
                    }
                }
            } else {
                return "invalid";
            }
        } else {
            return "nomatch";
        }
        return null;
    }

    @PostMapping("/deactivateAccount")
    public String deactivateAccount(HttpSession servletSession) {
        try {
            UserData currentUser = (UserData) servletSession.getAttribute("user");
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("delete from Orders where userId_id='" + currentUser.getId() + "'");
            Transaction transaction = session.beginTransaction();
            query.executeUpdate();
            transaction.commit();
            query = session.createQuery("delete from UserData where id='" + currentUser.getId() + "'");
            transaction = session.beginTransaction();
            query.executeUpdate();
            transaction.commit();
            session.close();
            return "success";
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/updateAddress")
    public String updateAddress(UserData userData, HttpSession servletSession) {
        UserData currentUser = (UserData) servletSession.getAttribute("user");
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("update UserData set pin='" + userData.getPin() + "', locality='" + userData.getLocality() + "', address='" + userData.getAddress() + "', district='" + userData.getDistrict() + "', states='" + userData.getStates() + "' where id='" + currentUser.getId() + "'");
            Transaction transaction = session.beginTransaction();
            query.executeUpdate();
            transaction.commit();
            query = session.createQuery("from UserData where id='" + currentUser.getId() + "'");
            UserData retrieve = (UserData) query.uniqueResult();
            servletSession.setAttribute("user", retrieve);
            session.close();
            return "success";
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/orders")
    public void orders(HttpServletRequest request) {

        int id = Integer.parseInt(request.getParameter("userId"));
        String[] productsId = request.getParameterValues("productId");
        String[] productsPrice = request.getParameterValues("productPrice");
        String[] productsQty = request.getParameterValues("productQty");
        String[] productsName = request.getParameterValues("productName");
        String[] productsImage = request.getParameterValues("productImage");

        UserData userData = new UserData();
        Orders orders = new Orders();
        Date date = new Date();
        userData.setId(id);

        try {
            for (int i = 0; i < productsId.length; i++) {
                Session session = sessionFactory.openSession();
                Transaction transaction = session.beginTransaction();
                orders.setUserId(userData);
                orders.setProductId(Integer.parseInt(productsId[i]));
                orders.setProductPrice(Integer.parseInt(productsPrice[i]));
                orders.setProductQuantity(Integer.parseInt(productsQty[i]));
                orders.setOrderDate(date);
                orders.setProductImage(productsImage[i]);
                orders.setProductName(productsName[i]);
                session.save(orders);
                transaction.commit();
            }
        } catch (HibernateException e) {
            System.out.println(e);
        }
    }

    public List<Orders> ordersList(int id) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from Orders where userId_id='" + id + "'");
            List<Orders> list = (List<Orders>) query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

}
