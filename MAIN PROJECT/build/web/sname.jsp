<%-- 
    Document   : sname
    Created on : Dec 23, 2022, 1:41:40 AM
    Author     : CodeCrafters
--%>
<%@page import="DSAS.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String keyword = request.getParameter("sname");

    Connection con = SQLconnection.getconnection();
    Statement st = con.createStatement();
    try {

        ResultSet rs = st.executeQuery("select * from patients where name LIKE '%" + keyword + "%' ");
        if (rs.next()) {
          response.sendRedirect("search_data.jsp?sword="+keyword+"&col=name");
        } else {
            response.sendRedirect("Search.jsp?failed");
        }
    } catch (Exception ex) {
        ex.printStackTrace();
    }
%>
