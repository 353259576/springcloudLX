package org.ws.java.order.constants;

public enum  RoleEnum {
    ROLESTATUSUNLOCK("1","启用"),
    ROLESTATUSLOCK("0","锁定"),
    ROLETYPEADMIN("0","管理员"),
    ROLETYPEGENERAL("1","普通账户"),

    ROLETYPE("roletype","权限类型"),
    ROLESTATUS("rolestatus","权限状态")
    ;

    private String code;
    private String label;


    private RoleEnum(String code,String label){
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
