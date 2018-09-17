package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.ws.java.order.model.po.MyLogPO;

public interface MyLogDAO extends JpaRepository<MyLogPO,Long> {
}
