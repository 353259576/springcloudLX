package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_order")
@Getter
@Setter
public class OrderPO implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "order_name")
    private String orderName; //

    @Column(name = "order_no")
    private String orderNo; //

    @Column(name = "order_promulgator")
    private String orderPromulgator; //

    @Column(name = "order_num")
    private Integer orderNum; //

    @Column(name = "order_all_num")
    private Integer orderAllNum;

    @Column(name = "order_price")
    private Double orderPrice; //

    @Column(name = "order_predict_price")
    private Double orderPredictPrice; //

    @Column(name = "order_real_price")
    private Double orderRealPrice; //

    @Column(name = "order_real_num")
    private Integer orderRealNum; //

    @Column(name = "order_agency_price")
    private Double orderAgencyPrice; //

    @Column(name = "order_agency_all_price")
    private Double orderAgencyAllPrice; //

    @Column(name = "order_create_user")
    private Long orderCreateUser; //

    @Column(name = "order_create_date")
    private Date orderCreateDate; //

    @Column(name = "order_update_user")
    private Long orderUpdateUser; //

    @Column(name = "order_update_date")
    private Date orderUpdateDate; //

    @Column(name = "order_effective_date")
    private Date orderEffectiveDate;

    @Column(name = "order_type")
    private Integer orderType;

    @Column(name = "order_status")
    private Integer orderStatus; //

    @Column(name = "order_remake")
    private String orderRemake;

    @Column(name = "order_idcode_index")
    private Integer orderIdcodeIndex;
}
