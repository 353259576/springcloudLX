package org.ws.java.order.constants;

public enum MsgEnum {
    MSGREAD("0","已查看"),
    MSGUNREAD("1","未查看"),
    MSGEXIST("0","存在"),
    MSGNONEXIST("1","不存在");



    private String code;

    private String label;


    private MsgEnum(String code, String label){
        this.code = code;
        this.label = label;
    }

    public String getCode() {
        return code;
    }

    public String getLabel() {
        return label;
    }

}
