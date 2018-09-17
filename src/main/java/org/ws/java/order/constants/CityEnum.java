package org.ws.java.order.constants;

public enum CityEnum {
    PROVINCE(1,"省"),
    CITY(2,"市"),
    DISTRICT(3,"区")
    ;


    private Integer code;
    private String label;

    private CityEnum(Integer code,String label){
        this.code = code;
        this.label = label;
    }

    public static Integer getCode(String code){
        for(CityEnum cityEnum:CityEnum.values()){
            if(cityEnum.getCode().toString().equals(code)){
                return cityEnum.getCode();
            }
        }
        return null;
    }

    public static String getLabel(String label){
        for(CityEnum cityEnum:CityEnum.values()){
            if(cityEnum.getLabel().equals(label)){
                return cityEnum.getLabel();
            }
        }
        return null;
    }

    public Integer getCode() {
        return code;
    }

    public void setCode(Integer code) {
        this.code = code;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }
}
