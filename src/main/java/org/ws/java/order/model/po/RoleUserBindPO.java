package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

@Entity
@Table(name = "d_role_user_bind")
@Getter
@Setter
public class RoleUserBindPO implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "user_id")
    private Long userId; //

    @Column(name = "role_id")
    private Long roleId; //

    @Column(name = "createby")
    private Long createby; //

    @Column(name = "createdt")
    private Date createdt; //
}
