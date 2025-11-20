<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Register</h2>
	<form method="post" action="/register">
		<label>Name</label><br /> <input type="text" name="name"
			value="${user.name}" required /><br /> <label>Email</label><br /> <input
			type="email" name="email" value="${user.email}" required /><br /> <label>Password</label><br />
		<input type="password" name="password" required /><br />
		<button type="submit">Register</button>
	</form>
	<c:if test="${not empty error}">
		<div class="error">${error}</div>
	</c:if>
</div>
<%@ include file="fragments/footer.jsp"%><%@ include
	file="fragments/header.jsp"%>
<div class="container">
	<h2>Register</h2>
	<form method="post" action="/register">
		<label>Name</label><br /> <input type="text" name="name"
			value="${user.name}" required /><br /> <label>Email</label><br /> <input
			type="email" name="email" value="${user.email}" required /><br /> <label>Password</label><br />
		<input type="password" name="password" required /><br />
		<button type="submit">Register</button>
	</form>
	<c:if test="${not empty error}">
		<div class="error">${error}</div>
	</c:if>
</div>
<%@ include file="fragments/footer.jsp"%>