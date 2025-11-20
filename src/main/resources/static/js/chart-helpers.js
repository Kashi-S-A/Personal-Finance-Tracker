function createPie(id, labels, values) {
	const ctx = document.getElementById(id).getContext('2d');
	new Chart(ctx, {
		type: 'pie',
		data: {
			labels: labels,
			datasets: [{
				data: values,
			}]
		}
	});
}


function createBar(id, labels, values) {
	const ctx = document.getElementById(id).getContext('2d');
	new Chart(ctx, {
		type: 'bar',
		data: {
			labels: labels,
			datasets: [{
				label: 'Amount',
				data: values
			}]
		}
	});
}


function createLine(id, labels, values) {
	const ctx = document.getElementById(id).getContext('2d');
	new Chart(ctx, {
		type: 'line',
		data: {
			labels: labels,
			datasets: [{
				label: 'Daily Expense',
				data: values,
				fill: false
			}]
		}
	});
}