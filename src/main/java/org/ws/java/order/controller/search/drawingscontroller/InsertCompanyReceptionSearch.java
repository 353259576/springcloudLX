package org.ws.java.order.controller.search.drawingscontroller;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class InsertCompanyReceptionSearch implements Serializable {
    private Long id; //
    private String userReception;
    private String receptionType;
    private Double receptionPrice;
    private Double userPrice;
    private Double allPrice;
}
