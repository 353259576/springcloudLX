package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.DictPO;

import java.util.List;

public interface DictDAO extends JpaRepository<DictPO,Long> , JpaSpecificationExecutor<DictPO> {


    @Query("select D from DictPO D where D.type = :type and D.status = 1 and D.kind = 2 order by D.orderNo asc ,D.id asc")
    public List<DictPO> selectDictByType(@Param("type") String type) throws RuntimeException;

    @Query("select D from DictPO D where D.code = :code and D.type = :type and D.status = 1 and D.kind = 2 order by D.orderNo asc ,D.id asc ")
    public List<DictPO> selectDictByCodeAndType(@Param("code")String code,@Param("type") String type) throws RuntimeException;

}
