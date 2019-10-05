package kr.co.uclick.entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QMobilePhone is a Querydsl query type for MobilePhone
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QMobilePhone extends EntityPathBase<MobilePhone> {

    private static final long serialVersionUID = -1783671807L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QMobilePhone mobilePhone = new QMobilePhone("mobilePhone");

    public final QCustomer customer;

    public final NumberPath<Long> id = createNumber("id", Long.class);

    public final StringPath phoneNumber = createString("phoneNumber");

    public final StringPath regDate = createString("regDate");

    public QMobilePhone(String variable) {
        this(MobilePhone.class, forVariable(variable), INITS);
    }

    public QMobilePhone(Path<? extends MobilePhone> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QMobilePhone(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QMobilePhone(PathMetadata metadata, PathInits inits) {
        this(MobilePhone.class, metadata, inits);
    }

    public QMobilePhone(Class<? extends MobilePhone> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.customer = inits.isInitialized("customer") ? new QCustomer(forProperty("customer")) : null;
    }

}

