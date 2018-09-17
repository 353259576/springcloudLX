package org.ws.java.order.wsutils;


import org.apache.commons.lang.StringUtils;

import javax.net.ssl.*;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLDecoder;
import java.security.KeyStore;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;

public class WsUrlConnection {
    private static char hrefList[] = new char[]{'h','r','e','f','=','"'};
    private static char htmlList[] = new char[]{'"','h','t','t','p'};
    private static char htmlList1[] = new char[]{'\'','h','t','t','p'};
    private static char wwwList[] = new char[]{'w','w','w'};
    private static String HTMLTYPE = "text/html";
    private static String IMAGETYPE = "image";
    private static String JSTYPE = "application/x-javascript";
    private static String JSONTYPE = "application/json";
    //private static char dianList[] = new char[]{'"','/'};
    private static List<char[]> list = new ArrayList<>();
    private static final char[] MULTIPART_CHARS = "-_1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ".toCharArray();
    private static volatile String biaoshi = null;


    public static void main(String[] args) {
        String str = urlLink("https://www.bilibili.com","GET",null);
        System.out.println(str);
    }



	public static String getPath(){
		String str = WsUrlConnection.class.getResource("/").getPath();
		try {
			return URLDecoder.decode(str,"utf-8");
		}catch (Exception e){
			e.printStackTrace();
			return str;
		}
	}

    public static String urlLink(String urlpath, String method, Object dataObject){
        String data = null;
        if(dataObject != null){
            if(dataObject instanceof Map){
                data = mapToString((Map)dataObject);
            }else {
                data = anyToDataString(dataObject);
            }
        }

	    return urlLink(urlpath,method,data,null,null);
    }


