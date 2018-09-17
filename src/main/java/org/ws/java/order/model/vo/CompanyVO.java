package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class CompanyVO implements Serializable {


    private Long id; //

    private String key;

    private String title;

    private String name; //

    private String bankCode; //

    private Long cityId; //

    private String cityIdLabel;

    private Integer type; //

    private String typelabel;

    private String bankAddress; //

    private String bankName; //

    private String linkman; //

    private String linkphone; //

    private String address; //

    private Long createUser;

    private String createUserLabel;

    private Date createDate;

    private String createDateLabel;

    private Double price;
}
