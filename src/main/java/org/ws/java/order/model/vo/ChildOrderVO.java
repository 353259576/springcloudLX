package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class ChildOrderVO implements Serializable {

    private Long id; //

    private String userName; //

    private String userPhone; //

    private String userIdcode; //

    private Long parentOrderId; //

    private String orderName;

    private String orderRemake;


    private String childOrderNo; //

    private String childOrderRemake; //

    private String childFailedRemake; //

    private Date childOrderUpdateDate; //

    private Long childOrderUpdateUser; //

    private Integer childOrderStatus; //


    private String childOrderStatusLbel; //


    private Long childOrderCompanyId; //

    private String companyName;


    private Date childOrderCreateDate;

    private String childOrderCreateDateLabel;

    private String orderPromulgator;

    private String childOrderMsg;


}
