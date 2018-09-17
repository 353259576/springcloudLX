package org.ws.java.order.controller.search.userconroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class UpdateUserSearch implements Serializable {
    private Long id;

    private String userName;

    private String userPassword;

    private String userSex;

    private String userRealName;

    private String userPhone;

    private String userBankCard;

    private String userAddress;

}
