package org.ws.java.order.controller.search.userconroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class SelectUserByIdSearch implements Serializable {

    public Long userId;
}
