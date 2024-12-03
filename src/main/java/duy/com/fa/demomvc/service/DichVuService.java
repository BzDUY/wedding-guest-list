package nam.com.fa.demomvc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import nam.com.fa.demomvc.repository.DichVuRepository;
import nam.com.fa.demomvc.entity.DichVu;
@Service
public class DichVuService {
	
	@Autowired
	private DichVuRepository dichVuRepository;
	
	public List<DichVu> findAll(){
		return dichVuRepository.findAll();
	}
	
	public DichVu findById(int id) {
		return dichVuRepository.findById(id).get();
	}
}
