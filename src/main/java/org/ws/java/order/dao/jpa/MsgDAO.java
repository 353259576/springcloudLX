package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.ws.java.order.model.po.MsgPO;

public interface MsgDAO extends JpaRepository<MsgPO,Long>, JpaSpecificationExecutor<MsgPO> {
}
