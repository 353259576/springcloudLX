package org.ws.java.order.constants;

public enum ChildOrderEnum {
    CHILDORDERDELETE("4","子订单删除"),
    CHILDORDERPROCEED("1","子订单预加载"),
    CHILDORDERFINASH("6","子订单完成"),
    CHILDORDERQUALIFIED("2","子订单合格"),
    CHILDORDISDERQUALIFIED("0","子订单不合格"),
    CHILDORDEROVERTIME("3","子订单超时"),
    CHILDORDERMERCHANTAUDIT("5","商家审核完成"),
    CHILDORDERPLATFORMAUDITFAIL("7","平台不合格");



    private String code;

    private String label;


    private ChildOrderEnum(String code, String label){
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
