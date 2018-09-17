package org.ws.java.order.model.dto;

import lombok.Getter;
import lombok.Setter;

import javax.ws.rs.GET;

@Getter
@Setter
public class RoleAllDTO {
    private Long id; //
    private String name; //
    private String path;
    private Long parentId; //
    private Integer type; //


}
