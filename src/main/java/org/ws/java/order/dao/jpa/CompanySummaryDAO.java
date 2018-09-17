package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.ws.java.order.model.po.CompanySummaryPO;

public interface CompanySummaryDAO extends JpaRepository<CompanySummaryPO,Long>, JpaSpecificationExecutor<CompanySummaryPO> {



}
