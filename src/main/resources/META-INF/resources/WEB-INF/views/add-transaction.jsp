<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Add Transaction</h2>
	<form method="post" action="/transactions/add">
		<label>Amount</label><br /> <input type="number" step="0.01"
			name="amount" required /><br /> <label>Description</label><br /> <input
			type="text" name="description" /><br /> <label>Date</label><br /> <input
			type="date" name="date" /><br /> <label>Type</label><br /> <select
			name="type">
			<option value="EXPENSE">Expense</option>
			<option value="INCOME">Income</option>
		</select><br /> <label>Category (optional)</label><br /> <select
			name="category.id">
			<option value="">-- auto categorize --</option>
			<c:forEach items="${categories}" var="c">
				<option value="${c.id}">${c.name}</option>
			</c:forEach>
		</select><br />
		<button type="submit">Save</button>
	</form>
</div>
<%@ include file="fragments/footer.jsp"%>