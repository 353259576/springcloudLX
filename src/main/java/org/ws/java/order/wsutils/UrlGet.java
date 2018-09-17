package org.ws.java.order.wsutils;

import javax.net.ssl.*;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.KeyStore;
import java.security.SecureRandom;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.*;
import java.util.concurrent.BlockingQueue;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingQueue;
import java.util.concurrent.ScheduledThreadPoolExecutor;

public class UrlGet {
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


	public static volatile Map<String,Object> map = new HashMap<>();
	public static volatile BlockingQueue<String> queue = new LinkedBlockingQueue<>();
	public static volatile List<String> exceptionUrl = Collections.synchronizedList(new ArrayList<>());

	static{
		list.add(hrefList);
		list.add(htmlList);
		list.add(htmlList1);
		list.add(wwwList);
		//list.add(dianList);
	}


	public static void main(String[] args) {


		//System.out.println(decodeUnicode("http://m.doumi.com/list/more/?order=0&lat=&lng=&more=a&pageSize=10&interface%5Buuid%5D=5c7e3866-21e9-11e8-a365-1418774d0625&interface%5Breqid%5D=949f81bbfdb3c80a2abd4cbbb52a9954&interface%5Blat%5D=&interface%5Blng%5D=&offset=4&page=5&pageSize=10"));

		//System.out.println(UrlStringHandle("https://www.bilibili.com","./././ws/ws/ws.jpg"));

		String MYURL = "http://m.lieshoujianzhi.com/";
		String myPath = "C:/Users/ws/Documents/5";
		queue.add(MYURL);
		ExecutorService executorService = new ScheduledThreadPoolExecutor(4);

		for (int z = 0; z < 4; z++) {
			executorService.execute(() -> {


				while (true) {
					String url = null;
					try {
						url = queue.take();
					} catch (Exception e) {
						e.printStackTrace();
					}
					synchronized (map) {
						System.out.println(url);
						//System.out.println(JSON.toJSONString(map));
						if (map.get(url) == null) {
							map.put(url, null);

							Map map1 = urlLink(url, "GET", null, null, null);
							if(map1==null){
								//System.out.println("url");
								exceptionUrl.add(url);
								continue;
							}

							String urlPath = url.substring(url.indexOf("//") + 2, url.length());
							String[] pathAll = urlPath.split("/");
							File file;
							String filepath = myPath;
							if (pathAll != null) {
								for (int i = 0; i < pathAll.length - 1; i++) {
									filepath = filepath + "/" + pathAll[i];
								}
								file = new File(filepath);
								if (!file.exists()) {
									file.mkdirs();
								}
							}
							try {
								//Map map1 = urlLink(url, "GET", null, null, null);
								if (map1 == null) {
									exceptionUrl.add(url);
								} else {
									byte bytes[] = (byte[]) map1.get("output");
									String htmlType = (String) map1.get("type");
									boolean isHtml = true;
									String filename = "";

									if (url.endsWith("/")) {
										if(url.endsWith(".com/") || url.endsWith(".cn/") || url.endsWith(".org/")){
											filename = urlPath.substring(0,urlPath.length()-1)+".html";
										}else {
											filename = "index.html";
										}

									}else if(url.endsWith(".com") || url.endsWith(".cn") || url.endsWith(".org")){
										filename = urlPath.substring(0,urlPath.length()-1)+".html";
									}
										else {
										if (pathAll == null) {
											filename = "index";
										} else {
											if (pathAll[pathAll.length - 1] == null) {
												filename = "index";
											} else {
												filename = pathAll[pathAll.length - 1];
												if (pathAll[pathAll.length - 1].contains(".")) {

												} else {
													if (htmlType != null) {
														if (htmlType.contains(HTMLTYPE)) {
															filename += ".html";
														} else if (htmlType.contains(IMAGETYPE)) {
															filename += "." + htmlType.substring(IMAGETYPE.length() + 1, htmlType.length());
															isHtml = false;
														} else if (htmlType.contains(JSTYPE)) {
															filename += ".js";
														} else if (htmlType.contains(JSONTYPE)) {
															filename += ".json";
														} else {
															filename += ".txt";
															//isHtml = false;
														}
													} else {
														filename += ".html";
													}
												}
											}
										}
									}

									file = new File(filepath + "/" + filename);
									if (!file.exists()) {
										System.out.println(filepath + "/" + filename);
										file.createNewFile();
									}
									OutputStream fileInputStream = new FileOutputStream(file);
									fileInputStream.write(bytes);
									fileInputStream.close();
									if (isHtml) {
										Set<String> set = new HashSet<>();
										getHtmlUrl(new String(bytes), MYURL, set);
										Iterator<String> iterator = set.iterator();
										while (iterator.hasNext()) {
											queue.put(iterator.next());
										}
									}
								}


							} catch (Exception e) {
								//System.out.println("url");
								exceptionUrl.add(url);
								e.printStackTrace();

							}

						}
					}
				}
			});
		}
	}





