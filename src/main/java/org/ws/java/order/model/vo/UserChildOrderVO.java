package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class UserChildOrderVO implements Serializable {

    private Long id; //

    private String userName; //

    private String userPhone; //

    private String userIdcode; //

    private Long parentOrderId; //

    private String childOrderNo; //

    private String childOrderRemake; //

    private String childFailedRemake; //

    private Integer childOrderStatus; //

    private Long childOrderCompanyId; //

    private Date childOrderCreateDate;

    private String childOrderCreateDateLabel;

    private String orderPromulgator;

    private String parentOrderName;

    private String childOrderMsg;

}
