package org.ws.java.order.model.dto;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Set;

@Getter
@Setter
public class UserOrderDTO implements Serializable {

    private String userName;
    private String userPhone;
    private String userIdCode;
    private Long CompanyId;


}
