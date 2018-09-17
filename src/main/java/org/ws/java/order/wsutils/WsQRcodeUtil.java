package org.ws.java.order.wsutils;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Hashtable;

public class WsQRcodeUtil {
    public static void main(String[] args) {
        try {
            File file = new File("D:/1.png");
            if(!file.exists()) {
                file.createNewFile();
            }
            String str = "http://www.bilibili.com";
            byte[] bytes = createQrcode(str,1400);
            FileOutputStream fileOutputStream = new FileOutputStream(file);
            fileOutputStream.write(bytes);
            fileOutputStream.flush();
            fileOutputStream.close();
        }catch (Exception e){
            e.printStackTrace();
        }
    }


    public static byte[] createQrcode(String str,int codeSize){
        try {
            Hashtable<EncodeHintType,Object> hints = new Hashtable<>();
            hints.put(EncodeHintType.CHARACTER_SET,"UTF-8");
            hints.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.Q);
            hints.put(EncodeHintType.MARGIN,1);
            hints.put(EncodeHintType.QR_VERSION, 10);
            BitMatrix bitMatrix = new MultiFormatWriter().encode(str, BarcodeFormat.QR_CODE,codeSize,codeSize,hints);
            int width = bitMatrix.getWidth();
            int height = bitMatrix.getHeight();
            BufferedImage bufferedImage = new BufferedImage(width,height,BufferedImage.TYPE_4BYTE_ABGR);
            bufferedImage = setBackground(bufferedImage,ImageIO.read(new File("D:/图片/fuka_c4.png")));
            for(int y = 0; y < height; y++){
                for(int x = 0; x < width; x++){
                    /*if(bitMatrix.get(x,y)){
                        pixels[y*width + x] = 0xff000000;
                    }else {
                        pixels[y*width + x] = 0xffffffff;
                    }*/
                    //bufferedImage.setRGB(x,y,bitMatrix.get(x,y) ? 0xFF000000 : 0xFFFFFFFF);
                    if(bitMatrix.get(x,y)){
                        bufferedImage.setRGB(x,y,0xFF231F20);
                    }else {
                        //bufferedImage.setRGB(x,y,0xffffffff);
                    }
                    //bufferedImage.setRGB(x,y,bitMatrix.get(x,y) ? 0xFF000000 : 0xFF800080);
                }
            }


            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage,"png",byteArrayOutputStream);
            byte bytes[] = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
            return bytes;

        }catch (Exception e){
            e.printStackTrace();
        }
        return null;

    }


    /**
     * 缩小图片
     * @param oldBufferedImage
     * @param shrink
     * @return
     */
    public static BufferedImage shrinkImage(BufferedImage oldBufferedImage,int shrink){
        int hight = oldBufferedImage.getHeight();
        int width = oldBufferedImage.getWidth();
        int sHight = hight/shrink;
        int sWidth = width/shrink;
        BufferedImage bufferedImage = new BufferedImage(sWidth,sHight,BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(oldBufferedImage,0,0,sWidth,sHight,null);
        oldBufferedImage.flush();
        return bufferedImage;
    }

    /**
     * 放大图片
     * @param oldBufferedImage
     * @param magnify
     * @return
     */
    public static BufferedImage magnifyImage(BufferedImage oldBufferedImage,int magnify){
        int hight = oldBufferedImage.getHeight();
        int width = oldBufferedImage.getWidth();
        int mHight = hight*magnify;
        int mWidth = width*magnify;
        BufferedImage bufferedImage = new BufferedImage(mWidth,mHight,BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(oldBufferedImage,0,0,mWidth,mHight,null);
        oldBufferedImage.flush();
        return bufferedImage;
    }


    /**
     * 设置图片背景
     * @param frontBufferedImage
     * @param backBuffedImage
     * @return
     */
    public static BufferedImage setBackground(BufferedImage frontBufferedImage,BufferedImage backBuffedImage){
        int width = frontBufferedImage.getWidth();
        int hight = frontBufferedImage.getHeight();
        BufferedImage bufferedImage = new BufferedImage(width,hight,BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(backBuffedImage,0,0,width,hight,null);
        graphics2D.drawImage(frontBufferedImage,0,0,width,hight,null);
        backBuffedImage.flush();
        frontBufferedImage.flush();
        return  bufferedImage;
    }

    /**
     * 图片中央设置标志
     * @param backBufferedImage
     * @param logoBufferedImage
     * @param shrink
     * @return
     */
    public static BufferedImage setLogo(BufferedImage backBufferedImage,BufferedImage logoBufferedImage,int shrink){
        int width = backBufferedImage.getWidth();
        int hight = backBufferedImage.getHeight();
        int logoWidth = width/shrink;
        int logoHight = hight/shrink;
        BufferedImage bufferedImage = new BufferedImage(width,hight,BufferedImage.TYPE_4BYTE_ABGR);
        Graphics2D graphics2D = bufferedImage.createGraphics();
        graphics2D.setRenderingHint(RenderingHints.KEY_ANTIALIASING,RenderingHints.VALUE_ANTIALIAS_ON);
        graphics2D.drawImage(backBufferedImage,0,0,width,hight,null);
        graphics2D.drawImage(logoBufferedImage,(width-logoWidth)/2,(hight-logoHight)/2,logoWidth,logoHight,null);
        backBufferedImage.flush();
        logoBufferedImage.flush();
        return bufferedImage;
    }

}
