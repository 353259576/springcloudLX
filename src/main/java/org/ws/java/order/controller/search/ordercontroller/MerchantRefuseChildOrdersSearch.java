package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MerchantRefuseChildOrdersSearch implements Serializable {
    public Long childOrderIds[];
    public Long companyId;
    public String msg;

}
