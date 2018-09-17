package org.ws.java.order.controller.search.drawingscontroller;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class InsertDrawingsSearch implements Serializable {

    private Double drawPrice; //

    private Long drawCompanyId; //

    private String drawName; //
}
