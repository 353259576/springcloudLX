package org.ws.java.order.dao.mapper;

import java.util.Map;

public interface CompanySummaryMapper {

    public Integer selectCompanySummaryUserNumAll(Map map);
    public Integer selectCompanySummaryOrderNumAll(Map map);
    public Double selectCompanySummaryUserpriceAll(Map map);
    public Double selectCompanySummaryOrderPriceAll(Map map);
    public Double selectCompanySummaryAgentPriceAll(Map map);

}
