package org.ws.java.order.controller;


import com.alibaba.fastjson.JSON;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.redis.core.BoundValueOperations;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.ws.java.order.annotation.Authority;
import org.ws.java.order.annotation.MyLog;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.controller.search.indexcontroller.CeShiSearch;
import org.ws.java.order.controller.search.indexcontroller.LoginUserSearch;
import org.ws.java.order.model.dto.UserRoleDTO;
import org.ws.java.order.model.po.*;
import org.ws.java.order.model.vo.AjaxVO;
import org.ws.java.order.model.vo.MenuVO;
import org.ws.java.order.model.vo.PageInfo;
import org.ws.java.order.model.vo.PageVO;
import org.ws.java.order.service.CityService;
import org.ws.java.order.service.MenuService;
import org.ws.java.order.service.RoleService;
import org.ws.java.order.service.UserService;
import org.ws.java.order.wsutils.DataBaseHandle.JpaDataHandle;
import org.ws.java.order.wsutils.DataBaseHandle.MySearchList;
import org.ws.java.order.wsutils.Encryption;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.*;
import java.nio.ByteBuffer;
import java.nio.channels.*;
import java.util.*;
import java.util.List;
import java.util.concurrent.TimeUnit;

@RestController
@Slf4j
@Api("主页")
public class IndexController extends BaseController {
    public static int k = 0;

    @Autowired
    private UserService userService;

    @Autowired
    private CityService cityService;

    @Autowired
    private RoleService roleService;

    @Autowired
    private MenuService menuService;

    @Autowired
    private RedisTemplate redisTemplate;

    @Autowired
    private CacheManager cacheManager;

    @Autowired
    private RoleHendleController roleHendleController;

    @RequestMapping(value = "/index")
    @Cacheable(cacheNames = "index")
    @ApiOperation(value = "测试用",httpMethod = "POST")
    public String index(){
        k++;
        BoundValueOperations boundValueOperations = redisTemplate.boundValueOps("你好世界");
        boundValueOperations.set("你好世界",20, TimeUnit.SECONDS);
        return "你好世界" + k;
    }


    @RequestMapping(value = "ceshi")
    @ApiOperation(value = "测试",httpMethod = "POST")
    @Authority(auto = true,companyName = "ceShiSearch.companys")
    public AjaxVO ceshi(@RequestBody CeShiSearch ceShiSearch){
        log.info(JSON.toJSONString(ceShiSearch));
        return AjaxVO.newAjax();
    }


    @RequestMapping(value = "insertuser")
    @ApiOperation(value = "用户注册" ,httpMethod = "POST")
    public AjaxVO insertUser(UserPO userPO){
        if(userPO == null){
            return AjaxVO.returnFailMsg("传入信息为空");
        }
        if(StringUtils.isEmpty(userPO.getUserName())){
            return AjaxVO.returnFailMsg("用户昵称为空");
        }
        if(StringUtils.isEmpty(userPO.getUserPhone())){
            return AjaxVO.returnFailMsg("用户电话号码为空");
        }
        if(userPO.getUserSex() == null) {
            return AjaxVO.returnFailMsg("用户性别为空");
        }
        if(StringUtils.isEmpty(userPO.getUserPassword())){
            return AjaxVO.returnFailMsg("用户密码为空");
        }
        userPO.setUserPassword(Encryption.md5Encoder(userPO.getUserPassword()));
        userPO.setCreateDate(new Date());
        userService.insertUser(userPO);
        return AjaxVO.returnSuccMsg("用户注册成功");
    }

