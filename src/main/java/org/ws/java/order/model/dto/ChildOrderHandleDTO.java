package org.ws.java.order.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

@Getter
@Setter
public class ChildOrderHandleDTO implements Serializable, Delayed {
    private Long childOrderId;

    private Long orderId;

    private Date createDate;

    private Long expirationTime = 3600l*1000l*2l;

    @Override
    public long getDelay(TimeUnit unit) {
        Long residueTime =  createDate.getTime() + expirationTime - new Date().getTime();
        return unit.convert(residueTime,TimeUnit.NANOSECONDS);
    }

    @Override
    public int compareTo(Delayed o) {
        Long difference = this.getDelay(TimeUnit.NANOSECONDS) - o.getDelay(TimeUnit.NANOSECONDS);
        if(difference > 0l){
            return 1;
        }else if(difference < 0l){
            return -1;
        }else {
            return 0;
        }
    }
}
