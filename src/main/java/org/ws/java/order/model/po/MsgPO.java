package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_msg")
@Getter
@Setter
public class MsgPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "msg_name")
    private String msgName; //

    @Column(name = "msg_context")
    private String msgContext; //

    @Column(name = "msg_send_role")
    private Long msgSendRole; //

    @Column(name = "msg_create_date")
    private Date msgCreateDate; //

    @Column(name = "msg_create_user")
    private Long msgCreateUser; //

    @Column(name = "msg_status")
    private Integer msgStatus; //

    @Column(name = "msg_read")
    private Integer msgRead; //

    @Column(name = "msg_type")
    private Integer msgType; //

    @Column(name = "msg_send_user")
    private Long msgSendUser;

}
