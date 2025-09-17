<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
  <title>Error</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-red-50 flex justify-center items-center min-h-screen">
  <div class="bg-white p-8 rounded-lg shadow text-center max-w-md">
    <h2 class="text-2xl text-red-600 font-bold mb-4">Something went wrong!</h2>
    <p class="text-gray-700 mb-4">${errorMessage}</p>
    <a href="PlaceOrder.jsp" class="bg-red-500 text-white px-4 py-2 rounded hover:bg-red-600">Go Back</a>
  </div>
</body>
</html>
