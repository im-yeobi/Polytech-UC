package kr.co.uclick.configuration;

import java.util.Properties;

import javax.persistence.EntityManagerFactory;
import javax.sql.DataSource;

import org.apache.commons.dbcp2.BasicDataSource;
import org.apache.ignite.cache.hibernate.HibernateRegionFactory;
import org.hibernate.cfg.AvailableSettings;
import org.hibernate.dialect.MySQL5Dialect;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.AdviceMode;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ComponentScans;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.DependsOn;
import org.springframework.context.annotation.ImportResource;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.aspectj.EnableSpringConfigured;
import org.springframework.dao.annotation.PersistenceExceptionTranslationPostProcessor;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.orm.jpa.JpaTransactionManager;
import org.springframework.orm.jpa.JpaVendorAdapter;
import org.springframework.orm.jpa.LocalContainerEntityManagerFactoryBean;
import org.springframework.orm.jpa.vendor.HibernateJpaVendorAdapter;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@ImportResource(locations = "classpath:applicationContext-ignite.xml")
@ComponentScans({ @ComponentScan({ "kr.co.uclick.service" }) })
@EnableTransactionManagement(mode = AdviceMode.ASPECTJ)
@EnableSpringConfigured	// 스프링 로딩 시 기본 옵션
@EnableJpaRepositories(basePackages = "kr.co.uclick.repository")	// 스프링 데이터
@EnableCaching
public class SpringConfiguration {
	@Bean
	@Primary
	public DataSource dataSource () {
		BasicDataSource dataSource = new BasicDataSource();
		//dataSource.setDriverClassName("org.h2.Driver");
		//dataSource.setUrl("jdbc:h2:~/test");
		//dataSource.setUsername("sa");
		//dataSource.setPassword("");
		
		dataSource.setDriverClassName("org.mariadb.jdbc.Driver");
		dataSource.setUrl("jdbc:mariadb://localhost:3306/jyk");
		dataSource.setUsername("root");
		dataSource.setPassword("1");
		return dataSource;
	}
	
	@Bean
	public LocalSessionFactoryBean sessionFactory() {	// 하이버네이트 로딩
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan(new String[] { "kr.co.uclick.entity" });
		sessionFactory.setHibernateProperties(additionalProperties());
		
		return sessionFactory;
	}

	@Bean
	@DependsOn("igniteSystem")
	@Primary
	public LocalContainerEntityManagerFactoryBean entityManagerFactory() {	// 하이버네이트 로딩
		LocalContainerEntityManagerFactoryBean em = new LocalContainerEntityManagerFactoryBean();
		em.setDataSource(dataSource());
		em.setPackagesToScan(new String[] { "kr.co.uclick.entity" });	// 해당 엔티티 로딩
		JpaVendorAdapter vendorAdapter = new HibernateJpaVendorAdapter();	// 하이버네이트를 사용하겠다
		em.setJpaVendorAdapter(vendorAdapter);
		em.setJpaProperties(additionalProperties());
		return em;
	}

	@Bean
	@Primary
	public PlatformTransactionManager transactionManager(EntityManagerFactory emf) {	// 트랜잭션 매니저
		JpaTransactionManager transactionManager = new JpaTransactionManager();
		transactionManager.setEntityManagerFactory(emf);
		return transactionManager;
	}

	@Bean
	public PersistenceExceptionTranslationPostProcessor exceptionTranslation() {
		return new PersistenceExceptionTranslationPostProcessor();
	}
	
	public Properties additionalProperties() {	// 프로퍼티
		Properties properties = new Properties();
		properties.setProperty(AvailableSettings.HBM2DDL_AUTO, "update");	// create_drop
		properties.setProperty(AvailableSettings.FORMAT_SQL, Boolean.TRUE.toString());
		properties.setProperty(AvailableSettings.SHOW_SQL, Boolean.TRUE.toString());
		//properties.setProperty(AvailableSettings.DIALECT, H2Dialect.class.getName());
		properties.setProperty(AvailableSettings.DIALECT, MySQL5Dialect.class.getName());

		properties.setProperty(AvailableSettings.STATEMENT_BATCH_SIZE, "1000");

		properties.setProperty(AvailableSettings.USE_SECOND_LEVEL_CACHE, Boolean.TRUE.toString());	// Layer 2 Cache 설정
		properties.setProperty(AvailableSettings.USE_QUERY_CACHE, Boolean.TRUE.toString());
		properties.setProperty(AvailableSettings.GENERATE_STATISTICS, Boolean.FALSE.toString());
		properties.setProperty(AvailableSettings.CACHE_REGION_FACTORY, HibernateRegionFactory.class.getName());

		properties.setProperty("org.apache.ignite.hibernate.ignite_instance_name", "cafe-grid");	// cafe-grid로 인해 ignite와 연동
		properties.setProperty("org.apache.ignite.hibernate.default_access_type", "NONSTRICT_READ_WRITE");	// cache access 정책

		properties.setProperty(AvailableSettings.PHYSICAL_NAMING_STRATEGY,
				CustomPhysicalNamingStrategyStandardImpl.class.getName());
		return properties;
	}

}
