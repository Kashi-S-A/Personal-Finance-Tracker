<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login | Personal Finance Tracker</title>

<style>
    body {
        font-family: Arial, sans-serif;
        background: #f5f7fa;
        margin: 0;
        padding: 0;
    }

    .container {
        width: 420px;
        margin: 60px auto;
        background: #ffffff;
        padding: 25px 30px;
        border-radius: 10px;
        box-shadow: 0px 0px 12px rgba(0, 0, 0, 0.15);
    }

    h2 {
        text-align: center;
        color: #2c3e50;
        margin-bottom: 20px;
    }

    label {
        font-weight: bold;
        color: #333;
        display: block;
        margin-top: 12px;
        margin-bottom: 4px;
    }

    input[type="text"],
    input[type="password"] {
        width: 100%;
        padding: 10px;
        border-radius: 6px;
        border: 1px solid #ccc;
        outline: none;
        font-size: 14px;
        margin-bottom: 10px;
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

    p {
        text-align: center;
        margin-top: 15px;
        font-size: 14px;
        color: #333;
    }

    p a {
        color: #1abc9c;
        font-weight: bold;
        text-decoration: none;
    }

    p a:hover {
        text-decoration: underline;
    }
</style>

</head>
<body>

<div class="container">
	<h2>Login</h2>
<h4 style="color: red;">${error}</h4>
	<form method="post" action="/do-login">
		<label>Email</label>
		<input type="text" name="username" />

		<label>Password</label>
		<input type="password" name="password" />

		<button type="submit">Login</button>
	</form>

	<p>
		Don't have an account? <a href="/register">Register</a>
	</p>
</div>

</body>
</html>
