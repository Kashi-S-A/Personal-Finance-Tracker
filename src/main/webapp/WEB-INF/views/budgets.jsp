<%@page import="com.ksa.pft.model.Budget"%>
<%@page import="java.util.List"%>
<%@page import="com.ksa.pft.model.Category"%>
<%@ include file="fragments/header.jsp"%>

<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
    List<Budget> budgets = (List<Budget>) request.getAttribute("budgets");
%>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 40px auto;
            background: #ffffff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2, h3 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        label {
            font-weight: bold;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 15px;
            border-radius: 6px;
            border: 1px solid #bbb;
            font-size: 14px;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #2d89ef;
            border: none;
            border-radius: 6px;
            color: white;
            font-size: 16px;
            cursor: pointer;
        }

        button:hover {
            background: #1b5fb8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }

        th {
            background: #e8e8e8;
            font-weight: bold;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Budgets</h2>

    <form method="post" action="/budgets">

        <!-- Month Dropdown -->
        <label>Month</label><br />
        <select name="month" required>
            <option value="">Select Month</option>
            <option value="1">January</option>
            <option value="2">February</option>
            <option value="3">March</option>
            <option value="4">April</option>
            <option value="5">May</option>
            <option value="6">June</option>
            <option value="7">July</option>
            <option value="8">August</option>
            <option value="9">September</option>
            <option value="10">October</option>
            <option value="11">November</option>
            <option value="12">December</option>
        </select>

        <!-- Year -->
        <label>Year</label><br />
        <select name="year" required>
            <option value="">Select Year</option>
            <%
                for(int y = 2000; y <= 2100; y++) {
            %>
                <option value="<%= y %>"><%= y %></option>
            <% } %>
        </select>
		
			 <!-- Category -->
       		    <label>Category</label><br />
        		<select name="category.id">
            <%
                if(categories != null){
                    for(Category c : categories){ 
                    	
            %>
                <option value="<%= c.getId() %>"><%= c.getName() %></option>
            <%
                    }
                }
            %>
             </select> 

        <!-- Amount -->
        <label>Amount</label><br />
        <input type="number" step="0.01" name="amount" required />

        <button type="submit">Save Budget</button>
    </form>

     <h3>Existing Budgets</h3>

    <table>
        <tr>
            <th>Month</th>
            <th>Year</th>
          	<th>Category</th>
            <th>Amount</th>
        </tr>

        <%
            if(budgets != null){
                for(Budget b : budgets){
        %>
            <tr>
                <td><%= b.getMonth() %></td>
                <td><%= b.getYear() %></td>
                <td><%= b.getCategory().getName() %></td>
                <td><%= b.getAmount() %></td>
            </tr>
        <%
                }
            }
        %>
    </table>
</div>

</body>
</html>


<%@ include file="fragments/footer.jsp"%>