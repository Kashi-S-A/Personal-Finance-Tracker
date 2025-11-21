<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Finance Tracker</title>
<link rel="stylesheet" href="/css/style.css" />
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background: #f5f7fa;
    }

    nav {
        background: #2c3e50;
        padding: 12px 20px;
        text-align: center;
    }

    nav a {
        color: #ecf0f1;
        margin: 0 12px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s ease;
    }

    nav a:hover {
        color: #1abc9c;
    }

    hr {
        border: none;
        border-top: 2px solid #ddd;
        margin: 0;
    }
</style>

</head>
<body>
	<nav>	
		<a href="/dashboard">Dashboard</a> | 
		<a href="/transactions/list">Transactions</a> |
		<a href="/transactions/add">Add Transaction</a> | 
		<a href="/budgets">Budgets</a> |
		<a href="/categories">Category</a> |
		<a href="/logout">Logout</a>
	</nav>
	<hr />
</body>
</html>
