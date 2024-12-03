<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
	href="<c:url value='/resources/bootstrap/css/bootstrap.min.css' />"
	rel="stylesheet">
<script src="<c:url value='/resources/js/jquery-3.6.4.min.js' />"></script>
<script src="<c:url value='/resources/js/bootstrap.min.js' />"></script>
<link href="<c:url value='/resources/bootstrap/css/styles.css' />"
	rel="stylesheet">
<title>Thêm Xe</title>
</head>
<body>
	<!-- Nút Trang Chủ -->
	<a href="${pageContext.request.contextPath}/thongTinTiecCuoi/list"
		class="btn btn-secondary btn-home">Trang List</a>
	<div class="form-container">
		<h2>Thêm Xe</h2>
		<form:form
			action="${pageContext.request.contextPath}/thongTinTiecCuoi/save"
			method="post" modelAttribute="form">
			<form:hidden path="Id" />
			<!-- Hãng Sản Xuất -->
			<div class="mb-3">
				<label for="ngayToChuc" class="form-label">NgayToChuc</label>
				<form:input path="ngayToChuc" type="date" cssClass="form-control"
					id="ngayToChuc" placeholder="Nhập ngayToChuc" />
				<form:errors path="ngayToChuc" cssClass="form-text text-danger" />
			</div>
			<!-- Biển Số -->
			<div class="form-group">
				<label for="tenCoDau" class="form-label">TenCoDau</label>
				<form:input path="tenCoDau" cssClass="form-control" id="tenCoDau"
					placeholder="Nhập tenCoDau" />
				<form:errors path="tenCoDau" cssClass="form-text text-danger" />
			</div>
			<!-- Loại Xe -->
			<div class="form-group">
				<label for="tenChuRe" class="form-label">TenChuRe</label>
				<form:input path="tenChuRe" cssClass="form-control" id="tenChuRe"
					placeholder="Nhập tenChuRe" />
				<form:errors path="tenChuRe" cssClass="form-text text-danger" />
			</div>
			<div class="mb-3">
				<label for="soLuongBan" class="form-label">SoLuongBan</label>
				<form:input path="soLuongBan" type="number" cssClass="form-control"
					id="soLuongBan" placeholder="Nhập soLuongBan" />
				<form:errors path="soLuongBan" cssClass="form-text text-danger" />
			</div>
			<!-- Nhà Xe -->
			<div class="mb-3">
				<label for="tienDatCoc" class="form-label">TienDatCoc</label>
				<form:input path="tienDatCoc" type="number" cssClass="form-control"
					id="tienDatCoc" placeholder="Nhập tienDatCoc" />
				<form:errors path="tienDatCoc" cssClass="form-text text-danger" />
			</div>
			<div class="mb-3">
				<label for="dichVuDinhKiem.Id_DichVu" class="form-label">DichVuDiKem</label>
				<form:select path="dichVuDinhKiem.Id_DichVu" cssClass="form-select"
					id="dichVuDinhKiem.Id_DichVu" items="${dichVuDiKem}"
					itemValue="Id_DichVu" itemLabel="tenDichVu">
				</form:select>

				<form:errors path="dichVuDinhKiem.Id_DichVu"
					cssClass="form-text text-danger" />
			</div>
			<div class="form-group">
				<label for="ghiChu" class="form-label">GhiChu</label>
				<form:input path="ghiChu" cssClass="form-control" id="ghiChu"
					placeholder="Nhập ghiChu" />
				<form:errors path="ghiChu" cssClass="form-text text-danger" />
			</div>
			<!-- Submit -->
			<div class="d-grid mb-3">
				<button type="submit" class="btn btn-primary">Lưu</button>
			</div>
			<!-- Quay Lại -->
			<div class="text-center">
				<a href="${pageContext.request.contextPath}/xe/list"
					class="text-decoration-none">Quay Lại Danh Sách Xe</a>
			</div>
		</form:form>
	</div>
	<script>
		document
				.addEventListener(
						"DOMContentLoaded",
						function() {
							const soLuongBanInput = document
									.getElementById("soLuongBan");
							const tienDatCocInput = document
									.getElementById("tienDatCoc");
							const NgayToChucInput = document
									.getElementById("NgayToChuc");

							// Hàm validate Biển Số
							bienSoInput
									.addEventListener(
											"blur",
											function() {
												var toiDa = 100;
												let soLuongBanError = document
														.querySelector('#soLuongBan + .form-text');

												if (!soLuongBanError) {
													bienSoError = document
															.createElement('span');
													bienSoError.classList.add(
															'form-text',
															'text-danger');
													bienSoInput.parentNode
															.appendChild(soLuongBanError);
												}

												if (!soLuongBanInput.value > 100) {
													bienSoError.textContent = "So Lluong ban toi da la 100!";
												} else {
													bienSoError.textContent = "";
												}
											});

							// Hàm validate Hạn Kiểm Định
							hanKiemDinhInput
									.addEventListener(
											"blur",
											function() {
												const hanKiemDinhDate = new Date(
														hanKiemDinhInput.value);
												const currentDate = new Date();
												currentDate
														.setMonth(currentDate
																.getMonth() + 1); // Hạn kiểm định phải lớn hơn 1 tháng
												let hanKiemDinhError = document
														.querySelector('#hanKiemDinh + .form-text');

												if (!hanKiemDinhError) {
													hanKiemDinhError = document
															.createElement('span');
													hanKiemDinhError.classList
															.add('form-text',
																	'text-danger');
													hanKiemDinhInput.parentNode
															.appendChild(hanKiemDinhError);
												}

												if (hanKiemDinhDate <= currentDate) {
													hanKiemDinhError.textContent = "Hạn kiểm định phải lớn hơn 1 tháng!";
												} else {
													hanKiemDinhError.textContent = "";
												}
											});
						});
	</script>


</body>
</html>
