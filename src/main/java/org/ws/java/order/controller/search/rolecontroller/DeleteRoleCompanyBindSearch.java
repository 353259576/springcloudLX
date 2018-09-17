package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class DeleteRoleCompanyBindSearch implements Serializable {
    public Long roleId;
    public Long companyIds[];
}
