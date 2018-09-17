package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "d_order_company_bind")
@Getter
@Setter
public class OrderCompanyBindPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "company_id")
    private Long companyId; //

    @Column(name = "order_id")
    private Long orderId; //
}
