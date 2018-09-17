package org.ws.java.order.wsutils.lx;

import lombok.Getter;
import lombok.Setter;

import javax.ws.rs.GET;

@Getter
@Setter
public class DemoObject extends BaseDemoObject {
    //public Long id;
    public String name;

    public String lx(){
        return "lx";
    }

    public String lx(Integer k){
        return "lx"+k;
    }
}
