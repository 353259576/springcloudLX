package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_role_company_bind")
@Getter
@Setter
public class RoleCompanyBindPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "company_id")
    private Long companyId; //

    @Column(name = "role_id")
    private Long roleId; //

    @Column(name = "createby")
    private Long createby; //

    @Column(name = "createdt")
    private Date createdt; //
}
