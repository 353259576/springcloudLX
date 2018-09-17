package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import javax.ws.rs.GET;
import java.io.Serializable;

@Getter
@Setter
public class FinishOrderSearch implements Serializable {
    public Long orderId;
}
