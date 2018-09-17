package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class UserVO implements Serializable {

    private Long id;

    private String key;

    private String title;

    private String userName; //

    private String userSex; //

    private String userRealName; //

    private String userPhone; //

    private String userBankCard; //

    private String userAddress; //

    private Date createDate;

    private String createDateLabel;
}
