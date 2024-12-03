<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.6.4.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<link href="<c:url value='/resources/bootstrap/css/styles.css' />"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Danh Sách Tiec Cuoi</title>
</head>
<body class="bg-light">

	<!-- Thanh điều hướng -->
	<div class="container mt-3">
		<a href="${pageContext.request.contextPath}/thongTinTiecCuoi/add"
			class="btn btn-secondary btn-home mb-3">Trang add</a>

		<!-- Container chính -->
		<h1 class="text-center page-title mb-4">Danh Sách Tiec Cuoi</h1>

		<!-- Nút Thêm Mới -->
		<form
			action="${pageContext.request.contextPath}/thongTinTiecCuoi/search"
			method="get" class="d-flex">
			<input type="text" class="form-control" placeholder="Tìm kiếm..."
				name="key" value="${key}" />
			<button type="submit" class="btn btn-custom ml-2">Tìm Kiếm</button>
		</form>

		<!-- Bảng danh sách xe -->
		<div class="table-container bg-white p-4 shadow-sm rounded">
			<table class="table table-hover table-striped table-bordered">
				<thead class="thead-dark">
					<tr>
						<th>ngayToChuc</th>
						<th>tenCoDau</th>
						<th>tenChuRe</th>
						<th>soLuongBan</th>
						<th>dichVuDinhKiem</th>
						<th>donGia</th>
						<th>tienDatCoc</th>
						<th>ngayDatCoc</th>
						<th>ngayThanhToan</th>
						<th>ghiChu</th>
						<th>trangThai</th>
						<th class="text-center">Xóa</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="x" items="${list}">
						<tr>
							<td>${x.ngayToChuc}</td>
							<td>${x.tenCoDau}</td>
							<td>${x.tenChuRe}</td>
							<td>${x.soLuongBan}</td>
							<td>${x.dichVuDinhKiem.tenDichVu}</td>
							<td>${x.dichVuDinhKiem.donGia}</td>
							<td>${x.tienDatCoc}</td>
							<td>${x.ngayDatCoc}</td>
							<td>${x.ngayThanhToan}</td>
							<td>${x.ghiChu}</td>
							<c:if test="${x.trangThai == 0}">
								<td>Chua Dat Coc</td>
							</c:if>
							<c:if test="${x.trangThai == 1}">
								<td>Da Dat Coc</td>
							</c:if>
							<c:if test="${x.trangThai == 2}">
								<td>Da Thanh Toan Tien</td>
							</c:if>
							<c:if test="${x.trangThai == 3}">
								<td>Huy Tiec Cuoi</td>
							</c:if>


							
							<td class="text-center">
								<button class="btn btn-danger btn-sm"
									onclick="handleAction('${x.id}', 'delete')">Xóa</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<script>
		function handleAction(id, action) {
			if (action === 'delete') {
				if (confirm("Bạn có chắc chắn muốn xóa thong tin tiec cuoi nay này?")) {
					window.location.href = "${pageContext.request.contextPath}/thongTinTiecCuoi/delete/"
							+ id;
				}
			} else if (action === 'edit') {
				window.location.href = "${pageContext.request.contextPath}/thongTinTiecCuoi/edit/"
						+ id;
			}
		}
	</script>

</body>
</html>
