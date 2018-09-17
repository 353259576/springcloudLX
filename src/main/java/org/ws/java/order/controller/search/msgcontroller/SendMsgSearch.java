package org.ws.java.order.controller.search.msgcontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SendMsgSearch implements Serializable {
    public Long userId;
    public Long roleId;
    public String msg;
}
