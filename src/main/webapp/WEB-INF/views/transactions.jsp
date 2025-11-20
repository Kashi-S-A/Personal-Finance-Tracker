<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Your Transactions</h2>
	<table>
		<tr>
			<th>Date</th>
			<th>Desc</th>
			<th>Category</th>
			<th>Type</th>
			<th>Amount</th>
			<th>Action</th>
		</tr>
		<c:forEach items="${txs}" var="t">
			<tr>
				<td>${t.date}</td>
				<td>${t.description}</td>
				<td>${t.category.name}</td>
				<td>${t.type}</td>
				<td>${t.amount}</td>
				<td><a href="/transactions/delete/${t.id}">Delete</a></td>
			</tr>
		</c:forEach>
	</table>
</div>
<%@ include file="fragments/footer.jsp"%>
```
