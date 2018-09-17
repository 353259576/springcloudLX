package org.ws.java.order.service.impl;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.constants.DataBaseConstant;
import org.ws.java.order.dao.jpa.UserDAO;
import org.ws.java.order.dao.mapper.UserMapper;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.UserService;
import org.ws.java.order.utils.PageConvertUtil;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.math.BigInteger;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService{
    @Autowired
    private UserDAO userDAO;



    @Override
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    @Transactional(rollbackFor = RuntimeException.class)
    public Long insertUser(UserPO userPO){
        userDAO.save(userPO);
        return userPO.getId();
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public PageInfo<UserPO> selectUser(MySearchList mySearchList, PageVO PageVO) {
        PageInfo<UserPO> userPOPageInfo = PageConvertUtil.createPageInfo(userDAO,mySearchList,UserPO.class);
        return userPOPageInfo;
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public UserPO selectUserByUserPhoneAndPassword(String userPhone, String password) throws RuntimeException {
        return userDAO.selectUserByUserPhoneAndPassword(userPhone,password);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public UserPO selectUserById(Long userId) throws RuntimeException {
        return userDAO.findById(userId).orElse(null);
    }

    @Override
    @Transactional(rollbackFor = RuntimeException.class)
    @DataBase(dataBaseName = DynamicDataSource.MASTER)
    public void updateUser(UserPO userPO) throws RuntimeException {
        UserPO userPO1 = userDAO.findById(userPO.getId()).orElse(null);
        if(userPO1 == null){
            throw new RuntimeException("用户不存在");
        }
        BeanUtils.copyProperties(userPO,userPO1);
        userDAO.save(userPO);
    }

    @Override
    @DataBase(dataBaseName = DynamicDataSource.SLAVE)
    public List<UserPO> selectUserByIds(Long[] ids) throws RuntimeException {
        return userDAO.selectUserByIds(ids);
    }
}
