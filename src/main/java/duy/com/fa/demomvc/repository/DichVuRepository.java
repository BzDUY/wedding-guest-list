package nam.com.fa.demomvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import nam.com.fa.demomvc.entity.DichVu;

@Repository
public interface DichVuRepository extends JpaRepository<DichVu, Integer>{
	
}
