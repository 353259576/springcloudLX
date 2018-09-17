package org.ws.java.order.wsutils;

import com.gargoylesoftware.htmlunit.BrowserVersion;
import com.gargoylesoftware.htmlunit.NicelyResynchronizingAjaxController;
import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

import java.io.File;
import java.io.FileOutputStream;
import java.nio.ByteBuffer;
import java.nio.channels.FileChannel;

public class HtmlunitUtils {

    public static void main(String[] args) {
        try {
            WebClient webClient = new WebClient(BrowserVersion.CHROME);
            webClient.getOptions().setThrowExceptionOnScriptError(false);
            webClient.getOptions().setThrowExceptionOnFailingStatusCode(false);
            webClient.getOptions().setJavaScriptEnabled(true);
            webClient.getOptions().setCssEnabled(false);
            webClient.getOptions().setUseInsecureSSL(true);
            webClient.setAjaxController(new NicelyResynchronizingAjaxController());
            HtmlPage htmlPage = webClient.getPage("http://test.lieshoujianzhi.com/view/jobDetails.html?id=3907");
            File file = new File("D:/图片/1.html");
            String str = htmlPage.asXml();
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            FileChannel fileChannel = fileOutputStream.getChannel();
            ByteBuffer byteBuffer = ByteBuffer.wrap(str.getBytes());
            while (byteBuffer.hasRemaining()){
                fileChannel.write(byteBuffer);
            }
            byteBuffer.clear();
            System.out.println(str);
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
