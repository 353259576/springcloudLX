package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "d_role")
@Getter
@Setter
public class RolePO {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "name")
    private String name; //

    @Column(name = "path")
    private String path;

    @Column(name = "parent_id")
    private Long parentId; //

    @Column(name = "type")
    private Integer type; //

    @Column(name = "status")
    private Integer status; //

    @Column(name = "createby")
    private Long createby; //

    @Column(name = "createdt")
    private Date createdt; //

    @Column(name = "updateby")
    private Long updateby; //

    @Column(name = "updatedt")
    private Date updatedt; //

}
