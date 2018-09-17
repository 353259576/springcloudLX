package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class ChangeRoleNameSearch implements Serializable {

    public Long id;
    public String name;
}
