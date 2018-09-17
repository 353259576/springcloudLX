package org.ws.java.order.wsutils.DataBaseHandle;

import java.lang.reflect.Field;

public class MySearch {
    private String fieldName;
    private JpaDataHandle.Operator operator;
    private Object value;

    private MySearch(){

    }

    public MySearch(String fieldName, JpaDataHandle.Operator operator,Object value){
        this.fieldName = fieldName;
        this.operator = operator;
        this.value = value;
    }


    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public JpaDataHandle.Operator getOperator() {
        return operator;
    }

    public void setOperator(JpaDataHandle.Operator operator) {
        this.operator = operator;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }
}
