package org.ws.java.order.wsutils.DataBaseHandle;

import lombok.extern.slf4j.Slf4j;
import org.springframework.data.jpa.domain.Specification;
import org.ws.java.order.wsutils.RestTempLateUtil;
import org.ws.java.order.wsutils.WsBeanUtis;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.persistence.criteria.*;
import java.util.*;

@Slf4j
public class JpaDataHandle {

    public static enum Operator{
        EQ,
        LIKE,
        GT,
        LT,
        GTE,
        LTE,
        IN,
        NIN,
        NOTNULL,
        NULL,
        NE,
        SORT;
        private Operator(){

        }
    }

    public static <T> Specification<T> getSpecification(MySearchList mySearchList){
        Specification<T> specification = new Specification<T>() {
            @Override
            public Predicate toPredicate(Root<T> root, CriteriaQuery<?> criteriaQuery, CriteriaBuilder criteriaBuilder) {
                if(mySearchList == null || mySearchList.isEmpty()){
                    criteriaBuilder.conjunction();
                }else {
                    Iterator<MySearch> mySearchIterator = mySearchList.iterator();
                    List<Predicate> predicates = new ArrayList<>();
                    List<Order> orders = new ArrayList<>();
                    Path path = null;
                    MySearch mySearch = null;
                    while (mySearchIterator.hasNext()) {
                        mySearch = mySearchIterator.next();
                        try {
                            path = root.get(mySearch.getFieldName());
                        }catch (Exception e){
                            e.printStackTrace();
                            log.info(mySearch.getFieldName()+"不存在");
                            continue;
                        }
                        if (path != null) {
                            if (!mySearch.getOperator().equals(Operator.SORT)) {
                                Class clazz = path.getJavaType();
                                if (Date.class.isAssignableFrom(clazz) && !mySearch.getValue().getClass().equals(clazz)) {
                                    mySearch.setValue(WsStringUtils.stringToDate(WsStringUtils.objectDateFormatString(mySearch.getValue())));
                                }
                            }
                            switch (mySearch.getOperator()) {
                                case EQ:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.equal(path, mySearch.getValue()));
                                    break;
                                case LIKE:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.like(path, "%" + mySearch.getValue() + "%"));
                                    break;
                                case GT:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.greaterThan(path, (Comparable) mySearch.getValue()));
                                    break;
                                case LT:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.lessThan(path, (Comparable) mySearch.getValue()));
                                    break;
                                case GTE:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.greaterThanOrEqualTo(path, (Comparable) mySearch.getValue()));
                                    break;
                                case LTE:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.lessThanOrEqualTo(path, (Comparable) mySearch.getValue()));
                                    break;
                                case IN:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    if (mySearch.getValue() instanceof List) {
                                        List list = (List) mySearch.getValue();
                                        if(list.isEmpty()){
                                            break;
                                        }
                                        predicates.add(criteriaBuilder.and(new Predicate[]{path.in(list.toArray())}));
                                    } else if (mySearch.getValue() instanceof Set) {
                                        Set set = (Set) mySearch.getValue();
                                        if(set.isEmpty()){
                                            break;
                                        }
                                        predicates.add(criteriaBuilder.and(new Predicate[]{path.in(set.toArray())}));
                                    } else if (mySearch.getValue().getClass().isArray()) {
                                        if(((Object[])mySearch.getValue()).length == 0 ) {
                                            break;
                                        }
                                        predicates.add(criteriaBuilder.and(new Predicate[]{path.in((Object[]) mySearch.getValue())}));
                                    }
                                    break;
                                case NIN:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    CriteriaBuilder.In in = criteriaBuilder.in(path);
                                    if (mySearch.getValue() instanceof List) {
                                        List list = (List) mySearch.getValue();
                                        if(list.isEmpty()){
                                            break;
                                        }
                                        Iterator iterator = list.iterator();
                                        Object object = null;
                                        Object value = null;
                                        while (iterator.hasNext()) {
                                            object = iterator.next();
                                            value = WsBeanUtis.objectToT(object,path.getJavaType());
                                            if(value != null){
                                                in.value(value);
                                            }

                                        }
                                        predicates.add(criteriaBuilder.not(in));
                                    } else if (mySearch.getValue() instanceof Set) {
                                        Set set = (Set) mySearch.getValue();
                                        if(set.isEmpty()){
                                            break;
                                        }
                                        Iterator iterator = set.iterator();
                                        Object object = null;
                                        Object value = null;
                                        while (iterator.hasNext()) {
                                            object = iterator.next();
                                            value = WsBeanUtis.objectToT(object,path.getJavaType());
                                            if(value != null){
                                                in.value(value);
                                            }
                                        }
                                        predicates.add(criteriaBuilder.not(in));
                                    } else if (mySearch.getValue().getClass().isArray()) {
                                        Object objects[] = (Object[]) mySearch.getValue();
                                        if(objects.length == 0){
                                            break;
                                        }
                                        Object value = null;
                                        for (int i = 0; i < objects.length; i++) {
                                            //in.value(RestTempLateUtil.objectToT(objects[i],path.getJavaType()));
                                            value = WsBeanUtis.objectToT(objects[i],path.getJavaType());
                                            if(value != null){
                                                in.value(value);
                                            }
                                        }
                                        predicates.add(criteriaBuilder.not(in));
                                    }

                                    break;
                                case NULL:
                                    predicates.add(criteriaBuilder.isNull(path));
                                    break;
                                case NOTNULL:
                                    predicates.add(criteriaBuilder.isNotNull(path));
                                    break;
                                case NE:
                                    if(mySearch.getValue() == null){
                                        break;
                                    }
                                    predicates.add(criteriaBuilder.notEqual(path, mySearch.getValue()));
                                    break;
                                case SORT:
                                    if (mySearch.getValue().equals("asc") || mySearch.getValue().equals("ASC")) {
                                        orders.add(criteriaBuilder.asc(path));
                                    } else {
                                        orders.add(criteriaBuilder.desc(path));
                                    }
                                    break;
                            }
                        }
                    }
                    criteriaQuery.orderBy(orders);
                    if(predicates.size() > 0){
                        return criteriaBuilder.and((Predicate[]) predicates.toArray(new Predicate[predicates.size()]));
                    }else {
                        return criteriaBuilder.conjunction();
                    }

                }
                return criteriaBuilder.conjunction();
            }
        };
        return specification;
    }
}
