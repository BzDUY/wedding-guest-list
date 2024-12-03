package nam.com.fa.demomvc.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class DichVu {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id_DichVu;
	@Column(name = "tenDichVu", columnDefinition = "nvarchar(255)", nullable = false)
	private String tenDichVu;
	
	private long donGia;

	public int getId_DichVu() {
		return Id_DichVu;
	}

	public void setId_DichVu(int id_DichVu) {
		Id_DichVu = id_DichVu;
	}

	public String getTenDichVu() {
		return tenDichVu;
	}

	public void setTenDichVu(String tenDichVu) {
		this.tenDichVu = tenDichVu;
	}

	public long getDonGia() {
		return donGia;
	}

	public void setDonGia(long donGia) {
		this.donGia = donGia;
	}

	
}
