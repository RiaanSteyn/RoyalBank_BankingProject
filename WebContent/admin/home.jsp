<%@page language="java" contentType="text/html;" pageEncoding="UTF-8"%>
<%@page import="coza.royalbank.dao.CustomersDAO"%>
<%@page import="coza.royalbank.dao.CustToAccDAO"%>
<%@page import="coza.royalbank.model.*"%>
<%@page import="java.util.*"%>
<%@page import="org.hibernate.*"%>
<%@page import="coza.royalbank.util.HibernateSessionFactory"%>
<%@page import="org.hibernate.SessionFactory"%>
<%
	// Get the SessionFactory so that a Session can be created to execute queries
	SessionFactory sessionFactory = HibernateSessionFactory.getSessionFactory();
	Session sess = sessionFactory.openSession();
	
	List<CustToAcc> customers = CustToAccDAO.getAll(sess);
	Admin a = (Admin) request.getSession().getAttribute("liu");

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>Royal Bank | Admin - Home</title>
		<%@ include file = "../links/tablelinks.jsp" %>
</head>
<body>
	<h1 >Home</h1>
		<div>
			<%= a.getAdmin_username() %> <a href="admin/index.jsp">Logout</a>
		</div>
		
		<h2 >Customers</h2>
	<div id="tablewrapper">
		<div id="tableheader">
        	<div class="search">
                <select id="columns" onchange="sorter.search('query')"></select>
                <input type="text" id="query" onkeyup="sorter.search('query')" />
            </div>
            <span class="details">
				Records <span id="startrecord"></span>-<span id="endrecord"></span> of <span id="totalrecords"></span>
        		<a href="javascript:sorter.reset()">reset</a>
        	</span>
        </div>
        <table cellpadding="0" cellspacing="0" border="0" id="table" class="tinytable">
            <thead>
                <tr>
                    <th><h3>Title</h3></th>
					<th><h3>First Name</h3></th>
					<th><h3>Last Name</h3></th>
					<th><h3>ID Number</h3></th>
					<th><h3>Pending Accounts</h3></th>
                </tr>
            </thead>
            <tbody>
              <% for(CustToAcc c : customers) { %>
				<tr>				
					<td><%= c.getCustomer().getCust_title() %></td>
					<td><a href="admin/customer.jsp?customer=<%= c.getCustomer().getCust_id() %>"><%= c.getCustomer().getCust_first_name() %></a></td>
					<td><%= c.getCustomer().getCust_last_name()%></td>
					<td><%= c.getCustomer().getCust_id_number()%></td>
					<td>
						<% if(c.getCust_acc_approved() == false && c.getCust_acc_declined() == false){%>
							Pending
						<% }else{%>
							Non Pending
						<% } %>
					</td>									
				</tr>
			<% } %>
            </tbody>
        </table>
         <div id="tablefooter">
          <div id="tablenav">
            	<div>
                    <img src="images/table/first.gif" style="width:16px; height:16px;" alt="First Page" onclick="sorter.move(-1,true)" />
                    <img src="images/table/previous.gif" width="16" height="16" alt="First Page" onclick="sorter.move(-1)" />
                    <img src="images/table/next.gif" width="16" height="16" alt="First Page" onclick="sorter.move(1)" />
                    <img src="images/table/last.gif" width="16" height="16" alt="Last Page" onclick="sorter.move(1,true)" />
                </div>
                <div>
                	<select id="pagedropdown"></select>
				</div>
                <div>
                	<a href="javascript:sorter.showall()">view all</a>
                </div>
            </div>
			<div id="tablelocation">
            	<div>
                    <select onchange="sorter.size(this.value)">
                    <option value="7">7</option>
                        <option value="12" selected="selected">12</option>
                        <option value="12">12</option>
                        
                    </select>
                    <span>Entries Per Page</span>
                </div>
                <div class="page">Page <span id="currentpage"></span> of <span id="totalpages"></span></div>
            </div>
        </div>
    </div>
	<script type="text/javascript" src="resources/js/script.js"></script>
	<script type="text/javascript">
	var sorter = new TINY.table.sorter('sorter','table',{
		headclass:'head',
		ascclass:'asc',
		descclass:'desc',
		evenclass:'evenrow',
		oddclass:'oddrow',
		evenselclass:'evenselected',
		oddselclass:'oddselected',
		paginate:true,
		size:7,
		colddid:'columns',
		currentid:'currentpage',
		totalid:'totalpages',
		startingrecid:'startrecord',
		endingrecid:'endrecord',
		totalrecid:'totalrecords',
		hoverid:'selectedrow',
		pageddid:'pagedropdown',
		sortcolumn:1,
		sortdir:1,
		sum:[8],
		avg:[6,7,8,9],
		columns:[{index:7, format:'%', decimals:1},{index:8, format:'$', decimals:0}],
		init:true
	});
	
  </script>
</body>
</html>