package org.ws.java.order.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.dao.jpa.CompanyAccountDAO;
import org.ws.java.order.dao.jpa.CompanyDAO;
import org.ws.java.order.dao.jpa.CompanyReceptionDAO;
import org.ws.java.order.model.po.CompanyAccountPO;
import org.ws.java.order.model.po.CompanyPO;
import org.ws.java.order.model.po.CompanyReceptionPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.CompanyService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.WsBeanUtis;

import java.util.Date;
import java.util.List;

@Service
public class CompanyServiceImpl implements CompanyService {

    @Autowired
    private CompanyDAO companyDAO;

    @Autowired
    private CompanyAccountDAO companyAccountDAO;

    @Autowired
    private CompanyReceptionDAO companyReceptionDAO;

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertCompany(CompanyPO companyPO) throws RuntimeException {
        companyPO.setCreateDate(new Date());
        companyDAO.save(companyPO);
        return companyPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<CompanyPO> selectCompany(MySearchList mySearchList, PageVO pageVO) throws RuntimeException {
        PageInfo<CompanyPO> companyPOPageInfo = PageConvertUtil.createPageInfo(companyDAO,mySearchList,CompanyPO.class);
        return companyPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public void updateCompany(CompanyPO companyPO) throws RuntimeException {
        CompanyPO companyPO1 = companyDAO.findById(companyPO.getId()).orElse(null);
        if(companyPO1 != null) {
            BeanUtils.copyProperties(companyPO, companyPO1,"createUser","createDate","id");
            companyDAO.save(companyPO1);
        }

    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class,propagation = Propagation.MANDATORY)
    public Long createCompanyAccount(CompanyAccountPO companyAccountPO) throws RuntimeException {
        companyAccountPO.setCompanyBalance(0d);
        companyAccountPO.setCompanyFrozen(0d);
        companyAccountPO.setCompanyHistory(0d);
        companyAccountDAO.save(companyAccountPO);
        return companyAccountPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public CompanyAccountPO selectCompanyAccountByCompanyId(Long companyId) throws RuntimeException {
        if(companyId == null){
            return null;
        }
        return companyAccountDAO.selectCompanyAccountByCompanyId(companyId);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public CompanyPO selectCompanyById(Long companyId) throws RuntimeException {
        return companyDAO.findById(companyId).orElse(null);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CompanyPO> selectCompanyByIds(List<Long> ids) throws RuntimeException {
        return companyDAO.selectCompanyByIds(ids);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CompanyPO> selectCompanyByName(String name) throws RuntimeException {
        return companyDAO.selectCompanyByName(name);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<CompanyPO> selectCompany(MySearchList mySearchList) throws RuntimeException {
        Specification<CompanyPO> specification = JpaDataHandle.getSpecification(mySearchList);
        return companyDAO.findAll(specification);
    }


}
