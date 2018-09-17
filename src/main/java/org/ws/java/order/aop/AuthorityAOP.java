package org.ws.java.order.aop;



import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.DataBase;
import org.ws.java.order.config.DynamicDataSource;
import org.ws.java.order.config.DynamicDataSourceHolder;
import org.ws.java.order.constants.AjaxFlag;
import org.ws.java.order.constants.AllStatusConstants;
import org.ws.java.order.constants.RoleEnum;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.model.po.RoleMenuBindPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.model.po.UserPO;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.RoleService;
import org.ws.java.order.service.UserRoleService;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearch;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.RestTempLateUtil;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.lang.reflect.Field;
import java.lang.reflect.Type;
import java.util.*;

@Component
@Aspect
@Slf4j
public class AuthorityAOP {
    @Resource
    private RoleService roleService;





    @Around("@annotation(authority)")
    public Object checkAuth(ProceedingJoinPoint proceedingJoinPoint,Authority authority) throws Throwable{
        Long startTime = System.currentTimeMillis();
        try {
            Signature signature = proceedingJoinPoint.getSignature();
            System.out.println(signature.getDeclaringTypeName());
            System.out.println(signature.getName());
            MethodSignature methodSignature = (MethodSignature)proceedingJoinPoint.getSignature();
            HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
            HttpServletResponse response = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getResponse();
            String path = request.getServletPath();
            if (StringUtils.isEmpty(path)) {
                response.setStatus(403);
                return AjaxVO.returnNoAccessMsg("请求地址为空");
            }
            HttpSession session = request.getSession();
            UserPO userPO = (UserPO) session.getAttribute(SystemConstants.USER);
            if(userPO == null){
                response.setStatus(401);
                return AjaxVO.returnUnLoginMsg("未登录");
            }
            Object objects[] = proceedingJoinPoint.getArgs();
            Class<?> par[] = methodSignature.getParameterTypes();
            String names[] = methodSignature.getParameterNames();
            if(!authority.onlyLogin()) {
                UserRoleDTO userRoleDTO = UserRoleService.getUserRole(userPO.getId());
                if (userRoleDTO == null || userRoleDTO.getTopRolePOS() == null || userRoleDTO.getTopRolePOS().size() == 0) {
                    response.setStatus(403);
                    return AjaxVO.returnNoAccessMsg("权限不足");
                }
                if (userRoleDTO.getAdminMenu(path) == null) {
                    if (authority.onlyAllowAdmin()) {
                        response.setStatus(403);
                        return AjaxVO.returnNoAccessMsg("当前权限只能管理员使用");
                    }
                    MenuPO menuPO = userRoleDTO.getGeneralMenu(path);
                    if (menuPO == null) {
                        response.setStatus(403);
                        return AjaxVO.returnNoAccessMsg("权限不足");
                    } else {
                        List<Long> companyIds = userRoleDTO.getGeneralCompanyId(menuPO.getId());
                        if (companyIds == null || companyIds.size() == 0) {
                            response.setStatus(403);
                            return AjaxVO.returnNoAccessMsg("该权限并未绑定任何商家");
                        }
                        String companyPath = authority.companyName();
                        if (StringUtils.isEmpty(companyPath)) {
                            //response.setStatus(403);
                            //return AjaxVO.returnNoAccessMsg("权限不足");
                        } else {
                            String companyPaths[] = companyPath.split("[.]");
                            if (companyPaths.length == 1) {
                                int k = thisIsInArray(companyPaths[0], names);
                                if (k > -1) {
                                    String value = WsStringUtils.anyToString(objects[k]);
                                    if (value == null) {
                                        if (authority.auto()) {
                                            //List<Long> companyIds = userRoleDTO.getGeneralCompanyId(Long.valueOf(value));

                                            if (companyIds == null || companyIds.isEmpty()) {
                                                response.setStatus(403);
                                                return AjaxVO.returnNoAccessMsg("当前用户没有权限");
                                            }
                                            Class clazz = par[k];
                                            if (WsStringUtils.classCompare(clazz, String.class)) {
                                                objects[k] = companyIds.get(0).toString();
                                            } else if (WsStringUtils.classCompare(clazz, Long.class)) {
                                                objects[k] = companyIds.get(0);
                                            }

                                        } else {
                                            response.setStatus(403);
                                            return AjaxVO.returnNoAccessMsg("权限不足");
                                        }
                                    } else {
                                        //List<Long> companyIds = userRoleDTO.getGeneralCompanyId(Long.valueOf(value));
                                        if (companyIds == null || companyIds.size() == 0) {
                                            response.setStatus(403);
                                            return AjaxVO.returnNoAccessMsg("没有权限");
                                        }
                                        if (!companyIds.contains(Long.valueOf(value))) {
                                            if (authority.auto()) {
                                                Class clazz = par[k];
                                                if (WsStringUtils.classCompare(clazz, String.class)) {
                                                    objects[k] = companyIds.get(0).toString();
                                                } else if (WsStringUtils.classCompare(clazz, Long.class)) {
                                                    objects[k] = companyIds.get(0);
                                                }
                                            } else {
                                                response.setStatus(403);
                                                return AjaxVO.returnNoAccessMsg("权限不足");
                                            }
                                        }

                                    }
                                } else {
                                    response.setStatus(403);
                                    return AjaxVO.returnNoAccessMsg("当前参数不存在");
                                }
                            } else {
                                //当数据为复杂数据时的处理
                                int k = thisIsInArray(companyPaths[0], names);
                                if (k > -1) {
                                    Object valueObject = objects[k];
                                    Class valueClass = par[k];
                                    if (valueObject == null) {
                                        if (authority.auto()) {
                                            Class objectClass = par[k];
                                            if (WsStringUtils.classCompare(objectClass, MySearchList.class)) {
                                                MySearchList mySearchList = new MySearchList();
                                                MySearch mySearch = null;
                                                if(authority.isArray()){
                                                    mySearch = new MySearch(companyPaths[1], JpaDataHandle.Operator.IN, companyIds);
                                                }else {
                                                    mySearch = new MySearch(companyPaths[1], JpaDataHandle.Operator.EQ, companyIds.get(0));
                                                }

                                                mySearchList.add(mySearch);
                                                mySearchList.setPageVO(new PageVO());
                                                objects[k] = mySearchList;

                                            } else if (WsStringUtils.classCompare(objectClass, Map.class)) {
                                                Map map = new HashMap();
                                                Type[] types = objectClass.getGenericInterfaces();
                                                if (types != null && types.length == 2) {
                                                    if (types[1].getTypeName().equals(String.class.getTypeName())) {
                                                        map.put(companyPaths[1], companyIds.get(0).toString());
                                                    } else if (types[1].getTypeName().equals(Integer.class.getTypeName())) {
                                                        map.put(companyPaths[1], companyIds.get(0).intValue());
                                                    } else if (types[1].getTypeName().equals(int.class.getTypeName())) {
                                                        map.put(companyPaths[1], companyIds.get(0).intValue());
                                                    } else if (types[1].getTypeName().equals(Long.class.getTypeName())) {
                                                        map.put(companyPaths[1], companyIds.get(0));
                                                    } else if (types[1].getTypeName().equals(long.class.getTypeName())) {
                                                        map.put(companyPaths[1], companyIds.get(0));
                                                    } else {
                                                        map.put(companyPaths[1], companyIds.get(0).toString());
                                                    }
                                                }

                                            } else {
                                                Object newObject = objectClass.newInstance();
                                                Field field = objectClass.getDeclaredField(companyPaths[1]);
                                                field.setAccessible(true);
                                                if (field == null) {
                                                    response.setStatus(403);
                                                    return AjaxVO.returnNoAccessMsg("参数不存在");
                                                }
                                                if (field.getType().getTypeName().equals(String.class.getTypeName())) {
                                                    field.set(newObject, companyIds.get(0).toString());
                                                } else if (field.getType().getTypeName().equals(int.class.getTypeName())) {
                                                    field.set(newObject, companyIds.get(0).intValue());
                                                } else if (field.getType().getTypeName().equals(Integer.class.getTypeName())) {
                                                    field.set(newObject, companyIds.get(0).intValue());
                                                } else if (field.getType().getTypeName().equals(long.class.getTypeName())) {
                                                    field.set(newObject, companyIds.get(0).longValue());
                                                } else if (field.getType().getTypeName().equals(Long.class.getTypeName())) {
                                                    field.set(newObject, companyIds.get(0));
                                                } else if (field.getType().getTypeName().equals(Long[].class.getTypeName())) {
                                                    Long[] longs = new Long[]{companyIds.get(0)};
                                                    field.set(newObject, longs);
                                                } else if (field.getType().getTypeName().equals(long[].class.getTypeName())) {
                                                    long[] longs = new long[]{companyIds.get(0)};
                                                    field.set(newObject, longs);
                                                } else if (field.getType().getTypeName().equals(String[].class.getTypeName())) {
                                                    String[] strings = new String[]{companyIds.get(0).toString()};
                                                    field.set(newObject, strings);
                                                } else if (field.getType().getTypeName().equals(Integer[].class.getTypeName())) {
                                                    Integer[] integers = new Integer[]{companyIds.get(0).intValue()};
                                                    field.set(newObject, integers);
                                                } else if (field.getType().getTypeName().equals(int[].class.getTypeName())) {
                                                    int[] ints = new int[]{companyIds.get(0).intValue()};
                                                    field.set(newObject, ints);
                                                } else if (field.getType().getTypeName().equals(List.class.getTypeName())) {
                                                    String fieldName = field.getGenericType().getTypeName();
                                                    int begin = fieldName.indexOf("<") + 1;
                                                    int end = fieldName.lastIndexOf(">");
                                                    if (!(begin == -1 || end == -1)) {
                                                        String fieldGeneric = fieldName.substring(begin, end);
                                                        if (fieldGeneric.contains("String")) {
                                                            List list = new ArrayList();
                                                            field.set(newObject, list);
                                                            list.add(companyIds.get(0).toString());
                                                        } else if (fieldGeneric.contains("Integer")) {
                                                            List list = new ArrayList();
                                                            list.add(companyIds.get(0).intValue());
                                                            field.set(newObject, list);
                                                        } else if (fieldGeneric.contains("Long")) {
                                                            List list = new ArrayList();
                                                            list.add(companyIds.get(0).longValue());
                                                            field.set(newObject, list);
                                                        } else {
                                                            List list = new ArrayList();
                                                            field.set(newObject, list);
                                                            list.add(companyIds.get(0).toString());
                                                        }
                                                    } else {
                                                        List list = new ArrayList();
                                                        field.set(newObject, list);
                                                        list.add(companyIds.get(0).toString());
                                                    }

                                                } else {
                                                    response.setStatus(403);
                                                    return AjaxVO.returnNoAccessMsg("不能识别的参数");
                                                }
                                                objects[k] = newObject;
                                            }

                                        } else {
                                            response.setStatus(403);
                                            return AjaxVO.returnNoAccessMsg("数据为空");
                                        }
                                    } else {


                                        if (WsStringUtils.classCompare(valueClass, MySearchList.class)) {
                                            MySearchList mySearchList = (MySearchList) valueObject;
                                            MySearch mySearch = mySearchList.get(companyPaths[1]);
                                            if (mySearch == null) {
                                                if (authority.auto()) {
                                                    if(authority.isArray()){
                                                        mySearch = new MySearch(companyPaths[1], JpaDataHandle.Operator.IN, companyIds);
                                                    }else {
                                                        mySearch = new MySearch(companyPaths[1], JpaDataHandle.Operator.EQ, companyIds.get(0));
                                                    }

                                                    mySearchList.add(mySearch);
                                                } else {
                                                    response.setStatus(403);
                                                    return AjaxVO.returnNoAccessMsg("参数为空");
                                                }

                                            } else {
                                                Object value = mySearch.getValue();
                                                if (value.getClass().isArray()) {
                                                    Object[] objectArray = (Object[]) value;
                                                    List<String> list = new ArrayList<>();
                                                    String key;
                                                    for (int i = 0; i < objectArray.length; i++) {
                                                        key = WsStringUtils.anyToString(objectArray[i]);
                                                        if (key != null) {
                                                            if (companyIds.contains(Long.valueOf(key))) {
                                                                list.add(key);
                                                            }
                                                        }
                                                    }
                                                    if (list.isEmpty()) {
                                                        if (authority.auto()) {
                                                            if (mySearch.getOperator().equals(JpaDataHandle.Operator.IN)) {
                                                                for (int i = 0; i < companyIds.size(); i++) {
                                                                    list.add(companyIds.get(i).toString());
                                                                }
                                                            } else {
                                                                list.add(companyIds.get(0).toString());
                                                            }

                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数错误");
                                                        }

                                                    }
                                                    mySearch.setValue(list.toArray());

                                                } else if (value instanceof List) {
                                                    List list = (List) value;
                                                    List<String> stringList = new ArrayList<>();
                                                    for (int i = 0; i < list.size(); i++) {
                                                        String key = WsStringUtils.anyToString(list.get(i));
                                                        if (key != null && companyIds.contains(Long.valueOf(key))) {
                                                            stringList.add(key);
                                                        }
                                                    }
                                                    if (stringList.isEmpty()) {
                                                        if (authority.auto()) {
                                                            if (mySearch.getOperator().equals(JpaDataHandle.Operator.IN)) {
                                                                for (int i = 0; i < companyIds.size(); i++) {
                                                                    stringList.add(companyIds.get(i).toString());
                                                                }
                                                            } else {
                                                                stringList.add(companyIds.get(0).toString());
                                                            }


                                                            //stringList.add(companyIds.get(0).toString());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数错误");
                                                        }

                                                    }
                                                    mySearch.setValue(stringList);
                                                } else {
                                                    String key = WsStringUtils.anyToString(value);
                                                    if (key == null) {
                                                        if (authority.auto()) {
                                                            mySearch.setValue(companyIds.get(0).toString());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }
                                                    } else {
                                                        if (companyIds.contains(Long.valueOf(key))) {
                                                            mySearch.setValue(key);
                                                        } else {
                                                            if (authority.auto()) {
                                                                mySearch.setValue(companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }

                                                        }
                                                    }
                                                }
                                            }

                                        } else if (WsStringUtils.classCompare(valueClass, Map.class)) {
                                            Map map = (Map) valueObject;
                                            Object value = map.get(companyPaths[1]);
                                            Class objectClass = par[k];
                                            Type[] types = objectClass.getGenericInterfaces();
                                            if (types != null && types.length == 2) {
                                                if (types[1].getTypeName().equals(String.class.getTypeName())) {
                                                    if (value == null) {
                                                        if (authority.auto()) {
                                                            map.put(companyPaths[1], companyIds.get(0).toString());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }

                                                    } else {
                                                        if (!companyIds.contains(Long.valueOf(String.valueOf(value)))) {
                                                            if (authority.auto()) {
                                                                map.put(companyPaths[1], companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数为空");
                                                            }
                                                        }
                                                    }

                                                } else if (types[1].getTypeName().equals(Integer.class.getTypeName())) {
                                                    if (value == null) {
                                                        if (authority.auto()) {
                                                            map.put(companyPaths[1], companyIds.get(0).intValue());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }

                                                    } else {
                                                        if (!companyIds.contains(Long.valueOf(String.valueOf(value)))) {
                                                            if (authority.auto()) {
                                                                map.put(companyPaths[1], companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数为空");
                                                            }
                                                        }
                                                    }

                                                } else if (types[1].getTypeName().equals(int.class.getTypeName())) {
                                                    if (value == null) {
                                                        if (authority.auto()) {
                                                            map.put(companyPaths[1], companyIds.get(0).intValue());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }

                                                    } else {
                                                        if (!companyIds.contains(Long.valueOf(String.valueOf(value)))) {
                                                            if (authority.auto()) {
                                                                map.put(companyPaths[1], companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数为空");
                                                            }
                                                        }
                                                    }

                                                } else if (types[1].getTypeName().equals(Long.class.getTypeName())) {
                                                    if (value == null) {
                                                        if (authority.auto()) {
                                                            map.put(companyPaths[1], companyIds.get(0).longValue());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }

                                                    } else {
                                                        if (!companyIds.contains(Long.valueOf(String.valueOf(value)))) {
                                                            if (authority.auto()) {
                                                                map.put(companyPaths[1], companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数为空");
                                                            }
                                                        }
                                                    }

                                                } else if (types[1].getTypeName().equals(long.class.getTypeName())) {
                                                    if (value == null) {
                                                        if (authority.auto()) {
                                                            map.put(companyPaths[1], companyIds.get(0).longValue());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数为空");
                                                        }

                                                    } else {
                                                        if (!companyIds.contains(Long.valueOf(String.valueOf(value)))) {
                                                            if (authority.auto()) {
                                                                map.put(companyPaths[1], companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数为空");
                                                            }
                                                        }
                                                    }

                                                } else {
                                                    response.setStatus(403);
                                                    return AjaxVO.returnNoAccessMsg("无法识别参数");
                                                }
                                            }

                                        } else {
                                            Field field = valueClass.getDeclaredField(companyPaths[1]);
                                            field.setAccessible(true);
                                            if (field == null) {
                                                response.setStatus(403);
                                                return AjaxVO.returnNoAccessMsg("参数不存在");
                                            }
                                            if (field.getType().getTypeName().equals(String.class.getTypeName())) {
                                                String value = (String) field.get(valueObject);
                                                if (!companyIds.contains(Long.valueOf(value))) {
                                                    if (authority.auto()) {
                                                        field.set(valueObject, companyIds.get(0).toString());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }

                                            } else if (field.getType().getTypeName().equals(int.class.getTypeName())) {
                                                int value = (int) field.get(valueObject);
                                                if (!companyIds.contains(Long.valueOf(value))) {
                                                    if (authority.auto()) {
                                                        field.set(valueObject, companyIds.get(0).intValue());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }

                                            } else if (field.getType().getTypeName().equals(Integer.class.getTypeName())) {
                                                Integer value = (Integer) field.get(valueObject);
                                                if (!companyIds.contains(Long.valueOf(value))) {
                                                    if (authority.auto()) {
                                                        field.set(valueObject, companyIds.get(0).intValue());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }

                                            } else if (field.getType().getTypeName().equals(long.class.getTypeName())) {
                                                long value = (long) field.get(valueObject);
                                                if (!companyIds.contains(value)) {
                                                    if (authority.auto()) {
                                                        field.set(valueObject, companyIds.get(0).longValue());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }

                                            } else if (field.getType().getTypeName().equals(Long.class.getTypeName())) {
                                                Long value = (Long) field.get(valueObject);
                                                if (!companyIds.contains(value)) {
                                                    if (authority.auto()) {
                                                        field.set(valueObject, companyIds.get(0));
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                            } else if (field.getType().getTypeName().equals(Long[].class.getTypeName())) {
                                                Long[] longs = (Long[]) field.get(valueObject);
                                                List<Long> longList = new ArrayList<>();
                                                for (int i = 0; i < longs.length; i++) {
                                                    if (companyIds.contains(longs[i])) {
                                                        longList.add(longs[i]);
                                                    }
                                                }
                                                if (longList.isEmpty()) {
                                                    if (authority.auto()) {
                                                        longList.add(companyIds.get(0));
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                                field.set(valueObject, longList.toArray(new Long[longList.size()]));
                                            } else if (field.getType().getTypeName().equals(long[].class.getTypeName())) {
                                                long[] longs = (long[]) field.get(valueObject);
                                                List<Long> longList = new ArrayList<>();
                                                for (int i = 0; i < longs.length; i++) {
                                                    if (companyIds.contains(longs[i])) {
                                                        longList.add(longs[i]);
                                                    }
                                                }
                                                if (longList.isEmpty()) {
                                                    if (authority.auto()) {
                                                        longList.add(companyIds.get(0));
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                                longs = new long[longList.size()];
                                                for (int i = 0; i < longList.size(); i++) {
                                                    longs[i] = longList.get(i).longValue();
                                                }
                                                field.set(valueObject, longs);
                                            } else if (field.getType().getTypeName().equals(String[].class.getTypeName())) {
                                                String[] strings = (String[]) field.get(valueObject);
                                                List<String> stringList = new ArrayList<>();
                                                for (int i = 0; i < strings.length; i++) {
                                                    if (companyIds.contains(Long.valueOf(strings[i]))) {
                                                        stringList.add(strings[i]);
                                                    }
                                                }
                                                if (stringList.isEmpty()) {
                                                    if (authority.auto()) {
                                                        stringList.add(companyIds.get(0).toString());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                                field.set(valueObject, stringList.toArray(new String[stringList.size()]));
                                            } else if (field.getType().getTypeName().equals(Integer[].class.getTypeName())) {
                                                Integer[] integers = (Integer[]) field.get(valueObject);
                                                List<Integer> integerList = new ArrayList<>();
                                                for (int i = 0; i < integers.length; i++) {
                                                    if (companyIds.contains(Long.valueOf(integers[i]))) {
                                                        integerList.add(integers[i]);
                                                    }
                                                }
                                                if (integerList.isEmpty()) {
                                                    if (authority.auto()) {
                                                        integerList.add(companyIds.get(0).intValue());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                                field.set(valueObject, integerList.toArray(new Integer[integerList.size()]));
                                            } else if (field.getType().getTypeName().equals(int[].class.getTypeName())) {
                                                int[] ints = (int[]) field.get(valueObject);
                                                List<Integer> integerList = new ArrayList<>();
                                                for (int i = 0; i < ints.length; i++) {
                                                    if (companyIds.contains(Long.valueOf(ints[i]))) {
                                                        integerList.add(ints[i]);
                                                    }
                                                }
                                                if (integerList.isEmpty()) {
                                                    if (authority.auto()) {
                                                        integerList.add(companyIds.get(0).intValue());
                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("参数错误");
                                                    }
                                                }
                                                ints = new int[integerList.size()];
                                                for (int i = 0; i < integerList.size(); i++) {
                                                    ints[i] = integerList.get(i).intValue();
                                                }
                                                field.set(valueObject, ints);
                                            } else if (field.getType().getTypeName().equals(List.class.getTypeName())) {
                                                String fieldName = field.getGenericType().getTypeName();
                                                int begin = fieldName.indexOf("<") + 1;
                                                int end = fieldName.lastIndexOf(">");
                                                List list = (List) field.get(valueObject);
                                                if (!(begin == 0 || end == -1)) {
                                                    String fieldGeneric = fieldName.substring(begin, end);

                                                    if (fieldGeneric.contains("String")) {
                                                        if (list == null || list.size() == 0) {
                                                            if (authority.auto()) {
                                                                list = new ArrayList();
                                                                list.add(companyIds.get(0).toString());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }
                                                        } else {
                                                            for (int i = 0; i < list.size(); i++) {
                                                                if (!companyIds.contains(Long.valueOf(Long.parseLong(String.valueOf(list.get(i)))))) {
                                                                    list.remove(i);
                                                                    i--;
                                                                }
                                                            }
                                                        }
                                                    } else if (fieldGeneric.contains("Integer")) {
                                                        if (list == null || list.size() == 0) {
                                                            if (authority.auto()) {
                                                                list = new ArrayList();
                                                                list.add(companyIds.get(0).intValue());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }
                                                        } else {
                                                            for (int i = 0; i < list.size(); i++) {
                                                                if (!companyIds.contains(Long.parseLong(String.valueOf(list.get(i))))) {
                                                                    list.remove(i);
                                                                    i--;
                                                                }
                                                            }
                                                        }

                                                    } else if (fieldGeneric.contains("int")) {
                                                        if (list == null || list.size() == 0) {
                                                            if (authority.auto()) {
                                                                list = new ArrayList();
                                                                list.add(companyIds.get(0).intValue());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }
                                                        } else {
                                                            for (int i = 0; i < list.size(); i++) {
                                                                if (!companyIds.contains(Long.parseLong(String.valueOf(list.get(i))))) {
                                                                    list.remove(i);
                                                                    i--;
                                                                }
                                                            }
                                                        }

                                                    } else if (fieldGeneric.contains("Long")) {
                                                        if (list == null || list.size() == 0) {
                                                            if (authority.auto()) {
                                                                list = new ArrayList();
                                                                list.add(companyIds.get(0).longValue());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }
                                                        } else {
                                                            for (int i = 0; i < list.size(); i++) {
                                                                if (!companyIds.contains(Long.parseLong(String.valueOf(list.get(i))))) {
                                                                    list.remove(i);
                                                                    i--;
                                                                }
                                                            }
                                                        }

                                                    } else if (fieldGeneric.contains("long")) {
                                                        if (list == null || list.size() == 0) {
                                                            if (authority.auto()) {
                                                                list = new ArrayList();
                                                                list.add(companyIds.get(0).longValue());
                                                            } else {
                                                                response.setStatus(403);
                                                                return AjaxVO.returnNoAccessMsg("参数错误");
                                                            }
                                                        } else {
                                                            for (int i = 0; i < list.size(); i++) {
                                                                if (!companyIds.contains(Long.parseLong(String.valueOf(list.get(i))))) {
                                                                    list.remove(i);
                                                                    i--;
                                                                }
                                                            }
                                                        }

                                                    } else {
                                                        response.setStatus(403);
                                                        return AjaxVO.returnNoAccessMsg("未能识别的参数");
                                                    }
                                                } else {
                                                    if (list == null || list.size() == 0) {
                                                        if (authority.auto()) {
                                                            list = new ArrayList();
                                                            list.add(companyIds.get(0).toString());
                                                        } else {
                                                            response.setStatus(403);
                                                            return AjaxVO.returnNoAccessMsg("参数错误");
                                                        }
                                                    } else {
                                                        for (int i = 0; i < list.size(); i++) {
                                                            if (!companyIds.contains(Long.parseLong(String.valueOf(list.get(i))))) {
                                                                list.remove(i);
                                                                i--;
                                                            }
                                                        }
                                                    }
                                                }

                                                field.set(valueObject, list);
                                            } else {
                                                response.setStatus(403);
                                                return AjaxVO.returnNoAccessMsg("不能识别的参数");
                                            }

                                        }


                                    }

                                } else {
                                    response.setStatus(403);
                                    return AjaxVO.returnNoAccessMsg("参数不存在");
                                }


                            }
                        }
                    }
                }
            }
            log.info(JSON.toJSONString(objects));
            log.info("权限验证完成");
            Object object = proceedingJoinPoint.proceed(objects);
            return object;
        }catch (Exception e){
            e.printStackTrace();
            return AjaxVO.returnNoAccessMsg("权限处理失败");
        }finally {
            Long endTime = System.currentTimeMillis();
            log.info("请求处理完毕！处理时间为："+(endTime - startTime)+"毫秒");
        }

    }


    public int thisIsInArray(String str,String strs[]){
        for(int i = 0; i < strs.length; i++){
            if(str.equals(strs[i])){
                return i;
            }
        }
        return -1;
    }


}

