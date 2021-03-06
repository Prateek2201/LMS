<%@page import="java.sql.ResultSet"%>
<%@page import="mypackage.ConnectDb"%>
    <div style="height:0px auto;width:80%;margin: 0px auto;font-size: 18px;">
    <h2>Notifications</h2>
    <br /><br />
    <marquee direction="up" scrollamount="8" onmouseover="stop();" onmouseout="start();">
    <table class="table">
        <tr>
            <th>Book ID</th>
            <th>Book Name</th>
            <th>Issue Date</th>
        </tr>
            <%
                ConnectDb db=new ConnectDb();
                ResultSet rs=db.selectQuery("select bid,bname,issuedate from issue");
                while(rs.next())
                {
            %>
            <tr>
                <td><%=rs.getString(1)%></td>
                <td><%=rs.getString(2)%></td>
                <td><%=rs.getString(3)%></td>
            </tr>
            <%  }%>
    </table>
    </marquee>
    </div>