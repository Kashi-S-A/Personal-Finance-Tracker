<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Budgets</h2>
	<form method="post" action="/budgets">
		<label>Month</label><br /> <input type="number" name="month" min="1"
			max="12" required /><br /> <label>Year</label><br /> <input
			type="number" name="year" required /><br /> <label>Category</label><br />
		<select name="category.id">
			<c:forEach items="${categories}" var="c">
				<option value="${c.id}">${c.name}</option>
			</c:forEach>
		</select><br /> <label>Amount</label><br /> <input type="number" step="0.01"
			name="amount" required /><br />
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
		<c:forEach items="${budgets}" var="b">
			<tr>
				<td>${b.month}</td>
				<td>${b.year}</td>
				<td>${b.category.name}</td>
				<td>${b.amount}</td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="fragments/footer.jsp"%>