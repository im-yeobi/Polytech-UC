package kr.co.uclick.predicate;

import static kr.co.uclick.entity.QCustomer.customer;
import static kr.co.uclick.entity.QMobilePhone.mobilePhone;

import com.querydsl.core.BooleanBuilder;
import com.querydsl.core.types.Predicate;

public class CustomerPredicate {
	public static Predicate search(String nameOrPhone, String searchType) {
		BooleanBuilder builder = new BooleanBuilder();
		
		if ( searchType.equals("name") ) {
			builder.and(customer.name.like("%" + nameOrPhone + "%"));
		} else {
			builder.and(mobilePhone.phoneNumber.like("%" + nameOrPhone + "%"));
		}
		
		return builder;
	}
}
