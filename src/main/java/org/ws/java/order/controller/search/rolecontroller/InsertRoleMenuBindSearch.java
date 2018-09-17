package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class InsertRoleMenuBindSearch implements Serializable {
    public Long[] menuIds;
    public Long roleId;
}
