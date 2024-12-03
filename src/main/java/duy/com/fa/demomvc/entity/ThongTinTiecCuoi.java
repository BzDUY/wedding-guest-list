package nam.com.fa.demomvc.entity;

import java.time.LocalDate;
import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;

import org.springframework.format.annotation.DateTimeFormat;

import groovyjarjarantlr4.v4.runtime.misc.NotNull;
import nam.com.fa.demomvc.annotation.NgayToChucConstraint;

@Entity
public class ThongTinTiecCuoi {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NgayToChucConstraint(message = "ngayToChuc phai lon hon ngay hien tai")
	@NotNull
	private LocalDate ngayToChuc;
	
	@Column(name = "tenCoDau", columnDefinition = "nvarchar(255)", nullable = false)
	@NotNull
	@NotBlank
	private String tenCoDau;
	
	@Column(name = "tenChuRe", columnDefinition = "nvarchar(255)", nullable = false)
	@NotNull
	@NotBlank
	private String tenChuRe;
	
	@Min(value = 1, message = "soLuongBan phai la so duong")
	@Max(value = 100, message = "soLuongBan toi da la 100")
	@NotNull
	private int soLuongBan;

	private long donGia;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "dichVuDinhKiem", referencedColumnName = "Id_DichVu")
	@NotNull
	private DichVu dichVuDinhKiem;
	@NotNull
	private long tienDatCoc;

	private long tienThanhToan;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private LocalDate ngayDatCoc = LocalDate.now();
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@NotNull
	private LocalDate ngayThanhToan = LocalDate.now().plusDays(30);
	
	@Column(name = "ghiChu", columnDefinition = "nvarchar(255)", nullable = true)
	private String ghiChu;
	
	private int trangThai;

	

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public LocalDate getNgayToChuc() {
		return ngayToChuc;
	}

	public void setNgayToChuc(LocalDate ngayToChuc) {
		this.ngayToChuc = ngayToChuc;
	}

	public String getTenCoDau() {
		return tenCoDau;
	}

	public void setTenCoDau(String tenCoDau) {
		this.tenCoDau = tenCoDau;
	}

	public String getTenChuRe() {
		return tenChuRe;
	}

	public void setTenChuRe(String tenChuRe) {
		this.tenChuRe = tenChuRe;
	}

	public int getSoLuongBan() {
		return soLuongBan;
	}

	public void setSoLuongBan(int soLuongBan) {
		this.soLuongBan = soLuongBan;
	}

	public long getDonGia() {
		return donGia;
	}

	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}

	public DichVu getDichVuDinhKiem() {
		return dichVuDinhKiem;
	}

	public void setDichVuDinhKiem(DichVu dichVuDinhKiem) {
		this.dichVuDinhKiem = dichVuDinhKiem;
	}

	public long getTienDatCoc() {
		return tienDatCoc;
	}

	public void setTienDatCoc(long tienDatCoc) {
		this.tienDatCoc = tienDatCoc;
	}

	public long getTienThanhToan() {
		return tienThanhToan;
	}

	public void setTienThanhToan(long tienThanhToan) {
		this.tienThanhToan = tienThanhToan;
	}

	public LocalDate getNgayDatCoc() {
		return ngayDatCoc;
	}

	public void setNgayDatCoc(LocalDate ngayDatCoc) {
		this.ngayDatCoc = ngayDatCoc;
	}

	public LocalDate getNgayThanhToan() {
		return ngayThanhToan;
	}

	public void setNgayThanhToan(LocalDate ngayThanhToan) {
		this.ngayThanhToan = ngayThanhToan;
	}

	public String getGhiChu() {
		return ghiChu;
	}

	public void setGhiChu(String ghiChu) {
		this.ghiChu = ghiChu;
	}

	public int getTrangThai() {
		return trangThai;
	}

	public void setTrangThai(int trangThai) {
		this.trangThai = trangThai;
	}
	
	public void calculation() {
		int donGia = 0;
		if(1<soLuongBan && soLuongBan<=15)  donGia = 2400000;
		else if(15<soLuongBan && soLuongBan<=24)  donGia = 2300000;
		else if(24<soLuongBan && soLuongBan<=40)  donGia = 2200000;
		else if(40<soLuongBan && soLuongBan<=50)  donGia = 2100000;
		setDonGia(donGia);
		setTienThanhToan(donGia * soLuongBan + dichVuDinhKiem.getDonGia()-tienDatCoc);
	}

	@Override
	public int hashCode() {
		return Objects.hash(Id, dichVuDinhKiem, donGia, ghiChu, ngayDatCoc, ngayThanhToan, ngayToChuc, soLuongBan,
				tenChuRe, tenCoDau, tienDatCoc, tienThanhToan, trangThai);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ThongTinTiecCuoi other = (ThongTinTiecCuoi) obj;
		return Id == other.Id && Objects.equals(dichVuDinhKiem, other.dichVuDinhKiem) && donGia == other.donGia
				&& Objects.equals(ghiChu, other.ghiChu) && Objects.equals(ngayDatCoc, other.ngayDatCoc)
				&& Objects.equals(ngayThanhToan, other.ngayThanhToan) && Objects.equals(ngayToChuc, other.ngayToChuc)
				&& soLuongBan == other.soLuongBan && Objects.equals(tenChuRe, other.tenChuRe)
				&& Objects.equals(tenCoDau, other.tenCoDau) && tienDatCoc == other.tienDatCoc
				&& tienThanhToan == other.tienThanhToan && trangThai == other.trangThai;
	}
}
