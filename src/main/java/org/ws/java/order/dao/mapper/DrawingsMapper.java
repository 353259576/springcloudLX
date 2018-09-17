package org.ws.java.order.dao.mapper;

import org.ws.java.order.model.po.DrawingsPO;

import java.util.Map;

public interface DrawingsMapper {

    public Double selectDrawingsPrice(Map map);

    public void updateDrawings(DrawingsPO drawingsPO);
}
