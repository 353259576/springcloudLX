package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class UpdateOrderSearch implements Serializable {
    public Long id;
    public String orderName;
    public String orderPromulgator;
    public Integer orderType;
    public Integer orderAllNum;
    public Double orderPrice;
    public Double orderAgencyPrice;
    public String orderEffcientDate;
    public String orderRemake;
}
