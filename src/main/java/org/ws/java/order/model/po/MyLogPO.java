package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_log")
@Getter
@Setter
public class MyLogPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "ip")
    private String ip; //

    @Column(name = "create_user")
    private Long createUser; //

    @Column(name = "create_date")
    private Date createDate; //

    @Column(name = "name")
    private String name; //

    @Column(name = "parameter")
    private String parameter; //

    @Column(name = "return_msg")
    private String returnMsg; //
}
