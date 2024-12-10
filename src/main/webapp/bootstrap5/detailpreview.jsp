<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Chi tiết đơn hàng</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <h1>Chi tiết đơn hàng</h1>
    <table border="1" cellpadding="10" style="width: 100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Tên sách</th>
                <th>Số lượng</th>
                <th>Tổng tiền (VND)</th>
            </tr>
        </thead>
        <tbody>
            <!-- Duyệt qua danh sách chi tiết đơn hàng -->
            <c:forEach var="orderDetail" items="${list}">
                <tr>
                    <td>${orderDetail.title}</td>
                    <td>${orderDetail.quantity}</td>
                    <td>${orderDetail.total}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <br/>
    <a href="javascript:history.back()">Quay lại</a>
</body>
</html>