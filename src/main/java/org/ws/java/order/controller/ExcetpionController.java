package org.ws.java.order.controller;

import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;
import org.ws.java.order.constants.AjaxFlag;
import org.ws.java.order.model.vo.AjaxVO;

import javax.servlet.http.HttpServletRequest;

@ControllerAdvice
@Component
public class ExcetpionController {

    @ExceptionHandler(Exception.class)
    @ResponseBody
    public AjaxVO GlobalException(HttpServletRequest request, Exception e){
        e.printStackTrace();
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.setFlag(AjaxFlag.FAIL);
        ajaxVO.setMsg("请求"+request.getRequestURI()+"出现了未知错误");
        return ajaxVO;
    }
}
