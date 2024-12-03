package nam.com.fa.demomvc.annotation;

import static java.lang.annotation.ElementType.FIELD;

import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;



@Target({FIELD})
@Retention(RetentionPolicy.RUNTIME)
@Constraint(validatedBy = {NgayToChucValidator.class})
public @interface NgayToChucConstraint {
	String message() default "“Khong ton tai viec lam trong he thong";

    Class<?>[] groups() default {};

    Class<? extends Payload>[] payload() default {};
}
