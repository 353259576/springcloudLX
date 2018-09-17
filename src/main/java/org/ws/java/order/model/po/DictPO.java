package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "d_dict")
@Getter
@Setter
public class DictPO implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "code")
    private String code; //

    @Column(name = "label")
    private String label; //

    @Column(name = "type")
    private String type; //

    @Column(name = "order_no")
    private Integer orderNo; //

    @Column(name = "kind")
    private Integer kind; //

    @Column(name = "status")
    private Integer status; //

}
