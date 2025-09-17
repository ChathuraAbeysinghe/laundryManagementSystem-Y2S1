<%@ page import="java.sql.*, Delivery.DBconnect" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Show success message if update was successful
    String success = request.getParameter("success");
    if ("true".equals(success)) {
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Successful</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .message-container {
            max-width: 500px;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            text-align: center;
        }
        .success {
            color: #3c763d;
            background-color: #dff0d8;
            padding: 15px;
            border-radius: 4px;
            margin-bottom: 20px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #337ab7;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            margin-top: 15px;
        }
        .btn:hover {
            background-color: #286090;
        }
    </style>
</head>
<body>
    <div class="message-container">
        <div class="success">Staff information updated successfully!</div>
        <a href="staff_dashboard.jsp" class="btn">Back to Dashboard</a>
    </div>
</body>

<%
        return;
    }

    // Validate ID parameter
    String idParam = request.getParameter("id");
    if (idParam == null || idParam.isEmpty()) {
%>
    <div class="error">Error: ID parameter is missing.</div>
<%
        return;
    }

    int id = 0;
    try {
        id = Integer.parseInt(idParam);
    } catch (NumberFormatException e) {
%>
    <div class="error">Error: Invalid ID format.</div>
<%
        return;
    }

    // Fetch staff data from database
    Connection conn = DBconnect.getConnection();
    PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE id = ?");
    stmt.setInt(1, id);
    ResultSet rs = stmt.executeQuery();

    if (rs.next()) {
        String username = rs.getString("username");
        String email = rs.getString("email");
        String phone = rs.getString("phone");
%>

<head>
    <title>Edit Staff</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 20px;
        }
        .form-container {
            max-width: 500px;
            margin: 30px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        h2 {
            color: #333;
            text-align: center;
            margin-bottom: 25px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 16px;
        }
        .btn-container {
            display: flex;
            gap: 10px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            flex-grow: 1;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .btn-back {
            display: inline-block;
            background-color: #337ab7;
            color: white;
            padding: 12px 20px;
            text-align: center;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            flex-grow: 1;
        }
        .btn-back:hover {
            background-color: #286090;
        }
        .error {
            color: #d9534f;
            background-color: #f2dede;
            padding: 10px;
            border-radius: 4px;
            margin: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Edit Staff Information</h2>
        <form action="UpdateStaffServlet" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" name="username" value="<%= username %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" name="email" value="<%= email %>" required>
            </div>
            
            <div class="form-group">
                <label for="phone">Phone:</label>
                <input type="text" name="phone" value="<%= phone %>" required>
            </div>
            
            <div class="btn-container">
                <input type="submit" value="Update Staff">
                <a href="staffDashboard" class="btn-back">Back</a>
            </div>
        </form>
    </div>
</body>
</html>

<%
    } else {
%>
    <div class="error">Error: Staff not found.</div>
<%
    }
%>