	public static String urlLink(String urlpath, String method, String data, String pkcsPath, String pkcsPassword) {
		BufferedInputStream bufferedInputStream = null;
		InputStream inputStream = null;
		DataInputStream dataInputStream = null;
		BufferedReader bufferedReader = null;
		BufferedOutputStream bufferedOutputStream = null;
		OutputStream outputStream = null;
		Integer resultCode = null;
		ByteArrayOutputStream byteArrayOutputStream = null;
		String textType = null;
		FileInputStream fileInputStream = null;
		try {
			Boolean isHttps = true;
			if (urlpath.toLowerCase().startsWith("https")) {
				isHttps = true;
			} else if (urlpath.toLowerCase().startsWith("http")) {
				isHttps = false;
			} else {
				return null;
			}
			URL url = new URL(urlpath);
			if (isHttps == true) {
				HttpsURLConnection httpsURLConnection = (HttpsURLConnection) url.openConnection();
				SSLContext sslContext = SSLContext.getInstance("SSL", "SunJSSE");
				TrustManager trustManager[] = {new X509TrustManager() {
					//检查本地证书
					@Override
					public void checkClientTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
					/*System.out.println("本地证书名称："+s);
					if(x509Certificates != null){
						System.out.println("本地证书内容为" + JSON.toJSONString(x509Certificates));
					}*/
					}

					//检查服务端证书
					@Override
					public void checkServerTrusted(X509Certificate[] x509Certificates, String s) throws CertificateException {
					/*System.out.println("服务器证书名称："+s);
					if(x509Certificates != null){
						System.out.println("服务器证书内容为" + JSON.toJSONString(x509Certificates));
					}*/
					}

					@Override
					public X509Certificate[] getAcceptedIssuers() {
						System.out.println("调用了本函数");
						return new X509Certificate[0];
					}
				}};
				if (pkcsPath == null) {
					sslContext.init(null, trustManager, new SecureRandom());
				} else {
					File file = new File(pkcsPath);
					KeyStore keyStore = KeyStore.getInstance("PKCS12");
					fileInputStream = new FileInputStream(file);
					keyStore.load(fileInputStream, pkcsPassword.toCharArray());
					KeyManagerFactory keyManagerFactory = KeyManagerFactory.getInstance(KeyManagerFactory.getDefaultAlgorithm());
					keyManagerFactory.init(keyStore, pkcsPassword.toCharArray());
					sslContext.init(keyManagerFactory.getKeyManagers(), trustManager, new SecureRandom());
				}
				SSLSocketFactory sslSocketFactory = sslContext.getSocketFactory();
				httpsURLConnection.setSSLSocketFactory(sslSocketFactory);
				if (data != null) {
					httpsURLConnection.setDoInput(true);
				}
				httpsURLConnection.setDoOutput(true);
				httpsURLConnection.setRequestMethod(method);
				httpsURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				//httpsURLConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				//httpsURLConnection.setRequestProperty("accept-encoding", "gzip,deflate");
				httpsURLConnection.setRequestProperty("Connection", "Keep-Alive");// 维持长连接
				httpsURLConnection.setRequestProperty("Charset", "UTF-8");
				//httpsURLConnection.setRequestProperty("UserPO-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2");
				httpsURLConnection.connect();
				if(data!= null) {
					outputStream = httpsURLConnection.getOutputStream();
					bufferedOutputStream = new BufferedOutputStream(outputStream);
					bufferedOutputStream.write(data.getBytes());
					bufferedOutputStream.flush();
					bufferedOutputStream.close();
				}
				resultCode = httpsURLConnection.getResponseCode();
				System.out.println(resultCode);
				inputStream = httpsURLConnection.getInputStream();
				//textType = httpsURLConnection.getRequestProperty("Content-Type").split("=")[1];

			} else {
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				if (data != null) {
					urlConnection.setDoInput(true);
				}
				urlConnection.setDoOutput(true);
				urlConnection.setRequestMethod(method);
				urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				//urlConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				urlConnection.setRequestProperty("accept-encoding", "gzip,deflate");
				urlConnection.setRequestProperty("Connection", "Keep-Alive");// 维持长连接
				urlConnection.setRequestProperty("Charset", "UTF-8");
				//urlConnection.setRequestProperty("UserPO-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2");
				urlConnection.connect();
				if(data!= null){
					outputStream = urlConnection.getOutputStream();
					bufferedOutputStream = new BufferedOutputStream(outputStream);
					bufferedOutputStream.write(data.getBytes());
					bufferedOutputStream.flush();
					bufferedOutputStream.close();
				}
				resultCode = urlConnection.getResponseCode();
				inputStream = urlConnection.getInputStream();
			}
			if(resultCode == HttpURLConnection.HTTP_OK){
				byteArrayOutputStream = new ByteArrayOutputStream();
				byte by[] = new byte[1024];
				bufferedInputStream = new BufferedInputStream(inputStream);
				int k = 0;
				while ((k =bufferedInputStream.read(by))!= -1){
					byteArrayOutputStream.write(by,0,k);
				}
				return new String(byteArrayOutputStream.toByteArray());
			}else {
				return null;
			}


		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (outputStream != null) {
				try {
					outputStream.flush();
					outputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			if (bufferedOutputStream != null) {
				try {
					bufferedOutputStream.flush();
					bufferedOutputStream.close();
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
			if (inputStream != null) {
				try {
					inputStream.close();
				} catch (Exception e) {

				}
			}
			if (bufferedReader != null) {
				try {
					dataInputStream.close();
				} catch (Exception e) {

				}
			}
			if (bufferedInputStream != null) {
				try {
					bufferedInputStream.close();
				} catch (Exception e) {

				}
			}


			if (dataInputStream != null) {
				try {
					dataInputStream.close();
				} catch (Exception e) {

				}
			}
			if(byteArrayOutputStream != null){
				try {
					byteArrayOutputStream.flush();
					byteArrayOutputStream.close();
				}catch (Exception e){
					e.printStackTrace();
				}
			}
			if(fileInputStream != null){
			    try {
			        fileInputStream.close();
                }catch (Exception e){
			        e.printStackTrace();
                }
            }
		}
		return null;

	}

	public static String getIp(HttpServletRequest request){
        String ip = request.getHeader("X-Forwarded-For");
        if(StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            //多次反向代理后会有多个ip值，第一个ip才是真实ip
            int index = ip.indexOf(",");
            if(index != -1){
                return ip.substring(0,index);
            }else{
                return ip;
            }
        }
        ip = request.getHeader("X-Real-IP");
        if(org.apache.commons.lang.StringUtils.isNotEmpty(ip) && !"unKnown".equalsIgnoreCase(ip)){
            return ip;
        }
        return request.getRemoteAddr();
    }

	public static StringBuffer stringBufferAdd(StringBuffer stringBuffer,Object object1,Object object2){
		stringBuffer.append('&');
		stringBuffer.append(object1);
		stringBuffer.append('=');
		stringBuffer.append(object2);
		return stringBuffer;
	}


    public static String mapToString(Map map){
        StringBuffer stringBuffer = new StringBuffer();
        Set<Map.Entry> set = map.entrySet();
        Iterator<Map.Entry> iterator = set.iterator();
        int i = 0;
        while (iterator.hasNext()){
            Map.Entry entry = iterator.next();

            Object object = entry.getValue();
            if(object.getClass().isArray()){
                Object[] objects = (Object[]) object;
                for(int k = 0; k < objects.length; k++){
                    object = objects[k];
                    if( object.getClass().isPrimitive()){
                        stringBufferAdd(stringBuffer,entry.getKey(),object);
                    }
                    if(object instanceof Number){
                        stringBufferAdd(stringBuffer,entry.getKey(),object);
                    }
                    if(object instanceof Character){
                        stringBufferAdd(stringBuffer,entry.getKey(),object);
                    }
                    if(object instanceof String){
                        stringBufferAdd(stringBuffer,entry.getKey(),object);
                    }
                }
            }else {
                if( object.getClass().isPrimitive()){
                    stringBufferAdd(stringBuffer,entry.getKey(),object);
                }
                if(object instanceof Number){
                    stringBufferAdd(stringBuffer,entry.getKey(),object);
                }
                if(object instanceof Character){
                    stringBufferAdd(stringBuffer,entry.getKey(),object);
                }
                if(object instanceof String){
                    stringBufferAdd(stringBuffer,entry.getKey(),object);
                }
            }
        }
        stringBuffer.delete(0,1);
        return stringBuffer.toString();
    }

    public static String anyToDataString(Object object){
        Field fields[] = object.getClass().getDeclaredFields();
        HashSet<Field> fieldHashSet = new HashSet<>();
        for (Field field:fields){
            fieldHashSet.add(field);
        }
        fields = object.getClass().getFields();
        for (Field field:fields){
            fieldHashSet.add(field);
        }
        StringBuffer stringBuffer = new StringBuffer();
        Iterator<Field> fieldIterator = fieldHashSet.iterator();
        while (fieldIterator.hasNext()){
            Field field = fieldIterator.next();
            try {
                String fileName = field.getName();
                String methodName = "get"+fileName.substring(0,1).toUpperCase()+fileName.substring(1,fileName.length());
                Method method = object.getClass().getDeclaredMethod(methodName);
                if(method != null){
                    Object ob = method.invoke(object);
                    if(ob != null){
                        if(ob.getClass().isArray()){
                            if(ob==int[].class||ob==Integer[].class){
                                try {
                                    if(ob==int[].class){
                                        int[] ints = (int[])ob;
                                        for(int i = 0; i < ints.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Integer.valueOf(ints[i]).toString());
                                        }
                                    }
                                    if(ob==Integer[].class){
                                        Integer integers[] = (Integer[]) ob;
                                        for(int i = 0; i < integers.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),integers[i].toString());
                                        }
                                    }

                                }catch (Exception e){
                                    e.printStackTrace();
                                }

                            }
                            else if(ob==byte[].class||ob==Byte[].class){
                                try {
                                    if(ob==byte[].class){
                                        byte bytes[] = (byte[])ob;
                                        for(int i = 0; i < bytes.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Byte.valueOf(bytes[i]).toString());
                                        }
                                    }
                                    if(ob==Byte[].class){
                                        Byte bytes[] = (Byte[])ob;
                                        for(int i = 0; i < bytes.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),bytes[i].toString());
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==char[].class||ob==Character[].class){
                                try {
                                    if(ob==char[].class){
                                        char[] chars = (char[])ob;
                                        for(int i = 0; i < chars.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),chars[i]+"");
                                        }
                                    }
                                    if(ob==Character[].class){
                                        Character[] characters = (Character[])ob;
                                        for(int i = 0; i < characters.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),characters[i].charValue()+"");
                                        }

                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==boolean[].class||ob==Boolean[].class){
                                try {
                                    if(ob==boolean[].class){
                                        boolean[] booleans = (boolean[]) ob;
                                        for(int i = 0; i < booleans.length; i++){
                                            if(booleans[i]){
                                                stringBuffer = stringBufferAdd(stringBuffer,field.getName(),"true");
                                            }else {
                                                stringBuffer = stringBufferAdd(stringBuffer,field.getName(),"false");
                                            }
                                        }
                                    }
                                    if(ob==Boolean[].class){
                                        Boolean[] booleans = (Boolean[]) ob;
                                        for(int i = 0; i < booleans.length; i++){
                                            if(booleans[i]){
                                                stringBuffer = stringBufferAdd(stringBuffer,field.getName(),"true");
                                            }else {
                                                stringBuffer = stringBufferAdd(stringBuffer,field.getName(),"false");
                                            }
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==short[].class||ob==Short[].class){
                                try {
                                    if(ob==short[].class){
                                        short[] shorts = (short[]) ob;
                                        for(int i = 0; i < shorts.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Short.valueOf(shorts[i]).toString());
                                        }
                                    }
                                    if(ob==Short[].class) {
                                        Short[] shorts = (Short[]) ob;
                                        for(int i = 0; i < shorts.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),shorts[i].toString());
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==long[].class||ob==Long[].class){
                                try {

                                    if(ob==long[].class){
                                        long[] longs = (long[]) ob;
                                        for(int i = 0; i < longs.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Long.valueOf(longs[i]).toString());
                                        }
                                    }
                                    if(ob==Long[].class) {
                                        Long[] longs = (Long[]) ob;
                                        for(int i = 0; i < longs.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),longs[i].toString());
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==float[].class||ob==Float[].class){
                                try {
                                    if(ob==float[].class){
                                        float[] floats = (float[]) ob;
                                        for(int i = 0; i < floats.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Float.valueOf(floats[i]).toString());
                                        }
                                    }
                                    if(ob==Float[].class) {
                                        Float[] floats = (Float[]) ob;
                                        for(int i = 0; i < floats.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),floats[i].toString());
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                            else if(ob==double[].class||ob==Double[].class){
                                try {
                                    if(ob==double[].class){
                                        double[] doubles = (double[]) ob;
                                        for(int i = 0; i < doubles.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),Double.valueOf(doubles[i]));
                                        }
                                    }
                                    if(ob==Double[].class) {
                                        Double[] doubles = (Double[]) ob;
                                        for(int i = 0; i < doubles.length; i++){
                                            stringBuffer = stringBufferAdd(stringBuffer,field.getName(),doubles[i].toString());
                                        }
                                    }
                                }catch (Exception e){
                                    e.printStackTrace();
                                }
                            }
                        }else if(ob instanceof Collection){
                            Iterator iterator = ((Collection)ob).iterator();
                            while (iterator.hasNext()){
                                Object ob1 = iterator.next();
                                String string = WsStringUtils.anyToString(ob1);
                                if(string != null){
                                    stringBuffer = stringBufferAdd(stringBuffer,field.getName(),string);
                                }
                            }
                        }else {
                            String string = WsStringUtils.anyToString(ob);
                            if(string != null){
                                stringBuffer = stringBufferAdd(stringBuffer,field.getName(),string);
                            }
                        }
                    }
                }

            }catch (Exception e){
                e.printStackTrace();
            }

        }
        if(stringBuffer.length()>0){
            return stringBuffer.substring(1,stringBuffer.length());
        }else {
            return null;
        }
    }


