package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.CityPO;

import java.math.BigInteger;
import java.util.List;

public interface CityDAO extends JpaRepository<CityPO,Long>,JpaSpecificationExecutor<CityPO> {


    @Query("select C from CityPO C where C.name like concat('%',:cityName,'%')  and deep = :deep")
    public List<CityPO> selectCityByName(@Param("cityName")String cityName,@Param("deep") Integer deep);

    @Query("select C from CityPO C where deep = :deep")
    public List<CityPO> selectCityByDeep(@Param("deep") Integer deep);


    @Query("select C from CityPO C where C.parentId = :pid  and deep = :deep")
    public List<CityPO> selectCityByPid(@Param("pid")Long pid,@Param("deep") Integer deep);
}
