package org.ws.java.order.wsutils.nio;

import io.netty.buffer.ByteBuf;
import io.netty.buffer.Unpooled;
import io.netty.channel.ChannelHandlerContext;
import io.netty.handler.codec.ByteToMessageDecoder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.List;

public class HttpDecode extends ByteToMessageDecoder {
    private static Logger log = LoggerFactory.getLogger(HttpDecode.class);
    public static final byte[] bytes = "\r\n".getBytes();
    public static volatile int hender = 0;
    public static volatile int fooder = 0;
    public static volatile ThreadLocal<ByteBuf> threadLocal = new ThreadLocal<>();
    public static volatile long i = 0;
    public static volatile int num = 0;


    @Override
    protected void decode(ChannelHandlerContext ctx, ByteBuf in, List<Object> out) throws Exception {
       /*if(in.readableBytes()<4){
           return;
       }
       out.add(in);*/

         System.out.println("获取的缓存的大小："+in.readableBytes());
        /*if(in.readableBytes() < 128){
            return;
        }*/
        num++;
        if(threadLocal.get()==null){
            threadLocal.set(Unpooled.buffer());
        }

        ByteBuf byteBuf = threadLocal.get();
        while (in.isReadable()){
            i++;
            byte b = in.readByte();
            //System.out.print((char)b);
            byte b1[] = new byte[]{b};
            byteBuf.writeBytes(b1);
            if(b==bytes[0]||b==bytes[1]){
                if(hender==4){
                    fooder++;
                }else {
                    hender++;
                }
            }
            if(b!=bytes[0]&&b!=bytes[1]){
                if(hender==4){
                    fooder=0;
                }else {
                    hender=0;
                    fooder=0;
                }
            }
           /*if(hender==4){
                break;
            }*/
        }

        //if(num==37){
            System.out.println("获取头数量："+hender+"次\t获取尾巴数据："+fooder+"次\t循环了："+i+"次"+"\t解码："+num+"次");
            out.add(threadLocal.get());
            threadLocal.set(null);
            hender = 0;
            fooder = 0;
            i = 0;
            num = 0;
        //}

       /* if(hender==4){
            System.out.println("获取头数量："+hender+"次\t获取尾巴数据："+fooder+"次\t循环了："+i+"次"+"\t解码："+num+"次");
            out.add(threadLocal.get());
            threadLocal.set(null);
            hender = 0;
            fooder = 0;
            i = 0;
            num = 0;
        }
*/
    }
}
