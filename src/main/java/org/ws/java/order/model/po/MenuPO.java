package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "d_menu")
@Getter
@Setter
public class MenuPO implements Serializable,Comparable<MenuPO> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "name")
    private String name; //

    @Column(name = "image")
    private String image; //

    @Column(name = "path")
    private String path; //

    @Column(name = "order_no")
    private Integer orderNo;

    @Column(name = "type")
    private Integer type; //

    @Column(name = "parent_id")
    private Long parentId; //

    @Column(name = "status")
    private Long status; //0:删除1：存在


    @Override
    public int compareTo(MenuPO o) {
        if(o.getId()>this.getId()){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof MenuPO){
            MenuPO menuPO = (MenuPO)obj;
            if(menuPO.getId().equals(this.getId())) {
                return true;
            }else {
                return false;
            }

        }else {
            return super.equals(obj);
        }

    }
}
