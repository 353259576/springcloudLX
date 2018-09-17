package org.ws.java.order.config;

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.core.MethodParameter;
import org.springframework.http.MediaType;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.RestTempLateUtil;
import org.ws.java.order.wsutils.WsStringUtils;

import javax.servlet.http.HttpServletRequest;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

@Slf4j
public class RequestParameterHandle implements HandlerMethodArgumentResolver {
    public static final String PARAMETERPREFIX = "search";
    public static final String PAGEPREFIX = "page";
    private static RequestParameterHandle requestParameterHandle = null;

    public RequestParameterHandle() {

    }

    public static synchronized RequestParameterHandle newRequestParameterHandle() {
        if (requestParameterHandle != null) {
            return requestParameterHandle;
        }
        return new RequestParameterHandle();
    }

    @Override
    public boolean supportsParameter(MethodParameter methodParameter) {
        return MySearchList.class.isAssignableFrom(methodParameter.getParameterType());
    }

    @Override
    public Object resolveArgument(MethodParameter methodParameter, ModelAndViewContainer modelAndViewContainer, NativeWebRequest nativeWebRequest, WebDataBinderFactory webDataBinderFactory) throws Exception {
        String searchPrefix = PARAMETERPREFIX;
        String pagePrefix = PAGEPREFIX;
        MySearchList mySearchList = MySearchList.newMySearchList();
        PageVO pageVO = new PageVO();
        String contentType = nativeWebRequest.getHeader("Content-Type");
        if(contentType != null) {
            if (contentType.contains(MediaType.APPLICATION_JSON_VALUE)) {
                log.info("对Json进行处理");
                HttpServletRequest httpServletRequest = nativeWebRequest.getNativeRequest(HttpServletRequest.class);
                String jsonBody = (String) httpServletRequest.getAttribute("JSON_REQUEST_BODY");
                try {
                    if (jsonBody == null) {
                        jsonBody = IOUtils.toString(httpServletRequest.getInputStream(), "UTF-8");
                    }
                    if (StringUtils.isNotEmpty(jsonBody)) {
                        if (jsonBody.startsWith("{")) {
                            Map<String, Object> map = JSON.parseObject(jsonBody);
                            Set<Map.Entry<String, Object>> set = map.entrySet();
                            Iterator<Map.Entry<String, Object>> iterator = set.iterator();
                            /*Map.Entry<String, Object> entry = null;
                            String name = null;
                            Object value = null;
                            String valueString = null;*/
                            dataHandle(searchPrefix, pagePrefix, mySearchList, pageVO, iterator);
                        } else if (jsonBody.startsWith("[")) {
                            List<Object> list = JSON.parseArray(jsonBody);
                            if (list != null) {
                                for (int i = 0; i < list.size(); i++) {
                                    if (list.get(i) instanceof Map) {
                                        Map<String, Object> map = (Map<String, Object>) list.get(i);
                                        Set<Map.Entry<String, Object>> set = map.entrySet();
                                        Iterator<Map.Entry<String, Object>> iterator = set.iterator();
                                        /*Map.Entry<String, Object> entry = null;
                                        String name = null;
                                        Object value = null;
                                        String valueString = null;*/
                                        dataHandle(searchPrefix, pagePrefix, mySearchList, pageVO, iterator);


                                    }
                                }
                            }
                        }

                    }
                } catch (Exception e1) {
                    e1.printStackTrace();
                }
            } else {
                log.info("进行通常数据处理");
                Iterator<String> parameterNames = nativeWebRequest.getParameterNames();
                while (parameterNames.hasNext()) {
                    String name = parameterNames.next();
                    if (name.startsWith(searchPrefix)) {
                        String[] parnts = name.split("_");
                        if (parnts.length == 3) {
                            String[] values = nativeWebRequest.getParameterValues(name);
                            String value = null;
                            if (values != null && values.length == 1) {
                                value = values[0];
                            }
                            if (!StringUtils.isEmpty(value)) {
                                JpaDataHandle.Operator operator = JpaDataHandle.Operator.valueOf(parnts[2].toUpperCase());
                                if (null != operator) {
                                    mySearchList.add(parnts[1], operator, value);
                                }
                            }
                            if (StringUtils.isEmpty(value) && values != null) {
                                JpaDataHandle.Operator operator = JpaDataHandle.Operator.valueOf(parnts[2].toUpperCase());
                                if (null != operator && operator.equals(JpaDataHandle.Operator.IN)) {
                                    mySearchList.add(parnts[1], operator, values);
                                } else if (null != operator && operator.equals(JpaDataHandle.Operator.NIN)) {
                                    mySearchList.add(parnts[1], operator, values);
                                }
                            }
                        }
                    } else if (name.startsWith(pagePrefix)) {
                        String[] parnts = name.split("_");
                        if (parnts.length == 2) {
                            String[] values = nativeWebRequest.getParameterValues(name);
                            String value = null;
                            if (values != null && values.length > 0) {
                                value = values[0];
                            }
                            putPageVOData(pageVO, parnts, value);
                        }
                    }
                }
            }
        }
        mySearchList.setPageVO(pageVO);
        return mySearchList;
    }

    private void putPageVOData(PageVO pageVO, String[] parnts, String value) {
        if (value != null) {
            if (parnts[1].equals("page")) {
                pageVO.setPage(Integer.parseInt(value));
            } else if (parnts[1].equals("rows")) {
                pageVO.setRows(Integer.parseInt(value));
            } else if (parnts[1].equals("totalRows")) {
                pageVO.setTotalRows(Integer.valueOf(value));
            }
        }
    }

    private void dataHandle(String searchPrefix, String pagePrefix, MySearchList mySearchList, PageVO pageVO, Iterator<Map.Entry<String, Object>> iterator) {
        Map.Entry<String, Object> entry;
        String name;
        Object value;
        String valueString;
        while (iterator.hasNext()) {
            entry = iterator.next();
            name = entry.getKey();

            if (name.startsWith(searchPrefix)) {
                String[] parnts = name.split("_");
                if (parnts.length == 3) {
                    value = entry.getValue();
                    if (value != null) {
                        JpaDataHandle.Operator operator = JpaDataHandle.Operator.valueOf(parnts[2].toUpperCase());
                        if (operator != null && operator.equals(JpaDataHandle.Operator.IN)) {
                            if (value instanceof List || value instanceof Set || value.getClass().isArray()) {
                                mySearchList.add(parnts[1], operator, value);
                            }
                        }else if (operator != null && operator.equals(JpaDataHandle.Operator.NIN)) {
                            if (value instanceof List || value instanceof Set || value.getClass().isArray()) {
                                mySearchList.add(parnts[1], operator, value);
                            }
                        }
                            else if (operator != null) {
                            valueString = WsStringUtils.anyToString(value);
                            if (valueString != null) {
                                mySearchList.add(parnts[1], operator, valueString);
                            }

                        }

                    }
                }
            } else if (name.startsWith(pagePrefix)) {
                String[] parnts = name.split("_");
                if (parnts.length == 2) {
                    value = entry.getValue();
                    if (value != null) {
                        valueString = WsStringUtils.anyToString(value);
                        putPageVOData(pageVO, parnts, valueString);
                    }
                }
            }


        }
    }
}
