package com.uniovi.sdi;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "StoreProductsServlet", value = "/products") //Antes /StoreProductsServlet
public class ServletProducts extends HttpServlet {
    private List<Product> storeProducts;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        // Creamos la lista
        storeProducts = new LinkedList<Product>();
        ObjectContainer db = null;
        try {
            db = Db4oEmbedded.openFile("C:\\Users\\Lara\\IntelliJ\\bdProducts");
            List<Product> products = db.queryByExample(Product.class);
            //Almacenamos en variable
            storeProducts.addAll(products);

        } finally {
            db.close();
        }

        request.setAttribute("storeProducts", storeProducts);
        getServletContext().getRequestDispatcher("/products-view.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }


    private List<Product> getStoreProducts() {
        return storeProducts;
    }
}
