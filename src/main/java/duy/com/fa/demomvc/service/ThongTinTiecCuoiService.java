package nam.com.fa.demomvc.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nam.com.fa.demomvc.entity.ThongTinTiecCuoi;
import nam.com.fa.demomvc.repository.ThongTinTiecCuoiRepository;

@Service
public class ThongTinTiecCuoiService {

	@Autowired
	private ThongTinTiecCuoiRepository thongTinTiecCuoiRepository;

	public List<ThongTinTiecCuoi> findAll() {
		return thongTinTiecCuoiRepository.findAll();
	}

	public List<ThongTinTiecCuoi> search(String key) {
	    // Sử dụng Set để loại bỏ dữ liệu trùng lặp
	    Set<ThongTinTiecCuoi> resultSet = new HashSet<>();
	    
	    // Thêm dữ liệu từ phương thức tìm kiếm đầu tiên
	    resultSet.addAll(thongTinTiecCuoiRepository.findAllByTenCoDauContainingIgnoreCase(key));
	    
	    // Thêm dữ liệu từ phương thức tìm kiếm thứ hai
	    resultSet.addAll(thongTinTiecCuoiRepository.findAllByTenChuReContainingIgnoreCase(key));
	    
	    // Chuyển Set về List để trả về
	    return new ArrayList<>(resultSet);
	}


	public void delete(int id) {
		thongTinTiecCuoiRepository.deleteById(id);
	}

	public ThongTinTiecCuoi save(ThongTinTiecCuoi form) {
		return thongTinTiecCuoiRepository.save(form);
	}
}
