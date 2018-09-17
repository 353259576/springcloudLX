package org.ws.java.order.service.impl;

import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.CompanyReceptionDAO;
import org.ws.java.order.dao.jpa.CompanySummaryDAO;
import org.ws.java.order.dao.jpa.DrawingsDAO;
import org.ws.java.order.dao.mapper.CompanyReceptionMapper;
import org.ws.java.order.dao.mapper.CompanySummaryMapper;
import org.ws.java.order.dao.mapper.DrawingsMapper;
import org.ws.java.order.model.po.CompanyReceptionPO;
import org.ws.java.order.model.po.CompanySummaryPO;
import org.ws.java.order.model.po.DrawingsPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.service.DrawingsService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsBeanUtis;

import javax.management.relation.RoleUnresolved;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class DrawingsServiceImpl implements DrawingsService {
    @Autowired
    private DrawingsDAO drawingsDAO;

    @Autowired
    private DrawingsMapper drawingsMapper;

    @Autowired
    private CompanyReceptionDAO companyReceptionDAO;

    @Autowired
    private CompanyReceptionMapper companyReceptionMapper;

    @Autowired
    private CompanySummaryDAO companySummaryDAO;

    @Autowired
    private CompanySummaryMapper companySummaryMapper;




    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertDrawings(DrawingsPO drawingsPO) throws RuntimeException {
        return drawingsDAO.save(drawingsPO).getId();
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateDrawingsStatus(Long id, Integer status) throws RuntimeException {
        drawingsDAO.updateDrawingsStatus(id,status);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<DrawingsPO> selectDrawings(MySearchList mySearchList) throws RuntimeException {
        return PageConvertUtil.createPageInfo(drawingsDAO,mySearchList,DrawingsPO.class);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public DrawingsPO selectDrawingsById(Long drawingsId) throws RuntimeException {
        return drawingsDAO.findById(drawingsId).orElse(null);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectDrawingsPrice(Map map) throws RuntimeException {
        Double price = drawingsMapper.selectDrawingsPrice(map);
        return price==null?0d:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateDrawingsUpdateUser(Long id, Long userId) throws RuntimeException {
        drawingsDAO.updateDrawingsUpdateUser(id,userId,new Date());
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertCompanyReception(CompanyReceptionPO companyReceptionPO) throws RuntimeException {
        return companyReceptionDAO.save(companyReceptionPO).getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateCompanyReception(CompanyReceptionPO companyReceptionPO) throws RuntimeException {
        CompanyReceptionPO companyReceptionPO1 = companyReceptionDAO.findById(companyReceptionPO.getId()).orElse(null);
        if(companyReceptionPO1 == null){
            return;
        }
        WsBeanUtis.copyField(companyReceptionPO,companyReceptionPO1);
        companyReceptionDAO.save(companyReceptionPO1);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CompanyReceptionPO> selectCompanyReceptionAll(MySearchList mySearchList) throws RuntimeException {
        Specification<CompanyReceptionPO> companyReceptionPOSpecification = JpaDataHandle.getSpecification(mySearchList);
        return companyReceptionDAO.findAll(companyReceptionPOSpecification);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<CompanyReceptionPO> selectCompanyReception(MySearchList mySearchList) throws RuntimeException {
        PageInfo<CompanyReceptionPO> companyReceptionPOPageInfo = PageConvertUtil.createPageInfo(companyReceptionDAO,mySearchList,CompanyReceptionPO.class);
        return companyReceptionPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    @Transactional(rollbackFor = RuntimeException.class)
    public CompanyReceptionPO selectCompanyReceptionById(Long id) throws RuntimeException {
        return companyReceptionDAO.findById(id).orElse(null);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<DrawingsPO> selectDrawingsAll(MySearchList mySearchList) throws RuntimeException {
        Specification<DrawingsPO> specification = JpaDataHandle.getSpecification(mySearchList);
        return drawingsDAO.findAll(specification);
    }


    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long installCompanySummary(CompanySummaryPO companySummaryPO) throws RuntimeException {
        return companySummaryDAO.save(companySummaryPO).getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<CompanySummaryPO> selectComapnySummary(MySearchList mySearchList) throws RuntimeException {
        return PageConvertUtil.createPageInfo(companySummaryDAO,mySearchList,CompanySummaryPO.class);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CompanySummaryPO> selectCompanySummary(MySearchList mySearchList) throws RuntimeException {
        Specification<CompanySummaryPO> summaryPOSpecification = JpaDataHandle.getSpecification(mySearchList);
        return companySummaryDAO.findAll(summaryPOSpecification);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectReceptionAllPrice(Map map) throws RuntimeException {
        Double price = companyReceptionMapper.selectReceptionAllPrice(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectReceptionReceptionPrice(Map map) throws RuntimeException {
        Double price = companyReceptionMapper.selectReceptionReceptionPrice(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Integer selectReceptionCount(Map map) throws RuntimeException {
        Integer count = companyReceptionMapper.selectReceptionCount(map);
        return count==null?0:count;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectReceptionUserPrice(Map map) throws RuntimeException {
        Double price = companyReceptionMapper.selectReceptionUserPrice(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Integer selectCompanySummaryUserNumAll(Map map) throws RuntimeException {
        Integer count = companySummaryMapper.selectCompanySummaryUserNumAll(map);
        return count==null?0:count;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Integer selectCompanySummaryOrderNumAll(Map map) throws RuntimeException {
        Integer count = companySummaryMapper.selectCompanySummaryOrderNumAll(map);
        return count==null?0:count;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectCompanySummaryUserpriceAll(Map map) throws RuntimeException {
        Double price = companySummaryMapper.selectCompanySummaryUserpriceAll(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectCompanySummaryOrderPriceAll(Map map) throws RuntimeException {
        Double price = companySummaryMapper.selectCompanySummaryOrderPriceAll(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public Double selectCompanySummaryAgentPriceAll(Map map) throws RuntimeException {
        Double price = companySummaryMapper.selectCompanySummaryAgentPriceAll(map);
        return price==null?0:price;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateDrawings(DrawingsPO drawingsPO) throws RuntimeException {
        drawingsMapper.updateDrawings(drawingsPO);
    }
}
