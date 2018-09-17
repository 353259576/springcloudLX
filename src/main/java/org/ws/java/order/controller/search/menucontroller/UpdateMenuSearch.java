package org.ws.java.order.controller.search.menucontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;

@Getter
@Setter
public class UpdateMenuSearch implements Serializable {

    private Long id;

    private String name; //

    private String image; //

    private String path; //

    private Integer orderNo;

    private Long status; //0:删除1：存在
}
