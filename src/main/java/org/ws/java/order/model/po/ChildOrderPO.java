package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "d_order_detail")
@Getter
@Setter
public class ChildOrderPO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "user_name")
    private String userName; //

    @Column(name = "user_phone")
    private String userPhone; //

    @Column(name = "user_idcode")
    private String userIdcode; //

    @Column(name = "parent_order_id")
    private Long parentOrderId; //

    @Column(name = "child_order_no")
    private String childOrderNo; //

    @Column(name = "child_order_remake")
    private String childOrderRemake; //

    @Column(name = "child_failed_remake")
    private String childFailedRemake; //

    @Column(name = "child_order_update_date")
    private Date childOrderUpdateDate; //

    @Column(name = "child_order_update_user")
    private Long childOrderUpdateUser; //

    @Column(name = "child_order_status")
    private Integer childOrderStatus; //

    @Column(name = "child_order_company_id")
    private Long childOrderCompanyId; //

    @Column(name = "child_order_create_date")
    private Date childOrderCreateDate;

    @Column(name = "order_promulgator")
    private String orderPromulgator;

    @Column(name = "parent_order_name")
    private String parentOrderName;

    @Column(name = "child_order_msg")
    private String childOrderMsg;

    @Column(name = "order_real_price")
    private Double orderRealPrice;

    @Column(name = "order_agency_price")
    private Double orderAgencyPrice;

    @Column(name = "order_idcode_index")
    private Integer orderIdcodeIndex;
}
