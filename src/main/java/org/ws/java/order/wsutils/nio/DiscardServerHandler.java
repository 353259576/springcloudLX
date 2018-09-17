package org.ws.java.order.wsutils.nio;

import com.alibaba.fastjson.JSON;
import io.netty.buffer.ByteBuf;
import io.netty.channel.ChannelHandlerContext;
import io.netty.channel.ChannelInboundHandlerAdapter;
import io.netty.channel.group.ChannelGroup;
import io.netty.channel.group.DefaultChannelGroup;
import io.netty.util.concurrent.GlobalEventExecutor;

public class DiscardServerHandler extends ChannelInboundHandlerAdapter {

    public static ChannelGroup channels = new DefaultChannelGroup(GlobalEventExecutor.INSTANCE);


    //第二
    @Override
    public void channelActive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************连接开始************");
        System.out.println("二");
        super.channelActive(ctx);
        System.out.println("***************连接完成************");
    }


    //第五
    @Override
    public void channelInactive(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************正在连接开始************");
        System.out.println("五");
        super.channelInactive(ctx);
        System.out.println("***************正在连接完成************");
    }

    //第一
    @Override
    public void channelRegistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************注册开始************");
        System.out.println("一");
        super.channelRegistered(ctx);
        System.out.println("***************注册完成************");
    }


    @Override
    public void userEventTriggered(ChannelHandlerContext ctx, Object evt) throws Exception {
        System.out.println("***************事件触发开始************");
        super.userEventTriggered(ctx, evt);
        System.out.println("***************事件触发完成************");
    }


    //第六
    @Override
    public void channelUnregistered(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************解除注册开始************");
        System.out.println("六");
        super.channelUnregistered(ctx);
        System.out.println("***************解除注册完成************");
    }


    //第四
    @Override
    public void channelReadComplete(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************读取完成开始************");
        System.out.println("四");
        super.channelReadComplete(ctx);
        System.out.println("***************读取完成完成************");
    }

    @Override
    public void channelWritabilityChanged(ChannelHandlerContext ctx) throws Exception {
        System.out.println("***************通道可写性改变开始************");
        super.channelWritabilityChanged(ctx);
        System.out.println("***************通道可写性改变关闭************");
    }

    //第三
    @Override
    public void  channelRead(ChannelHandlerContext ctx, Object msg) throws Exception {
        System.out.println("***************读取开始************");
        System.out.println("三");
        System.out.println(JSON.toJSONString(msg));
        //((ByteBuf)msg).release();
        ByteBuf byteBuf = (ByteBuf)msg;
        System.out.println("读取缓存大小为："+byteBuf.readableBytes());
        try {
           while (byteBuf.isReadable()){
                System.out.print((char) byteBuf.readByte());
                //System.out.flush();
            }


        }finally {
            //ReferenceCountUtil.release(msg);
        }
        ctx.write(msg);
        ctx.flush();
        //ctx.fireChannelRead(msg);
        System.out.println("***************读取完成************");
        //super.channelRead(ctx, msg);
    }

    @Override
    public void exceptionCaught(ChannelHandlerContext ctx, Throwable cause) throws Exception {
        System.out.println("***************错误开始************");
        cause.printStackTrace();
        ctx.close();
        System.out.println("***************错误完成************");
    }
}
