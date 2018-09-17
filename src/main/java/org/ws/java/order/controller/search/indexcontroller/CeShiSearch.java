package org.ws.java.order.controller.search.indexcontroller;

import lombok.Getter;
import lombok.Setter;

import java.io.Serializable;
import java.util.List;

@Getter
@Setter
public class CeShiSearch implements Serializable {
    private Long id;
    private List<String> companys;
}
