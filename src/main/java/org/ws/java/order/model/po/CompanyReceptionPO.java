package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;
import org.checkerframework.checker.units.qual.C;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "d_company_reception")
public class CompanyReceptionPO implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //
    @Column(name = "user_name")
    private String userName; //
    @Column(name = "user_phone")
    private String userPhone; //
    @Column(name = "user_reception")
    private String userReception; //
    @Column(name = "reception_type")
    private String receptionType; //
    @Column(name = "reception_price")
    private Double receptionPrice; //
    @Column(name = "user_price")
    private Double userPrice; //
    @Column(name = "all_price")
    private Double allPrice; //
    @Column(name = "create_date")
    private Date createDate; //
    @Column(name = "company_id")
    private Long companyId;

    @Column(name = "drawings_id")
    public Long drawingsId;

    @Column(name = "reception_status")
    public Integer receptionStatus;
}