    public static String fileMapToString(Map<String,String> fieldMap, Map<String,File> fileMap,String fileName) throws Exception{
        Random random = new Random();
        int j;
        String getLine = "\r\n";
        String fileType = "Content-Type: application/octet-stream";
        String doubleBar = "--";
        biaoshi = "----WebKitFormBoundary";
        StringBuffer sb = new StringBuffer();
        for(int i = 0; i < 16;i++){
            j = random.nextInt(MULTIPART_CHARS.length-2)+2;
            sb.append(MULTIPART_CHARS[j]);
        }
        biaoshi = biaoshi + sb.toString();
        StringBuffer stringBuffer = new StringBuffer();



        for (Map.Entry<String,String> entity:fieldMap.entrySet()) {
            String name = "Content-Disposition: form-data; name=\""+entity.getKey()+"\"";
            stringBuffer.append(doubleBar+biaoshi);
            stringBuffer.append(getLine);
            stringBuffer.append(name);
            stringBuffer.append(getLine);
            stringBuffer.append(getLine);
            stringBuffer.append(entity.getValue());
            stringBuffer.append(getLine);
        }

        for (Map.Entry<String,File> entity:fileMap.entrySet()) {
            String name = "Content-Disposition: form-data; name=\""+fileName+"\"; filename=\""+entity.getValue().getName()+"\"";
            stringBuffer.append(doubleBar+biaoshi);
            stringBuffer.append(getLine);
            stringBuffer.append(name);
            stringBuffer.append(getLine);
            stringBuffer.append(fileType);
            stringBuffer.append(getLine);
            stringBuffer.append(getLine);
            File f = entity.getValue();
            FileInputStream fileInputStream = new FileInputStream(f);
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            byte by[] = new byte[1024];
            int k = 0;
            while ((k=fileInputStream.read(by))!=-1){
                byteArrayOutputStream.write(by,0,k);
            }
            by = byteArrayOutputStream.toByteArray();
            for(int i = 0; i < by.length; i++){
                stringBuffer.append(by[i]);
            }
            stringBuffer.append(getLine);
        }
        stringBuffer.append(doubleBar+biaoshi+doubleBar);
        return stringBuffer.toString();
    }

}

class HttpRequestBody{
    private List<HttpRequestBodyEntry> httpRequestBodyEntries = new ArrayList<>();
}

class HttpRequestBodyEntry{
    private String name;
    private String value;
    private File fileValue;
    private InputStream inputStreamValue;


}
