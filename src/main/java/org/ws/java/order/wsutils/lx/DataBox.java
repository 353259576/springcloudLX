package org.ws.java.order.wsutils.lx;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.Map;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

@Getter
@Setter
public class DataBox implements Delayed {
    private Date createDate;
    private Long id;
    private String name;
    private String remake;
    public Map<String,Long> map;

    public DataBox(){
        this.createDate = new Date();
    }

    @Override
    public long getDelay(TimeUnit unit) {
        Date nowDate = new Date();
        long residueTime = getCreateDate().getTime() + 2000 - nowDate.getTime();
        return unit.convert(residueTime,TimeUnit.NANOSECONDS);
    }

    @Override
    public int compareTo(Delayed o) {
        long i = this.getDelay(TimeUnit.NANOSECONDS) - o.getDelay(TimeUnit.NANOSECONDS);
        if(i > 0l){
            return 1;
        }else if(i < 0l){
            return -1;
        }else {
            return 0;
        }

    }
}
