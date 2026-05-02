<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f6; padding: 40px; }
        .container { max-width: 500px; margin: auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h2 { text-align: center; color: #333; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; color: #666; }
        input[type="text"], textarea { width: 100%; padding: 10px; border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btn-submit { width: 100%; padding: 10px; background-color: #3498db; color: white; border: none; border-radius: 4px; font-size: 16px; cursor: pointer; }
        .btn-submit:hover { background-color: #2980b9; }
        .alert-danger { padding: 10px; background-color: #f8d7da; color: #721c24; border-radius: 4px; margin-bottom: 15px; }
        .back-link { display: block; text-align: center; margin-top: 15px; text-decoration: none; color: #3498db; }
    </style>
</head>
<body>
<div class="container">
    <h2>Add Course for Student</h2>

    <c:if test="${not empty errorMessage}">
        <div class="alert-danger">${errorMessage}</div>
    </c:if>

    <form action="/save-course/${studentId}" method="post">
        <div class="form-group">
            <label for="title">Course Title:</label>
            <input type="text" id="title" name="title" required>
        </div>
        <div class="form-group">
            <label for="description">Description:</label>
            <textarea id="description" name="description" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn-submit">Save Course</button>
    </form>
    <a href="/" class="back-link">Back to List</a>
</div>
</body>
</html>
