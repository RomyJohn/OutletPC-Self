<%@page import="org.springframework.context.annotation.AnnotationConfigApplicationContext"%>
<%@page import="org.springframework.context.ApplicationContext"%>
<%@page import="config.OutletpcApplication"%>
<%@page import="java.util.List"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="entities.ProductData"%>
<%@page import="controllers.Product"%>

<%
    DecimalFormat currencyFormat = new DecimalFormat("##,##,###");

    int count = 0;

    int cId = Integer.parseInt(request.getParameter("cId"));
    int minPrice = Integer.parseInt(request.getParameter("minPrice"));
    int maxPrice = Integer.parseInt(request.getParameter("maxPrice"));
    String brands = request.getParameter("brands");
    String sort = request.getParameter("sort");
    String stock = request.getParameter("stock");
    String filter = request.getParameter("filter");
    String title = request.getParameter("title");

    ApplicationContext context = new AnnotationConfigApplicationContext(OutletpcApplication.class);
    Product product = context.getBean("product", Product.class);
    List<ProductData> getProducts = null;

    if (filter.equals("products")) {
        List<String> brandsList = product.getProductsBrands(cId, null, "products");
        if (brands.equals("")) {
            for (String list : brandsList) {
                brands += list.concat(",");
            }
        }
        getProducts = product.filterProducts(cId, null, minPrice, maxPrice, brands, sort, stock, filter);
    } else {
        List<String> brandsList = product.getProductsBrands(0, title, "search");
        if (brands.equals("")) {
            for (String list : brandsList) {
                brands += list.concat(",");
            }
        }
        getProducts = product.filterProducts(0, title, minPrice, maxPrice, brands, sort, stock, filter);
    }
%>

<%if (getProducts.isEmpty()) {%>
<div class="row justify-content-center">
    <div class="col-12 text-center">
        <img src="Images/Logo/error_1.png" class="img-fluid" alt="No Image">
        <h5 class="pt-5 pb-2">Sorry, no results found!</h5>
    </div>
    <%} else {
        for (ProductData list : getProducts) {

            count++;
    %>
    <%@include file="Plugins/Products/section.jsp"%>
    <%}
        }%>

    <script>
        $("#count").html(<%if (count > 1) {%><%=count%> + " products"<%} else {%><%=count%> + " product"<%}%>);
    </script>
