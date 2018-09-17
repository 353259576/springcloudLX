package org.ws.java.order.controller.search.rolecontroller;

import lombok.Getter;
import lombok.Setter;
import org.ws.java.order.model.vo.PageVO;

import java.io.Serializable;

@Getter
@Setter
public class GetUserCompanySearch implements Serializable {
    public String path;
    private PageVO pageVO;
}
