package org.ws.java.order.constants;

public enum DrawingsEnum {
    DRAWINGSDELETE("0","提现记录删除"),
    DRAWINGSINSERT("1","提现中"),
    DRAWINGSAGREE("2","提现完成"),
    DRAWINGSUNAGREE("3","提现不同意"),
    DEPOSIT("1","提现"),
    CLAIM("2","报销")
    ;



    private String code;

    private String label;


    private DrawingsEnum(String code, String label){
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
