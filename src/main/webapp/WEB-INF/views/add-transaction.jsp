<%@ include file="fragments/header.jsp"%>

<%@page import="java.util.List"%>
<%@page import="com.ksa.pft.model.Category"%>

<%
    List<Category> categories = (List<Category>) request.getAttribute("categories");
%>

    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f5f6fa;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 450px;
            margin: 40px auto;
            background: #ffffff;
            padding: 25px 30px;
            border-radius: 10px;
            box-shadow: 0 0 12px rgba(0,0,0,0.15);
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            font-weight: bold;
            margin-top: 10px;
            color: #444;
        }

        input, select {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 18px;
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
    </style>
</head>

<body>

<div class="container">
    <h2>Add Transaction</h2>

    <form method="post" action="/transactions/add">

        <label>Amount</label><br/>
        <input type="number" step="0.01" name="amount" required />

        <label>Description</label><br/>
        <input type="text" name="description" />

        <label>Date</label><br/>
        <input type="date" name="date" />

        <label>Type</label><br/>
        <select name="type">
            <option value="EXPENSE">Expense</option>
            <option value="INCOME">Income</option>
        </select>

        <label>Category (optional)</label><br/>
        <select name="category.id">
            <option value="">-- auto categorize --</option>

            <%
                if (categories != null) {
                    for (Category c : categories) {
            %>
                <option value="<%= c.getId() %>"><%= c.getName() %></option>
            <%
                    }
                }
            %>

        </select>

        <button type="submit">Save</button>
    </form>
</div>

<%@ include file="fragments/footer.jsp"%>