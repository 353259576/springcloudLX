package org.ws.java.order.dao.mapper;

import java.util.Map;

public interface CompanyReceptionMapper {

    public Double selectReceptionAllPrice(Map map);

    public Double selectReceptionReceptionPrice(Map map);

    public Integer selectReceptionCount(Map map);

    public Double selectReceptionUserPrice(Map map);
}
