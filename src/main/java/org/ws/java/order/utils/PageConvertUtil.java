package org.ws.java.order.utils;

import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.cglib.core.ReflectUtils;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;

import java.util.List;



public class PageConvertUtil {


    public static <T,K extends JpaSpecificationExecutor> PageInfo<T> createPageInfo(K jpaSpecificationExecutor, MySearchList mySearchList,Class<T> tClass){
        Specification<T> specification = JpaDataHandle.<T>getSpecification(mySearchList);
        PageVO pageVO = mySearchList.getPageVO();
        if(pageVO == null){
            pageVO = new PageVO();
        }
        Pageable pageable = PageRequest.of(pageVO.getPage()-1,pageVO.getRows());
        Page<T> tPage = jpaSpecificationExecutor.findAll(specification,pageable);
        if(tPage == null){
            return null;
        }
        PageInfo<T> pageInfo = new PageInfo<>();
        pageInfo.setDataList(tPage.getContent());
        pageInfo.setTotalRows(tPage.getTotalElements());
        pageInfo.setTotalPage(tPage.getTotalPages());
        pageInfo.setPage(pageVO.getPage());
        pageInfo.setRows(pageVO.getRows());
        return pageInfo;

    }


    public static <T, E> PageInfo<E> convertPage(PageInfo<T> pageInfo, Class<E> tClass) {
        if (pageInfo == null) {
            return null;
        } else {
            PageInfo<E> convertPage = new PageInfo<E>();
            convertPage.setTotalRows(pageInfo.getTotalRows());
            convertPage.setTotalPage(pageInfo.getTotalPage());
            List<E> convertPos = convertPo(pageInfo.getDataList(), tClass);
            convertPage.setDataList(convertPos);
            convertPage.setPage(pageInfo.getPage());
            convertPage.setRows(pageInfo.getRows());
            return convertPage;

        }
    }

    public static <T, E> PageInfo<E> convertEmptyDataPage(PageInfo<T> pageInfo, Class<E> tClass) {
        if (pageInfo == null) {
            return null;
        } else {
            PageInfo<E> convertPage = new PageInfo<E>();
            convertPage.setTotalRows(pageInfo.getTotalRows());
            convertPage.setTotalPage(pageInfo.getTotalPage());
            convertPage.setPage(pageInfo.getPage());
            convertPage.setRows(pageInfo.getRows());
            return convertPage;

        }
    }


    private static <T, E> List<E> convertPo(List<T> srcobjs, Class<E> target) {
        if (srcobjs == null || srcobjs.size() <= 0) {
            return null;
        }
        List<E> targetList = Lists.newArrayList();
        for (T object : srcobjs) {
            Object targetDto = ReflectUtils.newInstance(target);
            BeanUtils.copyProperties(object, targetDto);
            targetList.add((E) targetDto);
        }
        return targetList;
    }

    public static <T, E> List<E> convertPo(List<T> srcobjs, Class<E> target, String... ingnorProperties) {
        if (srcobjs == null || srcobjs.size() <= 0) {
            return null;
        }
        List<E> targetList = Lists.newArrayList();
        for (T object : srcobjs) {
            Object targetDto = ReflectUtils.newInstance(target);
            BeanUtils.copyProperties(object, targetDto, ingnorProperties);
            targetList.add((E) targetDto);
        }
        return targetList;
    }
}
