package org.ws.java.order.service;

import org.ws.java.order.model.po.CompanyReceptionPO;
import org.ws.java.order.model.po.CompanySummaryPO;
import org.ws.java.order.model.po.DrawingsPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import javax.management.relation.RoleUnresolved;
import java.util.Date;
import java.util.List;
import java.util.Map;

public interface DrawingsService {

    public Long insertDrawings(DrawingsPO drawingsPO) throws RuntimeException;

    public void updateDrawingsStatus(Long id,Integer status) throws RuntimeException;

    public PageInfo<DrawingsPO> selectDrawings(MySearchList mySearchList) throws RuntimeException;

    public DrawingsPO selectDrawingsById(Long drawingsId) throws RuntimeException;

    public List<DrawingsPO> selectDrawingsAll(MySearchList mySearchList) throws RuntimeException;

    public Double selectDrawingsPrice(Map map) throws RuntimeException;

    public void updateDrawingsUpdateUser(Long id, Long userId) throws RuntimeException;

    public Long insertCompanyReception(CompanyReceptionPO companyReceptionPO) throws RuntimeException;

    public void updateCompanyReception(CompanyReceptionPO companyReceptionPO) throws RuntimeException;

    public List<CompanyReceptionPO> selectCompanyReceptionAll(MySearchList mySearchList) throws RuntimeException;

    public PageInfo<CompanyReceptionPO> selectCompanyReception(MySearchList mySearchList) throws RuntimeException;

    public CompanyReceptionPO selectCompanyReceptionById(Long id) throws RuntimeException;

    public Long installCompanySummary(CompanySummaryPO companySummaryPO) throws RuntimeException;

    public PageInfo<CompanySummaryPO> selectComapnySummary(MySearchList mySearchList) throws RuntimeException;

    public List<CompanySummaryPO> selectCompanySummary(MySearchList mySearchList) throws RuntimeException;

    public Double selectReceptionAllPrice(Map map) throws RuntimeException;

    public Double selectReceptionReceptionPrice(Map map) throws RuntimeException;

    public Integer selectReceptionCount(Map map) throws RuntimeException;

    public Double selectReceptionUserPrice(Map map) throws RuntimeException;


    public Integer selectCompanySummaryUserNumAll(Map map) throws RuntimeException;
    public Integer selectCompanySummaryOrderNumAll(Map map) throws RuntimeException;
    public Double selectCompanySummaryUserpriceAll(Map map) throws RuntimeException;
    public Double selectCompanySummaryOrderPriceAll(Map map) throws RuntimeException;
    public Double selectCompanySummaryAgentPriceAll(Map map) throws RuntimeException;

    public void updateDrawings(DrawingsPO drawingsPO) throws RuntimeException;
}
