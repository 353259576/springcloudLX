package org.ws.java.order.dao.jpa;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.UserPO;

import java.math.BigInteger;
import java.util.List;

public interface UserDAO extends JpaRepository<UserPO,Long>,JpaSpecificationExecutor<UserPO> {

    @Query("select U from UserPO U where U.userPhone=:userPhone and U.userPassword = :password")
    public UserPO selectUserByUserPhoneAndPassword(@Param("userPhone")String userPhone,@Param("password")String password);

    @Query("select U from UserPO U where U.id in (:ids)")
    public List<UserPO> selectUserByIds(@Param("ids") Long ids[]);
}
