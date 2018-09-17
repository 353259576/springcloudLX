package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class DeleteOrderCompanyBindSearch implements Serializable {
    public Long companyId;
    public Long orderId;
}
