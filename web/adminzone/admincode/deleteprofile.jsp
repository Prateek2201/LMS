<%@page import="mypackage.ConnectDb"%>
<%
    String sid=request.getParameter("sid");
    try{
        String query="delete from login where sid='"+sid+"'";
        ConnectDb ob=new ConnectDb();
        if(ob.executeNonQuery("query")==true){
            out.print("<script>alert('Student with sid="+sid+" deleted successfully');window.location.href='../stdmgmt.jsp';</script>");
        }
        else{
            System.out.println(sid);
            out.print("<script>alert('Student with sid="+sid+" not deleted');window.location.href='../stdmgmt.jsp';</script>");
        }
    }
    catch(Exception e){
        out.print("<script>alert('"+e+"');window.location.href='../stdmgmt.jsp';</script>");
    }
%>