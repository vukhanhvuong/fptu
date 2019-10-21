<%-- 
    Document   : viewCart
    Created on : Oct 3, 2019, 9:53:15 AM
    Author     : buith
--%>

<%@page import="java.util.Map"%>
<%@page import="bth.Cart.CartObj"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Book</title>
    </head>
    <body>
        <h1>Your Cart include</h1>

        <%
            //1. Go to cart place
            if (session != null) {
                //2. Get cart
                CartObj cart = (CartObj) session.getAttribute("CART");
                if (cart != null) {
                    Map<String, Integer> items = cart.getItems();
                    if (items != null) {


        %>
        <form action="DispatchController">

            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Item Name</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <%                                int count = 0;
                        for (String itemName : items.keySet()) {
                    %> 
                    <tr>
                        <td>
                            <%= ++count%>
                        </td>
                        <td>
                            <%= itemName%>
                        </td>
                        <td>
                            <%= items.get(itemName)%>
                        </td>
                        <td>
                           
                            <input type="checkbox" name="chkItem" value="<%= itemName%>">
                        </td>
                    </tr>
                    <%
                        }
                    %>
                    <tr>
                        <td colspan="3">
                            <a href="onlineShopping.html">Add More Book to Cart</a>
                        </td>
                        <td>
                            <input type="submit" name="btAction" value="Remove">
                        </td>
                    </tr>
                </tbody>
            </table>
        </form>
        <%
                        return;
                    }//end if item is not null
                }//end if cart is not null
            }//end if session
%>

        <h1>No cart is existed!!!</h1>
    </body>
</html>
