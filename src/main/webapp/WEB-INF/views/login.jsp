<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Login</h2>
	<form method="post" action="/do-login">
		<label>Email</label><br /> <input type="text" name="username" /><br />
		<label>Password</label><br /> <input type="password" name="password" /><br />
		<button type="submit">Login</button>
	</form>
	<p>
		Don't have an account? <a href="/register">Register</a>
	</p>
</div>
<%@ include file="fragments/footer.jsp"%>