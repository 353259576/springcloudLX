package org.ws.java.order.wsutils.nio;

import io.netty.buffer.ByteBuf;
import io.netty.channel.*;

import java.util.concurrent.atomic.AtomicInteger;

public class DiscardOutBoundServerHandler extends ChannelOutboundHandlerAdapter {

    public final static AtomicInteger atomicInteger = new AtomicInteger(0);


    @Override
    public void write(ChannelHandlerContext ctx, Object msg, ChannelPromise promise) throws Exception {
        atomicInteger.getAndIncrement();
        String httpResponse = "HTTP/1.1 200 OK\r\n" +
                "Content-Length: 37\r\n" +
                "Content-Type:text/html;charset=utf-8\r\n" +
                "\r\n" +
                "<html><body>你好，世界！"+atomicInteger.get()+"</body></html>";
        ByteBuf byteBuf1 = ctx.alloc().buffer(4);
        byteBuf1.writeBytes(httpResponse.getBytes());
        ChannelFuture channelFuture = ctx.writeAndFlush(byteBuf1);
        channelFuture.addListener(new ChannelFutureListener() {
            @Override
            public void operationComplete(ChannelFuture future) throws Exception {
                if(future==channelFuture){
                    ctx.close();
                }
            }
        });
        //super.write(ctx, msg, promise);
    }

}
