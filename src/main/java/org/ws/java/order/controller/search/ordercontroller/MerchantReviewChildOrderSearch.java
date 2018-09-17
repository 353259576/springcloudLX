package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class MerchantReviewChildOrderSearch implements Serializable {
    public Long orderId;
    public Long companyId;
}
