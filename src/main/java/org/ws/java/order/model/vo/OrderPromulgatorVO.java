package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class OrderPromulgatorVO implements Serializable {
    private Long id; //

    private String orderPromulgatorName; //

    private Integer orderPromulgatorStatus; //

    private String orderPromulgatorStatusLabel; //

    private Double price;

    private Date orderCreateDate; //

    private String orderCreateDateLabel;
}
