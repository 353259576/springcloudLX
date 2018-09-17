package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class MsgVO implements Serializable {
    private Long id; //

    private String msgName; //

    private String msgContext; //

    private Long msgSendRole; //

    private Date msgCreateDate; //

    private String msgCreateDateLabel; //

    private Long msgCreateUser; //

    private String msgCreateUserLabel; //

    private Integer msgStatus; //

    private String msgStatusLabel;

    private Integer msgRead; //

    private Integer msgType; //

    private String msgTypeLabel; //

    private Long msgSendUser;

    private String msgSendUserLabel;
}
