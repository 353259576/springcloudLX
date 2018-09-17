package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class UserOrderVO implements Serializable {

    private Long id; //

    private String orderName; //

    private String orderNo; //

    private String orderPromulgator; //

    private Integer merchantAgreeOrderNum;

    private Integer orderNum; //

    private Integer orderAllNum;

    private Double orderAgencyPrice; //

    private Integer orderType;

    private Integer orderStatus; //

    private String orderRemake;
}
