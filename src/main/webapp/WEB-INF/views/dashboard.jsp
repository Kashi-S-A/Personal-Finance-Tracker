<%@ include file="fragments/header.jsp"%>
<div class="container">
	<h2>Welcome, ${name}!</h2>


	<div style="width: 45%; display: inline-block; vertical-align: top;">
		<h3>Category-wise Spending (This Month)</h3>
		<canvas id="categoryChart"></canvas>
	</div>


	<div style="width: 45%; display: inline-block; vertical-align: top;">
		<h3>Income vs Expense (This Month)</h3>
		<canvas id="incExpChart"></canvas>
	</div>


	<div style="width: 90%; margin-top: 30px;">
		<h3>Daily Expense (This Month)</h3>
		<canvas id="monthlyChart"></canvas>
	</div>
</div>
<script src="/static/js/chart-helpers.js"></script>
<script>
// category chart
fetch('/api/chart/category-wise')
.then(res => res.json())
.then(data => {
const labels = Object.keys(data);
const values = Object.values(data);
createPie('categoryChart', labels, values);
});


fetch('/api/chart/income-vs-expense')
.then(res => res.json())
.then(data => {
const labels = Object.keys(data);
const values = Object.values(data);
createBar('incExpChart', labels, values);
});


fetch('/api/chart/monthly')
.then(res => res.json())
.then(data => {
const labels = Object.keys(data);
const values = Object.values(data);
createLine('monthlyChart', labels, values);
});
</script>
<%@ include file="fragments/footer.jsp"%>