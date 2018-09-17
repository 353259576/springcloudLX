package org.ws.java.order.wsutils.DataBaseHandle;

import org.springframework.data.jpa.repository.JpaRepository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.io.Serializable;

public class JpaService<K extends Serializable,P extends Serializable,D extends JpaRepository<K,P>>{
    private D entityDao;
    @PersistenceContext
    private EntityManager em;


}
