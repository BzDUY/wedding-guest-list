package nam.com.fa.demomvc.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import nam.com.fa.demomvc.entity.ThongTinTiecCuoi;
import nam.com.fa.demomvc.service.DichVuService;
import nam.com.fa.demomvc.service.ThongTinTiecCuoiService;
import nam.com.fa.demomvc.entity.DichVu;
@Controller
@RequestMapping("/thongTinTiecCuoi")
public class ThongTinTiecCuoiController {

	@Autowired
	private ThongTinTiecCuoiService thongTinTiecCuoiService;
	
	@Autowired
	private DichVuService dichVuService;
	
	@GetMapping("/list")
	public String findAll(Model model) {
		model.addAttribute("list", thongTinTiecCuoiService.findAll());
		return "thongTinTiecCuoi/list";
	}
	@GetMapping("/delete/{id}")
	public String findAll(@PathVariable("id") int id, Model model) {
		thongTinTiecCuoiService.delete(id);
		model.addAttribute("list", thongTinTiecCuoiService.findAll());
		return "thongTinTiecCuoi/list";
	}
	@GetMapping("/add")
	public String add(Model model) {
		model.addAttribute("form", new ThongTinTiecCuoi());
		return "thongTinTiecCuoi/create";
	}
	@GetMapping("/search")
	public String search(@RequestParam("key") String key,Model model) {
		model.addAttribute("list", thongTinTiecCuoiService.search(key));
		model.addAttribute("key", key);
		return "thongTinTiecCuoi/list";
	}
	@PostMapping("/save")
	public String save(@ModelAttribute(name = "form") @Valid ThongTinTiecCuoi form, BindingResult result, Model model) {
		if (!isValidTienDatCoc(form)) {
			result.addError(new FieldError("form", "tienDatCoc",
					"tienDatCoc phai lon hon 10% tong tien"));
		}
		if (result.hasErrors()) {
			return "/thongTinTiecCuoi/create";
		}
		form.setDichVuDinhKiem(dichVuService.findById(form.getDichVuDinhKiem().getId_DichVu()));
		form.calculation();
		thongTinTiecCuoiService.save(form);
		model.addAttribute("list", thongTinTiecCuoiService.findAll());
		return "thongTinTiecCuoi/list";
	}
	private boolean isValidTienDatCoc(ThongTinTiecCuoi form) {
		return form.getTienDatCoc() > form.getTienThanhToan()*10/100;
	}
	
	
	@ModelAttribute("dichVuDiKem")
	public List<DichVu> findAll(){
		return dichVuService.findAll();
	}
	
	
}
