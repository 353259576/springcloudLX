package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MerchantRefuseChildOrderSearch implements Serializable {
    public Long childOrderId;
    public Long companyId;
    public String msg;
}
