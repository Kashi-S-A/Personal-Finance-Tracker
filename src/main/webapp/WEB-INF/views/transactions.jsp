<%@ include file="fragments/header.jsp"%>

<%
    // Retrieve the list of transactions sent by controller
    java.util.List<com.ksa.pft.model.Transaction> txs =
        (java.util.List<com.ksa.pft.model.Transaction>) request.getAttribute("txs");
%>

<div class="container">
    <h2>Your Transactions</h2>

    <table border="1" cellpadding="5">
        <tr>
            <th>Date</th>
            <th>Desc</th>
            <th>Category</th>
            <th>Type</th>
            <th>Amount</th>
            <th>Action</th>
        </tr>

        <%
            if (txs != null && !txs.isEmpty()) {

                for (com.ksa.pft.model.Transaction t : txs) {
        %>
                    <tr>
                        <td><%= t.getDate() %></td>
                        <td><%= t.getDescription() %></td>

                        <td>
                            <%= (t.getCategory() != null) 
                                    ? t.getCategory().getName() 
                                    : "N/A" %>
                        </td>

                        <td><%= t.getType() %></td>
                        <td><%= t.getAmount() %></td>

                        <td>
                            <a href="/transactions/delete/<%= t.getId() %>">Delete</a>
                        </td>
                    </tr>
        <%
                }

            } else { 
        %>

            <tr>
                <td colspan="6">No transactions found.</td>
            </tr>

        <%
            }
        %>

    </table>
</div>

<%@ include file="fragments/footer.jsp"%>
