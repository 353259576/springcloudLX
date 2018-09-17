package org.ws.java.order.constants;

public enum OrderPromulgatorEnum {
    ORDERPROMULGATORYJS("0","订单提供已结算"),
    ORDERPROMULGATORDSH("1","订单提供待审核");



    private String code;

    private String label;


    private OrderPromulgatorEnum(String code, String label){
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
