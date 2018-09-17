package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "d_role_menu_bind")
@Getter
@Setter
public class RoleMenuBindPO {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "menu_id")
    private Long menuId; //

    @Column(name = "role_id")
    private Long roleId; //

    @Column(name = "createby")
    private Long createby; //

    @Column(name = "createdt")
    private Date createdt; //
}
