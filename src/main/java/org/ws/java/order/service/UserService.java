package org.ws.java.order.service;

import org.springframework.data.repository.query.Param;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

public interface UserService {
    public Long insertUser(UserPO userPO);

    public PageInfo<UserPO> selectUser(MySearchList mySearchList, PageVO pageVO);

    public UserPO selectUserByUserPhoneAndPassword(String userPhone, String password) throws RuntimeException;

    public UserPO selectUserById(Long userId) throws RuntimeException;

    public void updateUser(UserPO userPO) throws RuntimeException;

    public List<UserPO> selectUserByIds(Long ids[]) throws RuntimeException;

}
