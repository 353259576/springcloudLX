package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "d_company_account")
@Getter
@Setter
public class CompanyAccountPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "company_balance")
    private Double companyBalance; //

    @Column(name = "company_frozen")
    private Double companyFrozen; //

    @Column(name = "company_history")
    private Double companyHistory; //

    @Column(name = "company_id")
    private Long companyId; //

}
