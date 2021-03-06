<%@page import="mypackage.ConnectDb"%>
<%
    String feedback=request.getParameter("feedback");
    String userid=session.getAttribute("userid")+"";
    String name=session.getAttribute("name")+"";
    ConnectDb db=new ConnectDb();
    String date=db.getDate();
    String query="insert into feedback(name,userid,ftext,dt) values('"+name+"','"+userid+"','"+feedback+"','"+date+"')";
    String msg=(db.executeNonQuery(query)==true)?"Feedback is submitted":"Feedback is not submitted";
    out.print(db.getAlert(msg,"../feedback.jsp"));
%>