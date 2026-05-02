<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>School Management System</title>
    <style>
        body { font-family: 'Inter', sans-serif; background-color: #f4f7f6; color: #333; margin: 0; padding: 20px; }
        .container { max-width: 900px; margin: auto; background: white; padding: 20px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0,0,0,0.1); }
        h1 { color: #2c3e50; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #3498db; color: white; }
        tr:hover { background-color: #f1f1f1; }
        .btn { display: inline-block; padding: 8px 15px; text-decoration: none; color: white; border-radius: 4px; font-size: 14px; }
        .btn-primary { background-color: #3498db; }
        .btn-success { background-color: #2ecc71; margin-bottom: 20px; }
        .btn-warning { background-color: #f39c12; }
        .alert { padding: 10px; margin-bottom: 15px; border-radius: 4px; }
        .alert-success { background-color: #d4edda; color: #155724; }
        .alert-danger { background-color: #f8d7da; color: #721c24; }
        ul { margin: 0; padding-left: 20px; }
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
