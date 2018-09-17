package org.ws.java.order.wsutils;

import java.text.SimpleDateFormat;
import java.util.*;

public class WsStringUtils {
    public static final byte Trim = 32;

    public static final String LONGTIMESTRING = "yyyy-MM-dd HH:mm:ss";
    public static final String CNLONGTIMESTRING = "yyyy年MM月dd日 HH时mm分ss秒";
    public static final String SMALLTIMESTRING = "yyyy-MM-dd";
    public static final String CNSMALLTIMESTRING = "yyyy年MM月dd日";

    public static void main(String[] args) {
        /*System.out.println(" ".getBytes()[0]);
        System.out.println(stringTrim("sdf dfsfhh4ghg            6545-*-/-++d"));
        System.out.println((int) '-');
        System.out.println(isNumber("-7.84785555555555877777777777777777777777777771111111111111777777777777777777777777777"));
        System.out.println(stringNotHaveTrim("fd dsf "));
        Integer list1[] = new Integer[]{1,2,3,4,5,6,7,8,9};
        Integer list2[] = new Integer[]{11,22,33,44,55,66,77,88,99};
        System.out.println(JSON.toJSONString(mergeList(list1,list2)));
        List<Byte> bytes = new ArrayList<>();
        bytes.add(Byte.valueOf("1"));
        bytes.add(Byte.valueOf("2"));
        bytes.add(Byte.valueOf("3"));
        bytes.add(Byte.valueOf("4"));
        bytes.add(Byte.valueOf("5"));
        bytes.add(Byte.valueOf("6"));
        bytes.add(Byte.valueOf("7"));
        bytes.add(Byte.valueOf("8"));
        bytes.add(Byte.valueOf("9"));
        bytes.add(Byte.valueOf("10"));
        bytes.add(Byte.valueOf("11"));
        bytes.add(Byte.valueOf("12"));
        bytes.add(Byte.valueOf("13"));
        byte by[] = byteListToArray(bytes);
        for(int i = 0; i < by.length; i++){
            System.out.print(by[i]);
        }
        System.out.println();
        System.out.println(createOrderNo());*/
        System.out.println(decodeUnicode("AbstractAccessDecisionManager.accessDenied=\\u62d2\\u7edd\\u8bbf\\u95ee\n" +
                "AbstractLdapAuthenticationProvider.emptyPassword=\\u5bc6\\u7801\\u4e3a\\u7a7a\n" +
                "AbstractUserDetailsAuthenticationProvider.badCredentials=\\u5bc6\\u7801\\u9519\\u8bef\n" +
                "AbstractUserDetailsAuthenticationProvider.credentialsExpired=\\u5bc6\\u7801\\u8fc7\\u671f\n" +
                "AbstractUserDetailsAuthenticationProvider.disabled=\\u8d26\\u53f7\\u4e0d\\u53ef\\u7528\n" +
                "AbstractUserDetailsAuthenticationProvider.locked=\\u8d26\\u53f7\\u88ab\\u9501\\u5b9a"));
        Date data = stringToDate("2018/12/12 12:12:12");
        System.out.println(data);
        System.out.println(objectDateFormatString("4187848418414198"));
        /*try {
            System.out.println(new String(Base64.getDecoder().decode("38hK7fsURA0vt3ef-IW72hvbczDNVASfIlMkBKA6hLWxbe1Vt9ow2snACRPfgjQwGhZ_kWaCLRt0kwnP09pJQw"),"UTF-8"));
        }catch (Exception e){
            e.printStackTrace();
        }*/
    }


    public static byte[] byteListToArray(List<Byte> bytes){
        if(bytes==null||bytes.size()==0){
            return null;
        }
        byte bys[] = new byte[bytes.size()];
        for(int i = 0; i < bytes.size(); i++){
            bys[i] = bytes.get(i).byteValue();
        }
        return bys;
    }

    public static String dateToString(Date date,String dateType){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat(dateType);
        return simpleDateFormat.format(date);
    }

    public static boolean isEmpty(String str){
        str = WsStringUtils.stringTrim(str);
        if(str == null){
            return false;
        }
        if(str.length() == 0){
            return false;
        }
        return true;
    }





