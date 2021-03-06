<%@page import="mypackage.ConnectDb"%>
<%
    String oldpassword=request.getParameter("oldpassword");
    String newpassword=request.getParameter("newpassword");
    String confirmpassword=request.getParameter("confirmpassword");
    String userid=session.getAttribute("userid").toString();
    if(newpassword.equals(confirmpassword))
    {
        String query="update login set password='"+newpassword+"' where sid='"+userid+"' and password='"+oldpassword+"'";
        ConnectDb db=new ConnectDb();
        boolean res=db.executeNonQuery(query);
        if(res==true)
        {
            String query1="update student set password='"+newpassword+"' where sid='"+userid+"' and password='"+oldpassword+"'";
            ConnectDb db1=new ConnectDb();
            if(db1.executeNonQuery(query1)==true)
            {
            out.print("<script>alert('Password is changed');window.location.href='../changepwd.jsp';</script>");
            }
            else
            {
                out.print("<script>alert('Password is not changed');window.location.href='../changepwd.jsp';</script>");
            }
        }
        else
        {
            out.print("<script>alert('Password is not changed');window.location.href='../changepwd.jsp';</script>");
        }
    }
    else
    {
        out.print("<script>alert('new password and confirm password are not matched');window.location.href='../changepwd.jsp';</script>");
    }
%>