	public static void getHtmlUrl(String string,String url,Set<String> urlStr){
		//Queue<String> urlStr = new ConcurrentLinkedQueue<String>();
		char ch[] = string.toCharArray();
		for(int i = 0; i < ch.length; i++){

			i = isTrueUrl(i,ch,url,urlStr);


		}
	}


	/**
	 * 判断是否为正确的url
	 * @param k
	 * @param ch
	 * @param urlStr
	 * @return
	 */
	public static int isTrueUrl(int k,char ch[],String url,Set<String> urlStr){

		for (char pach[]:list){
			int i = k;
			boolean pd = true;
			for(int j = 0; j<pach.length; j++){
				if(pach[j]!=ch[i]){
					pd = false;
					break;
				}
				i++;
			}
			if(pd==true){
				StringBuffer stringBuffer = new StringBuffer();
				//i++;
				for(;i<ch.length; i++){
					if(ch[i]=='"'||ch[i]=='\''){
						String s = stringBuffer.toString();
						if(!s.startsWith("javascript")){
							s = decodeUnicode(s);
							urlStr.add(UrlStringHandle(url,s));
						}
						return i;
					}
					stringBuffer.append(ch[i]);
				}
			}
		}
		return k;

	}



	/**
	 * 拼接URL成完整的URL
	 * @param url
	 * @param path
	 * @return
	 */
	public static String UrlStringHandle(String url,String path){



		if(path.startsWith("http")){
			return path;
		}
		if(path.startsWith("//www")){
			if(url.startsWith("https")){
				return "https:/"+path;
			}else {
				return "http:/"+path;
			}
		}

		if(path.startsWith("/www")){
			if(url.startsWith("https")){
				return "https:/"+path;
			}else {
				return "http:/"+path;
			}
		}
		if(path.startsWith("://")){
			if(url.startsWith("https")){
				return "https"+path;
			}else {
				return "http"+path;
			}
		}

		if(path.startsWith("//")){
			if(url.startsWith("https")){
				return "https:"+path;
			}else {
				return "http:"+path;
			}
		}

		if(path.startsWith("www")){
			if(url.startsWith("https")){
				return "https://"+path;
			}else {
				return "http://"+path;
			}
		}







		if(url.endsWith("/")){
			url = url.substring(0,url.length()-1);
		}
		if(url.contains("?")){
			url = url.substring(0,url.indexOf("?"));
		}







		int jie = 0;
		char urlChars[] = url.toCharArray();
		String str1 = "";
		List<String> urlList = new ArrayList<>();
		for(int i = 0; i < urlChars.length; i++){
			if(urlChars[i]=='/'){
				jie++;
			}
			if(urlChars[i]=='/'){
				if(jie > 2){
					urlList.add(str1);
					str1 = "";
				}else {
					str1 += urlChars[i];
				}
			}else if(i==urlChars.length-1){
				str1 += urlChars[i];
				urlList.add(str1);
			} else {
				str1 += urlChars[i];
			}

		}
		//return JSON.toJSONString(urlList);


		if(path.contains("./")){
			int dian = 0;
			int pa = 0;
			while (pa>-1){
				pa = path.indexOf("./");
				if(pa > -1){
					path = path.replaceFirst("./","");
					dian ++;
				}
			}
			String returnUrl = urlList.get(0);
			if(urlList.size()-dian>0){
				for(int i = 1; i < urlList.size()-dian; i++){
					returnUrl = returnUrl +"/"+urlList.get(i);
				}
			}
			return returnUrl+"/"+path;
		}

		/*if(path.startsWith("./")){
			path = path.substring(1,path.length());
		}*/

		url = urlList.get(0)+"/";

		/*if(!url.endsWith("/")){
			url += "/";
		}*/
		if(path.startsWith("/")){
			path = path.substring(1,path.length());
		}
		return url+path;
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
				if(i + 7<ch.length&&ch[i+3]=='%'&&ch[i+6]=='%'){
					String str = "";
					byte by[] = new byte[3];
					for(int j = 0; j < 2; j++){
						i++;
						str += ch[i];
						str = str.toUpperCase();
						byte letter = (byte) Integer.parseInt(str, 16);
						by[0] = letter;
					}
					i++;
					str = "";
					for(int j = 0; j < 2; j++){
						i++;
						str += ch[i];
						str = str.toUpperCase();
						byte letter = (byte) Integer.parseInt(str, 16);
						by[1] = letter;
					}
					i++;
					str = "";
					for(int j = 0; j < 2; j++){
						i++;
						str += ch[i];
						str = str.toUpperCase();
						byte letter = (byte) Integer.parseInt(str, 16);
						by[2] = letter;
					}
					str = new String(by);
					char ch1[] = str.toCharArray();
					for(int z = 0; z < ch1.length; z++){
						buffer.append(ch1[z]);
					}
				}
			}
			else {
				buffer.append(ch[i]);
			}
		}
		return buffer.toString();
	}

	/**
	 * 页面请求接口
	 * @param urlpath
	 * @param method
	 * @param data
	 * @param pkcsPath
	 * @param pkcsPassword
	 * @return
	 */
	public static Map urlLink(String urlpath, String method, String data, String pkcsPath, String pkcsPassword) {
		BufferedInputStream bufferedInputStream = null;
		InputStream inputStream = null;
		DataInputStream dataInputStream = null;
		BufferedReader bufferedReader = null;
		BufferedOutputStream bufferedOutputStream = null;
		OutputStream outputStream = null;
		Integer resultCode = null;
		ByteArrayOutputStream byteArrayOutputStream = null;
		String textType = null;
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
						//System.out.println("调用了本函数");
						return new X509Certificate[0];
					}
				}};
				if (pkcsPath == null) {
					sslContext.init(null, trustManager, new SecureRandom());
				} else {
					File file = new File(pkcsPath);
					KeyStore keyStore = KeyStore.getInstance("PKCS12");
					keyStore.load(new FileInputStream(file), pkcsPassword.toCharArray());
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
				httpsURLConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				httpsURLConnection.setRequestProperty("Connection", "Keep-Alive");// 维持长连接
				httpsURLConnection.setRequestProperty("Charset", "UTF-8");
				httpsURLConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2");
				httpsURLConnection.connect();
				if(data!= null) {
					outputStream = httpsURLConnection.getOutputStream();
					bufferedOutputStream = new BufferedOutputStream(outputStream);
					bufferedOutputStream.write(data.getBytes());
					bufferedOutputStream.flush();
					bufferedOutputStream.close();
				}
				resultCode = httpsURLConnection.getResponseCode();
				//System.out.println(resultCode);
				inputStream = httpsURLConnection.getInputStream();
				textType = httpsURLConnection.getRequestProperty("Content-Type");

			} else {
				HttpURLConnection urlConnection = (HttpURLConnection) url.openConnection();
				if (data != null) {
					urlConnection.setDoInput(true);
				}
				urlConnection.setDoOutput(true);
				urlConnection.setRequestMethod(method);
				urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				urlConnection.setRequestProperty("Content-Type", "application/json;charset=UTF-8");
				urlConnection.setRequestProperty("Connection", "Keep-Alive");// 维持长连接
				urlConnection.setRequestProperty("Charset", "UTF-8");
				urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/55.0.2");
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
				textType = urlConnection.getRequestProperty("Content-Type");
			}
			if(resultCode == HttpURLConnection.HTTP_OK){
				byteArrayOutputStream = new ByteArrayOutputStream();
				byte by[] = new byte[1024];
				bufferedInputStream = new BufferedInputStream(inputStream);
				int k = 0;
				while ((k =bufferedInputStream.read(by))!= -1){
					byteArrayOutputStream.write(by,0,k);
				}
				Map map = new HashMap();
				map.put("output",byteArrayOutputStream.toByteArray());
				map.put("code",resultCode);
				map.put("type",textType);
				return map;
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
		}
		return null;

	}


	public static String mapToTxt(Map<String,String> fieldMap, Map<String,File> fileMap,String fileName) throws Exception{
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
