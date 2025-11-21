<%@ include file="fragments/header.jsp"%>

<%
    // Retrieve categories passed from controller
    java.util.List<com.ksa.pft.model.Category> categoryList =
            (java.util.List<com.ksa.pft.model.Category>) request.getAttribute("categories");
%>

<div class="container">
    <h2>Add Category</h2>

    <form method="post" action="/categories">
        <label>Category Name:</label>
        <input type="text" name="name" required />

        <label>Type:</label>
        <select name="type">
            <option value="EXPENSE">Expense</option>
            <option value="INCOME">Income</option>
        </select>

        <button type="submit">Save</button>
    </form>

    <h3>All Categories</h3>
    <table border="1">
        <tr>
            <th>Name</th>
            <th>Type</th>
        </tr>

        <% 
            if (categoryList != null && !categoryList.isEmpty()) {
                for (com.ksa.pft.model.Category c : categoryList) {
        %>
                    <tr>
                        <td><%= c.getName() %></td>
                        <td><%= c.getType() %></td>
                    </tr>
        <%
                }
            } else {
        %>
                <tr>
                    <td colspan="2">No categories found.</td>
                </tr>
        <%
            }
        %>

    </table>
</div>

<%@ include file="fragments/footer.jsp"%>
