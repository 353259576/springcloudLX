package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_company")
@Getter
@Setter
public class CompanyPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "name")
    private String name; //

    @Column(name = "bank_code")
    private String bankCode; //

    @Column(name = "city_id")
    private Long cityId; //

    @Column(name = "type")
    private Integer type; //

    @Column(name = "bank_address")
    private String bankAddress; //

    @Column(name = "bank_name")
    private String bankName; //

    @Column(name = "linkman")
    private String linkman; //

    @Column(name = "linkphone")
    private String linkphone; //

    @Column(name = "address")
    private String address; //

    @Column(name = "create_user")
    private Long createUser;

    @Column(name = "create_date")
    private Date createDate;
}
