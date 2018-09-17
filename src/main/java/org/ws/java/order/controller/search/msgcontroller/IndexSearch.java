package org.ws.java.order.controller.search.msgcontroller;

import lombok.Getter;
import lombok.Setter;

import javax.ws.rs.GET;
import java.io.Serializable;

@Getter
@Setter
public class IndexSearch implements Serializable {
    public Long index;
}
