package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.math.BigInteger;
import java.util.Date;

@Entity
@Table(name = "d_user")
@Getter
@Setter
public class UserPO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "user_name")
    private String userName; //

    @Column(name = "user_password")
    private String userPassword; //

    @Column(name = "user_sex")
    private String userSex; //

    @Column(name = "user_real_name")
    private String userRealName; //

    @Column(name = "user_phone")
    private String userPhone; //

    @Column(name = "user_bank_card")
    private String userBankCard; //

    @Column(name = "user_address")
    private String userAddress; //

    @Column(name = "create_date")
    private Date createDate;
}
