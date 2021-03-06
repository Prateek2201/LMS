<%@page import="mypackage.ConnectDb"%>
<%
    String answertext=request.getParameter("answertext");
    String answeredby=session.getAttribute("name").toString();
    ConnectDb db=new ConnectDb();
    String posteddate=db.getDate();
    int qid=Integer.parseInt(request.getParameter("qid"));
    String query="insert into answer(answertext,answeredby,posteddate,qid) values('"+answertext+"','"+answeredby+"','"+posteddate+"','"+qid+"')";



    if(db.executeNonQuery(query)==true)
    {
        out.print("<script>alert('Answer is posted');window.location.href='../postquestion.jsp';</script>");
    }
    else
    {
        out.print("<script>alert('Answer is not posted');window.location.href='../postquestion.jsp';</script>");
    }
%>