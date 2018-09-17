package org.ws.java.order.utils;

import org.springframework.cglib.beans.BeanCopier;
import org.springframework.cglib.core.Converter;

public class CglibBeanCopyUtil {
    public CglibBeanCopyUtil() {
    }

    public static void copyBean(Object srcObj, Object tarObj) {
        BeanCopier copier = BeanCopier.create(srcObj.getClass(), tarObj.getClass(), false);
        copier.copy(srcObj, tarObj, (Converter)null);
    }
}
