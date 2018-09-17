package org.ws.java.order.controller.search.ordercontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class PlatformAgreeChildOrdersSearch implements Serializable {
    public Long childOrderIds[];
}