    @RequestMapping(value = "loginUser",produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
    @MyLog(name = "用户登录")
    @ApiOperation(value = "用户登录",httpMethod = "POST")
    public AjaxVO loginUser(@RequestBody LoginUserSearch loginUserSearch){
        HttpSession session = getHttpSession();
        String userPhone = loginUserSearch.getUserPhone();
        String password = loginUserSearch.getPassword();
        String securityCode = loginUserSearch.getSecurityCode();
        if(StringUtils.isEmpty(userPhone)){
            return AjaxVO.returnFailMsg("登录名称为空");
        }
        if(StringUtils.isEmpty(password)){
            return AjaxVO.returnFailMsg("用户密码为空");
        }
        password = Encryption.md5Encoder(password);
        UserPO userPO = userService.selectUserByUserPhoneAndPassword(userPhone,password);
        if(userPO == null || userPO.getId() == null){
            return AjaxVO.returnFailMsg("电话号码或者密码错误");
        }
        if(StringUtils.isEmpty(securityCode)){
            return AjaxVO.returnFailMsg("验证码为空");
        }
        String mySecurityCode = (String) session.getAttribute(SystemConstants.SECURITYCODE);
        if(!securityCode.equals(mySecurityCode)){
            return AjaxVO.returnFailMsg("验证码错误");
        }
        UserRoleDTO userRoleDTO = roleHendleController.createUserRoleDTO(userPO);
        if(userRoleDTO.getUserMenuPOS()==null||userRoleDTO.getTopRolePOS() == null){
            return AjaxVO.returnFailMsg("用户没有任何权限");
        }
        List<MenuVO> menuVOS = roleHendleController.createMenuVOList(userPO);


        session.setAttribute(SystemConstants.USER,userPO);
        userPO.setUserPassword(null);
        AjaxVO ajaxVO = AjaxVO.newAjax();
        ajaxVO.putData("user",userPO);
        ajaxVO.putData("menu",menuVOS);
        return ajaxVO;
    }

    @RequestMapping(value = "selectuser")
    public AjaxVO selectUser(MySearchList mySearchList ,PageVO pageVO){
        mySearchList.add("id", JpaDataHandle.Operator.SORT,"desc");
        PageInfo<UserPO> userPOPageInfo = userService.selectUser(mySearchList,pageVO);
        AjaxVO ajaxVO = new AjaxVO();
        ajaxVO.putDataList(userPOPageInfo);
        return ajaxVO;
    }




    @RequestMapping(value = "createSecurityCode")
    @ApiOperation(value = "获取验证码",notes = "无需传入任何参数",httpMethod = "POST")
    public String createSecurityCode(){
        //HttpServletResponse response = getHttpServletResponse();
        HttpSession session = this.getHttpSession();
        OutputStream outputStream = null;
        try {
            //response.setContentType("image/jpeg");
            Random random = new Random();
            //outputStream = response.getOutputStream();
            BufferedImage bufferedImage = new BufferedImage(180,80,BufferedImage.TYPE_4BYTE_ABGR);
            Graphics2D graphics2D = bufferedImage.createGraphics();
            Font font = new Font(Font.SANS_SERIF,Font.PLAIN,60);
            graphics2D.setFont(font);
            Color color1 = new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255));
            Color color2 = new Color(255-color1.getRed(),255-color1.getGreen(),255-color1.getBlue());
            graphics2D.setColor(color1);
            graphics2D.fillRect(0,0,180,80);
            graphics2D.setColor(color2);
            StringBuffer stringBuffer = new StringBuffer();
            for(int i = 0 ; i < 4; i++){
                int k = random.nextInt(9);
                Graphics2D graphics2D1 = (Graphics2D) graphics2D.create();
                graphics2D1.translate((i*30)+30,60);
                graphics2D1.rotate(Math.toRadians(random.nextInt(60)-30));
                graphics2D1.drawString(k+"",0,0);
                stringBuffer.append(k);
            }
            for(int i = 0; i < random.nextInt(1000);i++){
                graphics2D.drawRect(random.nextInt(180),random.nextInt(80),1,1);
            }
            font = new Font(Font.SANS_SERIF,Font.PLAIN,30);
            graphics2D.setFont(font);
            for(int i = 0; i < 100; i++){
                int x1 = random.nextInt(150);
                int y1 = random.nextInt(50);
                int x2 = x1 + random.nextInt(30);
                int y2 = y1 + random.nextInt(30);
                graphics2D.setColor(new Color(random.nextInt(255),random.nextInt(255),random.nextInt(255)));
                graphics2D.drawLine(x1,y1,x2,y2);
            }
            session.setAttribute(SystemConstants.SECURITYCODE,stringBuffer.toString());
            log.info("验证码为："+stringBuffer.toString());
            ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
            ImageIO.write(bufferedImage,"jpg",byteArrayOutputStream);
            /*ByteBuffer byteBuffer = ByteBuffer.wrap(byteArrayOutputStream.toByteArray());
            WritableByteChannel writableByteChannel = Channels.newChannel(outputStream);
            while (byteBuffer.hasRemaining()){
                writableByteChannel.write(byteBuffer);
            }*/
            String str = "data:image/jpeg;base64," + Base64.getEncoder().encodeToString(byteArrayOutputStream.toByteArray());
            //byteBuffer.clear();
            byteArrayOutputStream.flush();
            byteArrayOutputStream.close();
            //writableByteChannel.close();
            /*outputStream.flush();
            outputStream.close();*/
            bufferedImage.flush();


            return str;

        }catch (Exception e){
            e.printStackTrace();
            return null;
        }

    }


    /*@RequestMapping(value = "insertcity")
    public void insertCity(){
        FileInputStream fileInputStream = null;
        ByteBuffer byteBuffer = null;
        ReadableByteChannel readableByteChannel = null;
        WritableByteChannel writableByteChannel = null;
        ByteArrayOutputStream byteArrayOutputStream = null;
        try {
            File file = new File("D:/新建文件夹 (2)/iBiliPlayer-blue-bilibili/assets/china_area_list.json");
            fileInputStream = new FileInputStream(file);
            byteArrayOutputStream = new ByteArrayOutputStream();
            readableByteChannel = Channels.newChannel(fileInputStream);
            writableByteChannel = Channels.newChannel(byteArrayOutputStream);
            byteBuffer = ByteBuffer.allocate(1024);
            while (readableByteChannel.read(byteBuffer) != -1){
                byteBuffer.flip();
                writableByteChannel.write(byteBuffer);
                byteBuffer.clear();
            }
            byte bytes[] = byteArrayOutputStream.toByteArray();
            byteArrayOutputStream.flush();
            String string = new String(bytes,"UTF-8");
            List list = (List) JSON.parseArray(string);
            Long pid = 0l;
            Long pid1  = 0l;
            for (int i = 0; i < list.size(); i++){
                pid = 0l;
                Map map = (Map)list.get(i);
                CityPO cityPO = new CityPO();
                cityPO.setName((String) map.get("name"));
                cityPO.setCode(WsPinYinUtils.getPinYinHeadChar((String) map.get("name")));
                cityPO.setParentId(pid);
                cityPO.setDeep(1);
                pid = cityService.insterCity(cityPO);
                if(map.get("cities") != null){
                    List cityList = (List)map.get("cities");
                    if(cityList != null){
                        for(int j = 0; j < cityList.size(); j++){
                            pid1 = 0l;
                            Map map1 = (Map) cityList.get(j);
                            cityPO = new CityPO();
                            cityPO.setName((String)map1.get("name"));
                            cityPO.setCode(WsPinYinUtils.getPinYinHeadChar((String)map1.get("name")));
                            cityPO.setParentId(pid);
                            cityPO.setDeep(2);
                            pid1 = cityService.insterCity(cityPO);
                            if(map1.get("areas") != null){
                                List areasList = (List) map1.get("areas");
                                if(areasList != null){
                                    for(int k = 0; k < areasList.size(); k++){
                                        String areaName = (String)areasList.get(k);
                                        cityPO = new CityPO();
                                        cityPO.setParentId(pid1);
                                        cityPO.setName(areaName);
                                        cityPO.setCode(WsPinYinUtils.getPingYin(areaName));
                                        cityPO.setDeep(3);
                                        cityService.insterCity(cityPO);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            System.out.println(string);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            try {
                if(byteBuffer != null){
                    byteBuffer.clear();
                }
                if(writableByteChannel != null){
                    writableByteChannel.close();
                }
                if(readableByteChannel != null) {
                    readableByteChannel.close();
                }
                if(byteArrayOutputStream != null){
                    byteArrayOutputStream.flush();
                    byteArrayOutputStream.close();
                }
            }catch (Exception e){
                e.printStackTrace();
            }
        }
    }*/
}
