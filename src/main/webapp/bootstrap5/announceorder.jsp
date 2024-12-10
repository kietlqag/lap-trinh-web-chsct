<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Đặt Hàng Thành Công</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .success-container {
            text-align: center;
            padding: 50px;
            margin: 50px auto;
            background-color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            border-radius: 10px;
            max-width: 600px;
        }

        .success-container img {
            width: 100px;
            margin-bottom: 20px;
        }

        h1 {
            color: #28a745;
            margin-bottom: 20px;
        }

        ul {
            list-style: none;
            padding: 0;
            text-align: left;
        }

        ul li {
            margin: 10px 0;
            font-size: 16px;
        }

        ul li span {
            font-weight: bold;
        }

        .note {
            color: #555;
            font-size: 14px;
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="success-container">
        <img src="success-icon.png" alt="Success">
        <h1>ĐẶT HÀNG THÀNH CÔNG!</h1>
        <ul>
            <li><span>Mã đơn hàng:</span> ${order.id}</li>
            <li><span>Khách hàng:</span> ${order.namecustomer}</li>
            <li><span>Email:</span> ${order.email}</li>
            <li><span>Địa chỉ:</span> ${order.address}</li>
            <li><span>Phương thức thanh toán:</span> ${order.methodpay}</li>
            <li><span>Ngày đặt hàng:</span> ${order.date}</li>
            <li><span>Trạng thái thanh toán:</span> ${order.paymentStatus}</li>
            <li><span>Tổng tiền:</span> ${order.total}đ</li>
        </ul>
        <div class="note">
            Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ gửi thông tin chi tiết qua email để bạn có thể theo dõi.
        </div>
        <a href="${pageContext.request.contextPath}/User/Home" class="btn">Quay lại trang chủ</a>
    </div>
</body>
</html>
