package org.ws.java.order.wsutils;

import io.netty.buffer.ByteBuf;
import io.netty.channel.ServerChannel;

import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.util.concurrent.DelayQueue;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

public class FileUtils {
    public static void main(String[] args) {
        //DelayQueue delayQueue = new DelayQueue();
        /*try {
            FileInputStream fileInputStream = new FileInputStream("D:/图片/1.png");
            System.out.println(fileSave(fileInputStream,"D:/图片/ws1.png"));
        }catch (Exception e){
            e.printStackTrace();
        }*/

        ByteBuffer byteBuffer = ByteBuffer.allocate(1000);
        byteBuffer.compact();
        System.out.println(byteBuffer);

    }

    public static void copyFile(){
        try {
            long startTime = System.currentTimeMillis();
            FileInputStream fileInputStream = new FileInputStream("D:/图片/1.zip");
            FileChannel channelIn = fileInputStream.getChannel();
            FileOutputStream fileOutputStream = new FileOutputStream("D:/图片/3.zip");
            FileChannel channelOut = fileOutputStream.getChannel();
            int i = 0;
            if(channelIn.size()>Integer.MAX_VALUE){
                i = Integer.MAX_VALUE;
            }else {
                i = (int)channelIn.size();
            }
            ByteBuffer byteBuffer = ByteBuffer.allocate(i);
            int k = 0;
            while ((k = channelIn.read(byteBuffer)) != -1){
                byteBuffer.flip();
                while (byteBuffer.hasRemaining()){
                    channelOut.write(byteBuffer);
                }
                byteBuffer.clear();

            }
            ServerSocketChannel serverSocketChannel = ServerSocketChannel.open();
            //channelIn.transferTo(0,channelIn.size(),channelOut);
            long endTime = System.currentTimeMillis();
            System.out.println("非阻赛花费时间为："+(endTime-startTime)+"毫秒");
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    public static void copyFile2(){
        try {
            long startTime = System.currentTimeMillis();
            FileInputStream fileInputStream = new FileInputStream("D:/图片/1.zip");
            FileOutputStream fileOutputStream = new FileOutputStream("D:/图片/4.zip");
            byte bytes[] = new byte[fileInputStream.available()];
            int k = 0;
            while ((k = fileInputStream.read(bytes)) != -1){
                fileOutputStream.write(bytes,0,k);
            }
            long endTime = System.currentTimeMillis();
            System.out.println("阻塞花费时间为："+(endTime-startTime)+"毫秒");
        }catch (Exception e){
            e.printStackTrace();
        }
    }

    public static void copyFile3(){
        try {
            long startTime = System.currentTimeMillis();
            FileInputStream fileInputStream = new FileInputStream("D:/图片/1.zip");
            FileOutputStream fileOutputStream = new FileOutputStream("D:/图片/5.zip");
            BufferedInputStream bufferedInputStream = new BufferedInputStream(fileInputStream);
            BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(fileOutputStream);
            byte bytes[] = new byte[2048];
            int k = 0;
            while ((k = bufferedInputStream.read(bytes)) != -1){
                bufferedOutputStream.write(bytes,0,k);
            }
            long endTime = System.currentTimeMillis();
            System.out.println("缓存阻塞花费时间为："+(endTime-startTime)+"毫秒");
        }catch (Exception e){
            e.printStackTrace();
        }
    }




    public static boolean fileSave(InputStream inputStream,String filePath){
        if(inputStream == null){
            return false;
        }
        FileOutputStream fileOutputStream = null;
        ReadableByteChannel readableByteChannel = null;
        WritableByteChannel writableByteChannel = null;
        try {
            File file = new File(filePath);
            File file1 = file.getParentFile();
            if(file1 != null) {
                if (!file1.exists()) {
                    file1.mkdirs();
                }
            }
            if(!file.exists()) {
                file.createNewFile();
            }
            fileOutputStream = new FileOutputStream(file);
            writableByteChannel = fileOutputStream.getChannel();
            readableByteChannel = Channels.newChannel(inputStream);
            ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
            while (readableByteChannel.read(byteBuffer) != -1){
                byteBuffer.flip();
                while (byteBuffer.hasRemaining()) {
                    writableByteChannel.write(byteBuffer);
                }
                byteBuffer.compact();
            }
            byteBuffer.clear();
            return true;
        }catch (Exception e){
            e.printStackTrace();
            return false;
        }finally {
            try {
                if(writableByteChannel != null){
                    writableByteChannel.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                writableByteChannel = null;
            }

            try {
                if(readableByteChannel != null){
                    readableByteChannel.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                readableByteChannel = null;
            }

            try {
                if(fileOutputStream != null){
                    fileOutputStream.flush();
                    fileOutputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                fileOutputStream = null;
            }
            try {
                if(inputStream != null){
                    inputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }




    public static byte[] encodeFileToZip(File...files){
        try {
            InputStream inputStreams[] = new InputStream[files.length];
            String fileNames[] = new String[files.length];
            for(int i = 0; i < files.length; i++){
                inputStreams[i] = new FileInputStream(files[i]);
                fileNames[i] = files[i].getName();
            }
            return encodeFileToZip(inputStreams,fileNames);
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }


    public static byte[] encodeFileToZip(InputStream inputStreams[],String fileNames[]){
        Long startTime = System.currentTimeMillis();
        ZipOutputStream zipOutputStream = null;
        ByteArrayOutputStream byteArrayOutputStream = null;
        WritableByteChannel writableByteChannel = null;
        try {

            byteArrayOutputStream = new ByteArrayOutputStream();
            zipOutputStream = new ZipOutputStream(byteArrayOutputStream);
            zipOutputStream.setLevel(7);
            zipOutputStream.setMethod(ZipOutputStream.DEFLATED);
            zipOutputStream.setComment(new String("Java压缩".getBytes("utf-8"),"ASCII"));
            writableByteChannel = Channels.newChannel(zipOutputStream);
            ByteBuffer byteBuffer = ByteBuffer.allocate(1024);
            for(int i = 0; i < inputStreams.length; i++){
                ZipEntry zipEntry  = new ZipEntry(fileNames[i]);
                zipOutputStream.putNextEntry(zipEntry);
                ReadableByteChannel readableByteChannel= Channels.newChannel(inputStreams[i]);
                while (readableByteChannel.read(byteBuffer) != -1){
                    byteBuffer.flip();
                    while (byteBuffer.hasRemaining()){
                        writableByteChannel.write(byteBuffer);
                    }
                    byteBuffer.clear();
                }
                zipOutputStream.closeEntry();
                readableByteChannel.close();
                inputStreams[i].close();
            }
            zipOutputStream.finish();
            return byteArrayOutputStream.toByteArray();
        }catch (Exception e){
            e.printStackTrace();
            return null;
        }finally {
            try {
                if(writableByteChannel != null){
                    writableByteChannel.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }

            try {
                if(zipOutputStream != null){
                    zipOutputStream.flush();
                    zipOutputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }


            try {
                if(byteArrayOutputStream != null){
                    byteArrayOutputStream.flush();
                    byteArrayOutputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }

            try {
                if(inputStreams != null){
                    for(int i = 0; i < inputStreams.length; i++){
                        inputStreams[i].close();
                    }
                }
            }catch (Exception e){
                e.printStackTrace();
            }
            Long endTime = System.currentTimeMillis();
            System.out.println("系统压缩文件需要："+(endTime-startTime)+"毫秒");
        }

    }
}
