package org.ws.java.order.model.vo;

import org.ws.java.order.constants.AjaxFlag;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class AjaxVO implements Serializable {
    private static final long serialVersionUID = -6788408692146292106L;
    protected int flag;
    protected Map<String, Object> data;
    protected String msg;

    public AjaxVO() {
        this.flag = AjaxFlag.SUCC.code();
    }

    public AjaxVO(int flagCode, String msg) {
        this.flag = AjaxFlag.SUCC.code();
        this.flag = flagCode;
        this.msg = msg;
    }

    public void putData(String key, Object val) {
        if (this.data == null) {
            this.data = new HashMap();
        }

        this.data.put(key, val);
    }

    public void putError(String msg, Exception e) {
        this.setFlag(AjaxFlag.FAIL);
        this.putData("exception", e);
        this.putData("exceptionName", e.getClass());
        this.setMsg(msg);
    }

    public static AjaxVO returnFailMsg(String msg) {
        return new AjaxVO(AjaxFlag.FAIL.code(),msg);
    }
    public static AjaxVO returnReconnectMsg(String msg) {
        return new AjaxVO(AjaxFlag.RECONNECT.code(),msg);
    }

    public static AjaxVO returnSuccMsg(String msg) {
        return new AjaxVO(AjaxFlag.SUCC.code(),msg);
    }

    public static AjaxVO returnUnLoginMsg(String msg) {
        return new AjaxVO(AjaxFlag.UNLOAGIN.code(),msg);
    }

    public static AjaxVO returnNoAccessMsg(String msg) {
        return new AjaxVO(AjaxFlag.NOACCESS.code(),msg);
    }


    public static AjaxVO newAjax(int flagCode, String msg) {
        return new AjaxVO(flagCode,msg);
    }

    public static AjaxVO newAjax() {
        return new AjaxVO();
    }

    public void putDataList(List<?> dataList) {
        this.putData("dataList", dataList);
    }

    public void putDataList(PageInfo<?> page) {
        this.putData("page", page);
    }

    public int getFlag() {
        return this.flag;
    }

    public void setFlag(AjaxFlag flag) {
        this.flag = flag.code();
    }

    public void setFlag(int flagCode) {
        this.flag = flagCode;
    }

    public Map<String, Object> getData() {
        return this.data;
    }

    public void setData(Map<String, Object> data) {
        this.data = data;
    }

    public String getMsg() {
        return this.msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }
}