package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class InsertRoleSearch implements Serializable {
    public String name;
    public Integer type;
    public Long parentId;
}
