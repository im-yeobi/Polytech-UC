package kr.co.uclick.entity;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.jetbrains.annotations.NotNull;

@Entity
@Table(name = "mobilephone")
@TableGenerator(name="mobilephone", table="pk_sequence", allocationSize=1)
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class MobilePhone {

	@Id	// Primary Key
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="mobilephone")
	private Long id;		// 고객번호
	
	@ManyToOne(targetEntity = Customer.class, cascade=CascadeType.MERGE)
	@JoinColumn(name = "customer_id", referencedColumnName = "id")
	@NotNull
	private Customer customer;
	
	@Column(name="phone_number", length=20)
	@NotNull
	private String phoneNumber;
	
	@Column(name="reg_date", columnDefinition="Date")	// 등록일
	private String regDate;
	
	public MobilePhone() { }


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
