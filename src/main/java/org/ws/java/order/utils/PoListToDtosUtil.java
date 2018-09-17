package org.ws.java.order.utils;

import com.google.common.collect.Lists;
import org.springframework.beans.BeanUtils;
import org.springframework.cglib.core.ReflectUtils;
import org.ws.java.order.utils.CglibBeanCopyUtil;

import java.util.Iterator;
import java.util.List;

public class PoListToDtosUtil {
    public PoListToDtosUtil() {
    }

    public static <T, E> List<E> convertPo(List<T> srcobjs, Class<E> target) {
        if (srcobjs != null && srcobjs.size() > 0) {
            List<E> targetList = Lists.newArrayList();
            Iterator var3 = srcobjs.iterator();

            while(var3.hasNext()) {
                T object = (T)var3.next();
                Object targetDto = ReflectUtils.newInstance(target);
                CglibBeanCopyUtil.copyBean(object, targetDto);
                targetList.add((E)targetDto);
            }

            return targetList;
        } else {
            return Lists.newArrayList();
        }
    }

    public static <T, E> List<E> convertPo(List<T> srcobjs, Class<E> target, String... ingnorProperties) {
        if (srcobjs != null && srcobjs.size() > 0) {
            List<E> targetList = Lists.newArrayList();
            Iterator var4 = srcobjs.iterator();

            while(var4.hasNext()) {
                T object = (T)var4.next();
                Object targetDto = ReflectUtils.newInstance(target);
                BeanUtils.copyProperties(object, targetDto, ingnorProperties);
                targetList.add((E)targetDto);
            }

            return targetList;
        } else {
            return Lists.newArrayList();
        }
    }
}