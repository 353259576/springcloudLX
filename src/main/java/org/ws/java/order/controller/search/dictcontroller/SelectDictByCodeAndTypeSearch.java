package org.ws.java.order.controller.search.dictcontroller;

import lombok.Getter;
import lombok.Setter;

import javax.ws.rs.GET;
import java.io.Serializable;

@Getter
@Setter
public class SelectDictByCodeAndTypeSearch implements Serializable {
    public String code;
    public String type;
}
