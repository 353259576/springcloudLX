package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class LineChartVO implements Serializable {
    private String value1 = "0";
    private String value2 = "0";
    private String probability = "0.00%";
    private String datelabel;
}