    public static <T> T[] mergeList(T[] list1,T[] list2){
        if(list1==null||list2==null||list1.length==0||list2.length==0){
            if(!(list1 == null || list1.length == 0)){
                return list1;
            }
            if(!(list2 == null || list2.length == 0)){
                return list2;
            }
        }
        T[] list = (T[])new Object[list1.length+list2.length];
        int k = 0;
        for(int i = 0; i < list1.length; i++){
            list[k] = list1[i];
            k++;
        }
        for(int i = 0; i < list2.length; i++){
            list[k] = list2[i];
            k++;
        }
        return list;
    }



    public static boolean isNumber(String str){
        if(str==null){
            return false;
        }
        char chars[] = str.toCharArray();
        if(str.length()==0){
            return false;
        }
        boolean isHave = false;
        int i = 0;
        if(chars[0]=='-'||chars[0]=='+'){
            i++;
        }
        for(; i < chars.length; i++){
            if(chars[i]<48||chars[i]>58){
                if(chars[i] == '.'){
                    if(i==0||i==chars.length-1||isHave==true){
                        return false;
                    }else {
                        isHave = true;
                    }
                }else {
                    return false;
                }
            }
        }
        return true;
    }


    public static boolean stringNotHaveTrim(String str){
        if(str==null){
            return false;
        }
        byte bytes[] = null;
        try {
            bytes = str.getBytes("utf-8");
        }catch (Exception e){
            bytes = str.getBytes();
        }

        if(bytes.length==0){
            return false;
        }
        for(int i = 0; i < bytes.length; i++){
            if(bytes[i]==Trim){
                return false;
            }
        }
        return true;

    }

    public static String stringTrim(String str){
        if(str == null){
            return str;
        }
        byte bytes[] = str.getBytes();
        if(bytes.length==0){
            return null;
        }
        List list = new ArrayList();
        for(int i = 0; i < bytes.length; i++){
            if(bytes[i]!=Trim){
                list.add(bytes[i]);
            }
        }
        bytes = new byte[list.size()];
        for(int i = 0; i < list.size(); i++){
            bytes[i] = (byte) list.get(i);
        }
        if(bytes.length==0){
            return null;
        }else {
            return new String(bytes);
        }
    }


    public static String createOrderNo(){
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        String str = simpleDateFormat.format(new Date());
        String str1 = String.valueOf((new Random().nextInt(9000))+1000);
        return str+str1;
    }



    /**
     * unicode转码
     * @param dataStr
     * @return
     */
    public static String decodeUnicode(String dataStr) {

        StringBuffer buffer = new StringBuffer();
        char unicodeChar[] = new char[]{'\\', 'u'};
        char ch[] = dataStr.toCharArray();
        for (int i = 0; i < ch.length; i++) {
            if (ch[i] == unicodeChar[0]) {
                if (i + 4 < ch.length) {
                    if (ch[++i] == unicodeChar[1]) {
                        //i++;
                        String str = "";
                        for (int j = 0; j < 4; j++) {
                            i++;
                            str += ch[i];
                        }
                        char letter = (char) Integer.parseInt(str, 16); // 16进制parse整形字符串。
                        buffer.append(letter);
                    }
                }
            }else if(ch[i]=='%'){
                if(i+3==ch.length){
                    buffer.append(ch[i]);
                    i++;
                }else {
                    List<String> strings = new ArrayList<>();
                    String str = "";
                    StringBuffer stringBuffer = new StringBuffer();
                    for(int j = 0; j < 2; j++){
                        i++;
                        //str += ch[i];
                        stringBuffer.append(ch[i]);
                    }
                    str = stringBuffer.toString();
                    str = str.toUpperCase();
                    strings.add(str);
                    i++;
                    while (i+2<ch.length&&ch[i]=='%'){
                        //str = "";
                        stringBuffer = new StringBuffer();
                        for(int j = 0; j < 2; j++){
                            i++;
                            //str += ch[i];
                            stringBuffer.append(ch[i]);
                        }
                        str = stringBuffer.toString();
                        str = str.toUpperCase();
                        strings.add(str);
                        i++;
                    }
                    i--;
                    byte by[] = new byte[strings.size()];
                    for(int j = 0; j < strings.size(); j++){
                        by[j] = (byte)Integer.parseInt(strings.get(j),16);
                    }
                    try {
                        buffer.append(new String(by,"utf-8"));
                    }catch (Exception e){
                        e.printStackTrace();
                        buffer.append(new String(by));
                    }

                }
            }else {
                buffer.append(ch[i]);
            }
        }
        return buffer.toString();
    }



