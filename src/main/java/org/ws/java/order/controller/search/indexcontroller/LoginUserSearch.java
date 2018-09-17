package org.ws.java.order.controller.search.indexcontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class LoginUserSearch implements Serializable {
    String userPhone;
    String password;
    String securityCode;

}
