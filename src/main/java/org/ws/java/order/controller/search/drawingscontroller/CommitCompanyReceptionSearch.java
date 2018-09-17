package org.ws.java.order.controller.search.drawingscontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class CommitCompanyReceptionSearch implements Serializable {

    public Long drawingsId;

    public Long companyId;
}
