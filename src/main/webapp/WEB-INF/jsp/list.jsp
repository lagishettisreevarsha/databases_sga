<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>School Management System</title>
    <style>
        body { font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif; background-color: #FDFBF7; color: #4A4A4A; margin: 0; padding: 40px 20px; }
        .container { max-width: 1000px; margin: auto; background: #FFFFFF; padding: 30px 40px; border-radius: 12px; box-shadow: 0 10px 30px rgba(0,0,0,0.03); border: 1px solid #F0EAE1; }
        h1 { color: #2C2C2C; text-align: center; font-weight: 600; margin-bottom: 30px; letter-spacing: -0.5px; }
        table { width: 100%; border-collapse: collapse; margin-top: 25px; font-size: 15px; }
        th, td { padding: 16px 20px; text-align: left; border-bottom: 1px solid #F0EAE1; }
        th { background-color: #FAF8F5; color: #6B6B6B; font-weight: 500; text-transform: uppercase; font-size: 13px; letter-spacing: 0.5px; }
        tr:hover { background-color: #FDFBF7; transition: background-color 0.2s ease; }
        .btn { display: inline-block; padding: 10px 20px; text-decoration: none; border-radius: 6px; font-size: 14px; font-weight: 500; transition: all 0.2s ease; border: 1px solid transparent; }
        .btn-success { background-color: #2C2C2C; color: #FFFFFF; margin-bottom: 20px; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .btn-success:hover { background-color: #000000; transform: translateY(-1px); box-shadow: 0 6px 10px rgba(0,0,0,0.1); }
        .btn-primary { background-color: #FAF8F5; color: #2C2C2C; border-color: #E2D9CE; margin-left: 8px; }
        .btn-primary:hover { background-color: #F0EAE1; }
        .btn-warning { background-color: transparent; color: #8A735E; border-color: #E2D9CE; }
        .btn-warning:hover { background-color: #FAF8F5; color: #5D4A3D; border-color: #CBBCAE; }
        .alert { padding: 15px 20px; margin-bottom: 20px; border-radius: 8px; font-size: 14px; }
        .alert-success { background-color: #F0F7F4; color: #2D6A4F; border: 1px solid #D8EBD8; }
        .alert-danger { background-color: #FDF2F2; color: #B91C1C; border: 1px solid #F9DADA; }
        ul { margin: 0; padding-left: 20px; color: #6B6B6B; }
        li { padding: 3px 0; }
    </style>
</head>
<body>
<div class="container">
    <h1>Student & Course List</h1>
    
    <c:if test="${not empty successMessage}">
        <div class="alert alert-success">${successMessage}</div>
    </c:if>
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger">${errorMessage}</div>
    </c:if>

    <a href="/add-student" class="btn btn-success">Add New Student</a>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Student Name</th>
                <th>Email</th>
                <th>Enrolled Courses</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="student" items="${students}">
                <tr>
                    <td>${student.id}</td>
                    <td>${student.name}</td>
                    <td>${student.email}</td>
                    <td>
                        <c:choose>
                            <c:when test="${empty student.courses}">
                                <em>No courses</em>
                            </c:when>
                            <c:otherwise>
                                <ul>
                                <c:forEach var="course" items="${student.courses}">
                                    <li>${course.title}</li>
                                </c:forEach>
                                </ul>
                            </c:otherwise>
                        </c:choose>
                    </td>
                    <td>
                        <a href="/edit-student/${student.id}" class="btn btn-warning">Edit</a>
                        <a href="/add-course/${student.id}" class="btn btn-primary">Add Course</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
