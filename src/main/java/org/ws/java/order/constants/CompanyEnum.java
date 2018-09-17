package org.ws.java.order.constants;

public enum CompanyEnum {
    SHOP("1","网点"),
    AGENT("2","代理")
    ;



    private String code;

    private String label;


    private CompanyEnum(String code, String label){
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
