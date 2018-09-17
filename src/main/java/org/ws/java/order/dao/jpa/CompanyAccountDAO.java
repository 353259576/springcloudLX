package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.CompanyAccountPO;
import org.ws.java.order.model.po.CompanyPO;

import java.util.List;

public interface CompanyAccountDAO extends JpaRepository<CompanyAccountPO,Long>,JpaSpecificationExecutor<CompanyAccountPO> {

    @Query("select C from CompanyAccountPO C where C.companyId = :companyId")
    public CompanyAccountPO selectCompanyAccountByCompanyId(@Param("companyId")Long companyId);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyBalance = C.companyBalance + :balance where C.companyId = :companyId")
    public void addBalance(@Param("companyId")Long companyId,@Param("balance")Double balance);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyBalance = C.companyBalance - :balance where C.companyId = :companyId")
    public void minusBalance(@Param("companyId")Long companyId,@Param("balance")Double balance);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyFrozen = C.companyFrozen + :frozen where C.companyId = :companyId")
    public void addFrozen(@Param("companyId")Long companyId,@Param("frozen")Double frozen);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyFrozen = C.companyFrozen - :frozen where C.companyId = :companyId")
    public void minusFrozen(@Param("companyId")Long companyId,@Param("frozen")Double frozen);


    @Modifying
    @Query("update CompanyAccountPO C set C.companyHistory = C.companyHistory + :history where C.companyId = :companyId")
    public void addHistory(@Param("companyId")Long companyId,@Param("history")Double history);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyHistory = C.companyHistory - :history where C.companyId = :companyId")
    public void minusHistory(@Param("companyId")Long companyId,@Param("history")Double history);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyBalance = :balance where C.companyId = :companyId")
    public void changeBalance(@Param("companyId")Long companyId,@Param("balance")Double balance);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyFrozen = :frozen where C.companyId = :companyId")
    public void changeFrozen(@Param("companyId")Long companyId,@Param("frozen")Double frozen);

    @Modifying
    @Query("update CompanyAccountPO C set C.companyHistory = :history where C.companyId = :companyId")
    public void changeHistory(@Param("companyId")Long companyId,@Param("history")Double history);


}
