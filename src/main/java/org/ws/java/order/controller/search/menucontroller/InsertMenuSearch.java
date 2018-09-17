package org.ws.java.order.controller.search.menucontroller;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import java.io.Serializable;

@Getter
@Setter
public class InsertMenuSearch implements Serializable {

    private String name; //

    private String image; //

    private String path; //

    private Integer orderNo;

    private Long parentId; //
}
