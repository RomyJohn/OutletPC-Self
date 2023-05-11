package controllers;

import entities.ProductData;
import entities.Reviews;
import entities.Specifications;
import helper.SessionFactoryProvider;
import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class Product {

    private SessionFactory sessionFactory = SessionFactoryProvider.getSessionFactory();

    public List<ProductData> getProducts() {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from ProductData");
            List<ProductData> list = query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ProductData> getProducts(int id) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from ProductData where categoryData_id='" + id + "'");
            List<ProductData> list = query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<String> getProductsBrands(int id, String productName, String filter) {
        try {
            Session session = sessionFactory.openSession();
            String sqlQuery = null;
            if (filter.equals("products")) {
                sqlQuery = "select distinct brand from ProductData where categoryData_id='" + id + "' order by brand";
            } else {
                sqlQuery = "select distinct brand from ProductData where title like '%" + productName + "%' order by brand";
            }
            Query query = session.createQuery(sqlQuery);
            List<String> list = query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<ProductData> filterProducts(int id, String productName, int minPrice, int maxPrice, String brands, String sort, String stock, String filter) {
        try {
            Session session = sessionFactory.openSession();
            String sqlQuery = null;

            if (filter.equals("products")) {
                if (stock.equals("checked")) {
                    if (sort.equals("relevance")) {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "')";
                    } else if (sort.equals("low")) {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') order by discount asc";
                    } else {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') order by discount desc";
                    }
                } else {
                    if (sort.equals("relevance")) {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in'";
                    } else if (sort.equals("low")) {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in' order by discount asc";
                    } else {
                        sqlQuery = "from ProductData where categoryData_id='" + id + "' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in' order by discount desc";
                    }
                }
            } else {
                if (stock.equals("checked")) {
                    if (sort.equals("relevance")) {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "')";
                    } else if (sort.equals("low")) {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') order by discount asc";
                    } else {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') order by discount desc";
                    }
                } else {
                    if (sort.equals("relevance")) {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in'";
                    } else if (sort.equals("low")) {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in' order by discount asc";
                    } else {
                        sqlQuery = "from ProductData where title like '%" + productName + "%' and discount between '" + minPrice + "' and '" + maxPrice + "' and brand in('" + brands.replace(",", "','") + "') and stock='in' order by discount desc";
                    }
                }
            }
            Query query = session.createQuery(sqlQuery);
            List<ProductData> list = query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public ProductData getProductDescription(int id) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from ProductData where id='" + id + "'");
            ProductData productsData = (ProductData) query.uniqueResult();
            session.close();
            return productsData;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public Specifications getProductSpecifications(int id) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from Specifications where productData_id='" + id + "'");
            Specifications specifications = (Specifications) query.uniqueResult();
            session.close();
            return specifications;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    @PostMapping("/uploadReview")
    @ResponseBody
    public String uploadReview(Reviews reviews) {
        try {
            Session session = sessionFactory.openSession();
            Transaction transaction = session.beginTransaction();
            session.save(reviews);
            transaction.commit();
            session.close();
            return "success";
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Reviews> getReviews(int id) {
        try {
            Session session = sessionFactory.openSession();
            Query query = session.createQuery("from Reviews where productId='" + id + "'");
            List<Reviews> list = (List<Reviews>) query.list();
            session.close();
            return list;
        } catch (HibernateException e) {
            System.out.println(e);
        }
        return null;
    }

}
