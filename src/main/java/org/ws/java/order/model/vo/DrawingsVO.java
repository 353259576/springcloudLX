package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class DrawingsVO implements Serializable {

    private Long id; //

    private Double drawPrice; //

    public Double drawUserPrice;

    private Double drawAgencyPrice;

    private Long drawCompanyId; //

    private String drawCompanyLabel; //

    private Long drawCreateUser; //

    private String drawCreateUserLabel; //

    private Date drawCreateDate; //

    private String drawCreateDateLabel; //

    private Long drawUpdateUser; //

    private String drawUpdateUserLabel; //

    private Date drawUpdateDate; //

    private String drawUpdateDateLabel; //

    private Integer drawStatus; //

    private String drawStatusLabel; //

    private String drawName; //

    private Integer drawType;

    private String drawTypeLabel;

    private Double CompanyPrice;
}
