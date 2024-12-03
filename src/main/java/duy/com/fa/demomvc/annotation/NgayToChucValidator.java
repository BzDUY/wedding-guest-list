package nam.com.fa.demomvc.annotation;

import java.time.LocalDate;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class NgayToChucValidator implements ConstraintValidator<NgayToChucConstraint, LocalDate>{

	@Override
	public boolean isValid(LocalDate value, ConstraintValidatorContext context) {
		if (value == null) {
	        return false; // Or true, depending on your validation rules
	    }
		return value.isAfter(LocalDate.now());
	}

}
