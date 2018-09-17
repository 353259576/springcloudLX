package org.ws.java.order.constants;

public enum  OrderEnum {
    ORDERREMOVE("0","订单删除"),
    ORDERPROCEED("1","订单进行"),
    ORDERAUDIT("2","数据审核"),
    ORDERFINISH("3","完成"),
    ORDERSUSPENGFD("4","截单"),
    UNLIMIT("1","不限定订单"),
    LIMIT("2","限定订单");



    private String code;

    private String label;


    private OrderEnum(String code,String label){
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
