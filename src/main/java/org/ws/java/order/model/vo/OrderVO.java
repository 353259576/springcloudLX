package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class OrderVO implements Serializable {


    private Long id; //

    private String orderName; //

    private String orderNo; //

    private String orderPromulgator; //

    private Integer orderNum; //

    private Integer orderAllNum;

    private Double orderPrice; //

    private Double orderPredictPrice; //

    private Double orderRealPrice; //

    private Integer orderRealNum; //

    private Double orderAgencyPrice; //

    private Double orderAgencyAllPrice; //

    private Long orderCreateUser; //

    private String orderCreateUserLabel;

    private Date orderCreateDate; //

    private String orderCreateDateLabel;

    private Long orderUpdateUser; //

    private String orderUpdateUserLabel;

    private Date orderUpdateDate; //

    private String orderUpdateDateLabel;

    private Integer orderStatus; //

    private String orderStatusLabel;

    private Integer orderType;

    private String orderTypeLabel;

    private String orderRemake;

    private Date orderEffectiveDate;

    private String orderEffectiveDateLabel;

    private Integer orderIdcodeIndex;
}
