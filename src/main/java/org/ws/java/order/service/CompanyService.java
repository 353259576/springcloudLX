package org.ws.java.order.service;

import org.ws.java.order.model.po.CompanyAccountPO;
import org.ws.java.order.model.po.CompanyPO;
import org.ws.java.order.model.po.CompanyReceptionPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.wsutils.DataBaseHandle.MySearch;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.List;

public interface CompanyService {
    public Long insertCompany(CompanyPO companyPO) throws RuntimeException;

    public PageInfo<CompanyPO> selectCompany(MySearchList mySearchList, PageVO pageVO) throws RuntimeException;

    public void updateCompany(CompanyPO companyPO) throws RuntimeException;

    public Long createCompanyAccount(CompanyAccountPO companyAccountPO) throws RuntimeException;

    public CompanyAccountPO selectCompanyAccountByCompanyId(Long companyId) throws RuntimeException;

    public CompanyPO selectCompanyById(Long companyId) throws RuntimeException;

    public List<CompanyPO> selectCompanyByIds(List<Long> ids) throws RuntimeException;

    public List<CompanyPO> selectCompanyByName(String name) throws RuntimeException;

    public List<CompanyPO> selectCompany(MySearchList mySearchList) throws RuntimeException;


}
