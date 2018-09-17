package org.ws.java.order.model.vo;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.xml.soap.SAAJResult;
import java.io.Serializable;
import java.util.Date;

@Getter
@Setter
public class RoleVO implements Serializable {

    private Long id; //

    private String name; //

    //private String path;

    private Long parentId; //

    private Integer type; //

    private String typeLabel;

    private Integer status; //

    private String statusLabel;

    private Long createby; //

    private String createByLabel;

    private Date createdt; //

    private String createdtLabel;

    private Long updateby; //

    private String updateByLabel;

    private Date updatedt; //

    private String updateDtLabel;

}
