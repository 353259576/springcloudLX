package org.ws.java.order.controller.search.dictcontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SelectDictByTypeSearch implements Serializable {
    public String type;
}
