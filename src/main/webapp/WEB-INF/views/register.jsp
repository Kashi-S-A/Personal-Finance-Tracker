<!DOCTYPE div PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 420px;
        margin: 40px auto;
        background: #ffffff;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 10px;
    }

    label {
        font-weight: bold;
        color: #333;
        display: block;
        margin-top: 12px;
        margin-bottom: 4px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 14px;
        margin-bottom: 8px;
        transition: 0.2s;
    }

    input:focus {
        border-color: #1abc9c;
        box-shadow: 0 0 4px rgba(26, 188, 156, 0.5);
    }

    button {
        width: 100%;
        padding: 12px;
        margin-top: 20px;
        background: #1abc9c;
        color: white;
        border: none;
        border-radius: 6px;
        font-size: 16px;
        cursor: pointer;
        transition: 0.3s ease;
    }

    button:hover {
        background: #16a085;
    }

    .error {
        text-align: center;
        color: red;
        font-size: 14px;
        margin-bottom: 10px;
    }
</style>

</head>
<body>
<div class="container">
	<h2>Register</h2>
		<h4 class="error" style="color: red">${error}</h4>
	<form method="post" action="/register">
		<label>Name</label><br /> <input type="text" name="name"
			value="${user.name}" required /><br /> <label>Email</label><br />
		<input type="email" name="email" value="${user.email}" required /><br />
		<label>Password</label><br /> <input type="password" name="password"
			required /><br />
		<button type="submit">Register</button>
	</form>
	
	<a href="login">Login Here!</a>

</div>
<%@ include file="fragments/footer.jsp"%>
</body>
</html>

