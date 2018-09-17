package org.ws.java.order.constants;

public enum AjaxFlag {
    SUCC(0),
    FAIL(-1),
    UNLOAGIN(-2),
    NOACCESS(-3),
    RECONNECT(-4)
    ;

    private int code;

    private AjaxFlag(int code) {
        this.code = code;
    }

    public int code() {
        return this.code;
    }
}
