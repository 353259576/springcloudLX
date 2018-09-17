package org.ws.java.order.wsutils.lx;

import lombok.Getter;
import lombok.Setter;

import java.util.HashMap;
import java.util.Map;

@Getter
@Setter
public class BaseDemoObject {
    public String id;
    public String context;
    public Long orderEffectiveDate;
    public Map<String,String> map;
}
