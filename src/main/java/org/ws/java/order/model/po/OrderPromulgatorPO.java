package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
@Entity
@Table(name = "d_order_promulgator")
public class OrderPromulgatorPO implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "order_promulgator_name")
    private String orderPromulgatorName; //

    @Column(name = "order_promulgator_status")
    private Integer orderPromulgatorStatus; //

    @Column(name = "order_create_date")
    private Date orderCreateDate; //
}
