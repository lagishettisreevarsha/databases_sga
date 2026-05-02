<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Course</title>
    <style>
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: #FDFBF7; padding: 60px 20px; color: #4A4A4A; }
        .container { max-width: 500px; margin: auto; background: #FFFFFF; padding: 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.03); border: 1px solid #F0EAE1; }
        h2 { text-align: center; color: #2C2C2C; font-weight: 600; margin-bottom: 30px; letter-spacing: -0.5px; }
        .form-group { margin-bottom: 20px; }
        label { display: block; margin-bottom: 8px; color: #6B6B6B; font-size: 14px; font-weight: 500; }
        input[type="text"], textarea { width: 100%; padding: 12px 15px; border: 1px solid #E2D9CE; border-radius: 6px; box-sizing: border-box; font-size: 15px; background-color: #FDFBF7; transition: border-color 0.2s ease; }
        input[type="text"]:focus, textarea:focus { outline: none; border-color: #CBBCAE; background-color: #FFFFFF; }
        .btn-submit { width: 100%; padding: 14px; background-color: #FAF8F5; color: #2C2C2C; border: 1px solid #E2D9CE; border-radius: 6px; font-size: 15px; font-weight: 500; cursor: pointer; transition: all 0.2s ease; margin-top: 10px; }
        .btn-submit:hover { background-color: #F0EAE1; border-color: #CBBCAE; transform: translateY(-1px); box-shadow: 0 6px 10px rgba(0,0,0,0.05); }
        .alert-danger { padding: 15px; background-color: #FDF2F2; color: #B91C1C; border: 1px solid #F9DADA; border-radius: 8px; margin-bottom: 25px; font-size: 14px; }
        .back-link { display: block; text-align: center; margin-top: 25px; text-decoration: none; color: #8A735E; font-size: 14px; transition: color 0.2s ease; }
        .back-link:hover { color: #2C2C2C; }
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
