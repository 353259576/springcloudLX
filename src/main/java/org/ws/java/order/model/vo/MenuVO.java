package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;
import java.util.Comparator;
import java.util.List;

@Getter
@Setter
public class MenuVO implements Serializable,Comparable<MenuVO> {
    private Long id; //

    private String idString;

    private String name; //

    private String image; //

    private String path; //

    private Integer type; //

    private Long parentId;

    private Integer orderNo;

    private boolean isHave = false;

    private List<MenuVO> menuVOS; //


    @Override
    public int compareTo(MenuVO o) {
        if (this.getOrderNo() != null && o.getOrderNo() != null) {
            /*if (this.getOrderNo() > o.getOrderNo()) {
                return 1;
            }else if (this.getOrderNo() > o.getOrderNo()){
                return -1;
            }*/
            if(this.getOrderNo().equals( o.getOrderNo())){
                return (int) (this.getId() - o.getId());
            }else {
                return this.getOrderNo() - o.getOrderNo();
            }
        }else {
            return (int) (this.getId() - o.getId());
        }
    }
}
