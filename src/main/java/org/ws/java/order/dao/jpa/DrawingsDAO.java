package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.DrawingsPO;

import java.util.Date;

public interface DrawingsDAO extends JpaRepository<DrawingsPO,Long>, JpaSpecificationExecutor<DrawingsPO> {


    @Modifying
    @Query("update DrawingsPO D set D.drawStatus = :status where D.id = :id")
    public void updateDrawingsStatus(@Param("id") Long id,@Param("status") Integer status);

    @Modifying
    @Query("update DrawingsPO D set D.drawUpdateUser = :userId,D.drawUpdateDate = :updateDate where D.id = :id")
    public void updateDrawingsUpdateUser(@Param("id") Long id, @Param("userId") Long userId, @Param("updateDate") Date updateDate);
    
}
