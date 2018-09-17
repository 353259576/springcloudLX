package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_company_summary")
@Getter
@Setter
public class CompanySummaryPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //
    @Column(name = "summary_name")
    private String summaryName; //
    @Column(name = "summary_usernum")
    private Integer summaryUsernum; //
    @Column(name = "summary_userprice_all")
    private Double summaryUserpriceAll; //
    @Column(name = "summary_ordernum")
    private Integer summaryOrdernum; //
    @Column(name = "summary_orderprice")
    private Double summaryOrderprice; //
    @Column(name = "summary_agentprice")
    private Double summaryAgentprice; //
    @Column(name = "summary_create_date")
    private Date summaryCreateDate; //
    @Column(name = "company_id")
    private Long companyId;

}
