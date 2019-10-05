package kr.co.uclick.entity;

import java.util.Collection;

import javax.persistence.Cacheable;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.TableGenerator;

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;
import org.jetbrains.annotations.NotNull;

@Entity
@TableGenerator(name="customer", table="pk_sequence", allocationSize=1)
@Table(name = "customer")
@Cacheable
@Cache(usage = CacheConcurrencyStrategy.READ_WRITE)
public class Customer {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.TABLE, generator="customer")
	private Long id;	// 고객번호

	@Column(name="login_id", length=30)	
	@NotNull
	private String loginId;	// 계정 id
	
	@Column(name="login_pwd", length=30)	
	@NotNull
	private String loginPwd;	// 계정 pwd
	
	@Column(name="name", length=20)
	private String name;	// 이름
	
	@Column(name="gender", length=2)
	private String gender;	// 성별
	
	@Column(name="age")
	private int age;		// 나이
	
	@Column(name="email", length=30)
	private String email;	// 이메일
	
	@Column(name="birth_date", columnDefinition= "Date")	// 생년월일
	private String birthDate;
	
	@Column(name="reg_date", columnDefinition="Date")	// 가입일
	private String regDate;
	
	@Cache(usage = CacheConcurrencyStrategy.NONE)
	@OneToMany(mappedBy="customer", fetch=FetchType.EAGER, cascade=CascadeType.REMOVE)
	private Collection<MobilePhone> mobilePhones;

	public Customer() { }
	
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}
	
	public String getLoginId() {
		return loginId;
	}

	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}

	public String getLoginPwd() {
		return loginPwd;
	}

	public void setLoginPwd(String loginPwd) {
		this.loginPwd = loginPwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public Collection<MobilePhone> getMobilePhones() {
		return mobilePhones;
	}

	public void setMobilePhones(Collection<MobilePhone> mobilePhones) {
		this.mobilePhones = mobilePhones;
	}
	
	
	
}
