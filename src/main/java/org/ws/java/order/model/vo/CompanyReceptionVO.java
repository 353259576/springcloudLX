package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class CompanyReceptionVO implements Serializable {
    private Long id; //
    private String userName; //
    private String userPhone; //
    private String userReception; //
    private String receptionType; //
    private Double receptionPrice; //
    private Double userPrice; //
    private Double allPrice; //
    private Date createDate; //
    private String createDateLabel;
    private Long companyId;
    private String companyName;
}
