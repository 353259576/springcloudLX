package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class ChangeRoleTypeSearch implements Serializable {
    public Long id;
    public Integer type;

}
