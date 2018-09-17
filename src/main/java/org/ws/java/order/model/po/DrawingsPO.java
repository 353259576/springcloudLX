package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_drawings")
@Getter
@Setter
public class DrawingsPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "draw_price")
    private Double drawPrice; //

    @Column(name = "draw_user_price")
    public Double drawUserPrice;

    @Column(name = "draw_agency_price")
    private Double drawAgencyPrice;

    @Column(name = "draw_company_id")
    private Long drawCompanyId; //

    @Column(name = "draw_create_user")
    private Long drawCreateUser; //

    @Column(name = "draw_create_date")
    private Date drawCreateDate; //

    @Column(name = "draw_update_user")
    private Long drawUpdateUser; //

    @Column(name = "draw_update_date")
    private Date drawUpdateDate; //

    @Column(name = "draw_status")
    private Integer drawStatus; //

    @Column(name = "draw_name")
    private String drawName; //

    @Column(name = "draw_type")
    private Integer drawType;

}
