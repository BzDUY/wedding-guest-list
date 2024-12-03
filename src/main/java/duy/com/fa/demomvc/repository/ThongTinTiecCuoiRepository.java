package nam.com.fa.demomvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nam.com.fa.demomvc.entity.ThongTinTiecCuoi;
import nam.com.fa.demomvc.entity.ThongTinTiecCuoi;
@Repository
public interface ThongTinTiecCuoiRepository extends JpaRepository<ThongTinTiecCuoi, Integer>{
	public List<ThongTinTiecCuoi> findAllByTenCoDauContainingIgnoreCase(String key);
	public List<ThongTinTiecCuoi> findAllByTenChuReContainingIgnoreCase(String key);
}