    public static String dateStringFormat(String date){
        char chars[] = date.toCharArray();
        List<String> strings = new ArrayList<>();
        for(int i = 0; i < chars.length; i++){
            StringBuffer stringBuffer = new StringBuffer();
            while (i<chars.length&&chars[i]>47&&chars[i]<58){
                stringBuffer.append(chars[i]);
                i++;
            }
            if(stringBuffer.length()>0){
                strings.add(stringBuffer.toString());
            }
        }
        if(strings.size()>5){
            return strings.get(0)+"-"+strings.get(1)+"-"+strings.get(2)+" "+strings.get(3)+":"+strings.get(4)+":"+strings.get(5);
        }
        if(strings.size()>2){
            return strings.get(0)+"-"+strings.get(1)+"-"+strings.get(2)+" 00:00:00";
        }
        return null;
    }

    public static Date stringToDate(String date){
        try {
            date = dateStringFormat(date);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(LONGTIMESTRING);
            return simpleDateFormat.parse(date);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }


    public static Date objectToDate(Object date){
        try {
            String dateString = objectDateFormatString(date);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat(LONGTIMESTRING);
            return simpleDateFormat.parse(dateString);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }


    public static String objectDateFormatString(Object object){
        try {
            if(object instanceof String){
                if(isNumber((String) object)){
                    return dateToString(new Date(Long.parseLong((String)object)),LONGTIMESTRING);
                }else {
                    return dateStringFormat((String)object);
                }

            }else if(object instanceof Date){
                return dateToString((Date)object,LONGTIMESTRING);
            }else if(object.getClass().isPrimitive()){
                return dateToString(new Date(Long.parseLong(String.valueOf(object))),LONGTIMESTRING);
            }else if(object instanceof Number){
                return dateToString(new Date(Long.parseLong(String.valueOf(object))),LONGTIMESTRING);
            }else if(object instanceof java.sql.Date){
                return dateToString((Date)object,LONGTIMESTRING);
            }else {
                return null;
            }
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }

    public static boolean classCompare(Class clazz1,Class clazz2){
        for(;!(clazz1 == Object.class || clazz1 == null);clazz1 = clazz1.getSuperclass()){
            for(;!(clazz2 == Object.class || clazz2 == null); clazz2 = clazz2.getSuperclass()){
                if(clazz1 == clazz2)
                    return true;
            }

        }
        return false;

    }


    public static String anyToString(Object object){
        if(object.getClass().isPrimitive()){
            return String.valueOf(object);
        }else if(object instanceof Number){
            return object.toString();
        }else if (object instanceof String){
            return (String)object;
        }else if(object instanceof Character){
            return object.toString();
        }else if(object instanceof Boolean){
            return object.toString();
        }else if(object instanceof Date){
            Date date = (Date)object;
            return date.toString();
        } else {
            return null;
        }
    }


    public static String dateToDate(String date){
        char chars[] = date.toCharArray();
        List<String> strings = new ArrayList<>();
        for(int i = 0; i < chars.length; i++){
            StringBuffer stringBuffer = new StringBuffer();
            while (i<chars.length&&chars[i]>47&&chars[i]<58){
                stringBuffer.append(chars[i]);
                i++;
            }
            if(stringBuffer.length()>0){
                strings.add(stringBuffer.toString());
            }
        }
        if(strings.size()>5){
            return strings.get(0)+"-"+strings.get(1)+"-"+strings.get(2)+" "+strings.get(3)+":"+strings.get(4)+":"+strings.get(5);
        }
        if(strings.size()>2){
            return strings.get(0)+"-"+strings.get(1)+"-"+strings.get(2)+" 00:00:00";
        }
        return null;
    }


}
