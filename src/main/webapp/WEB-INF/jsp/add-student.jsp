<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f6; padding: 40px; }
        .container { max-width: 500px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #666; }
        input[type="text"], input[type="email"] { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 10px; background-color: #2ecc71; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        .btn-submit:hover { background-color: #27ae60; }
        .alert-danger { padding: 10px; background-color: #f8d7da; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
        .back-link { display: block; text-align: center; margin-top: 15px; text-decoration: none; color: #3498db; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add New Student</h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/save-student" method="post">
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <button type="submit" class="btn-submit">Save</button>
    </form>
    <a href="/" class="back-link">Back to List</a>
</div>
</body>
</html>
