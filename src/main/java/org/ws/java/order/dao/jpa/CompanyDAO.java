package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.CompanyPO;

import java.util.List;

public interface CompanyDAO extends JpaRepository<CompanyPO,Long>,JpaSpecificationExecutor<CompanyPO> {

    @Query("select C from CompanyPO C where C.id in (:ids)")
    public List<CompanyPO> selectCompanyByIds(@Param("ids") List<Long> ids);

    @Query("select C from CompanyPO C where C.name = :name")
    public List<CompanyPO> selectCompanyByName(@Param("name") String name);
}
