package org.ws.java.order.model.dto;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import org.apache.commons.lang.StringUtils;
import org.ws.java.order.model.po.MenuPO;
import org.ws.java.order.model.po.RolePO;
import org.ws.java.order.service.UserRoleService;
import org.ws.java.order.wsutils.WsStringUtils;

import java.io.Serializable;
import java.util.*;
import java.util.concurrent.Delayed;
import java.util.concurrent.TimeUnit;

@Getter
@Setter
public class UserRoleDTO implements Serializable, Delayed {
    private Set<MenuPO> userMenuPOS;
    private Set<MenuPO> adminMenuPOS;
    private Set<MenuPO> generalMenuPOS;
    private HashMap<String,MenuPO> userMenuPOMap;
    private HashMap<String,MenuPO> adminMenuPOMap;
    private HashMap<String,MenuPO> generalMenuPOMap;
    private HashMap<Long,HashSet<Long>> generalCompanyPOMap;
    private List<RolePO> topRolePOS;

    private Date createDate;

    private Date updateDate;

    private Long userId;

    private Long expirationTime = 3600l*1000l*2l;

    public static UserRoleDTO createUserRoleDTO(){
        return new UserRoleDTO();
    }

    public void userRoleServiceCopy(UserRoleDTO userRoleDTO){
        this.userMenuPOS = userRoleDTO.getUserMenuPOS();
        this.adminMenuPOS = userRoleDTO.getAdminMenuPOS();
        this.generalMenuPOS = userRoleDTO.getGeneralMenuPOS();
        this.userMenuPOMap = userRoleDTO.getUserMenuPOMap();
        this.adminMenuPOMap = userRoleDTO.getAdminMenuPOMap();
        this.generalMenuPOMap = userRoleDTO.getGeneralMenuPOMap();
        this.generalCompanyPOMap = userRoleDTO.getGeneralCompanyPOMap();
        this.topRolePOS = userRoleDTO.getTopRolePOS();

    }


    @Override
    public long getDelay(TimeUnit unit) {
        Date date = new Date();
        long residueTime = getUpdateDate().getTime() + expirationTime - date.getTime();
        return unit.convert(residueTime,TimeUnit.NANOSECONDS);
    }

    @Override
    public int compareTo(Delayed o) {
        Long dateLong = this.getDelay(TimeUnit.NANOSECONDS) - o.getDelay(TimeUnit.NANOSECONDS);
        if(dateLong > 0l){
            return 1;
        }else if(dateLong < 0l){
            return -1;
        }else {
            return 0;
        }
    }

    public List<RolePO> addRoles(List<RolePO> list){
        Set<Long> set = new HashSet<>();
        RolePO rolePO = null;
        String path = null;
        String strs[] = null;
        for(int i = 0; i < list.size(); i++){
            rolePO = list.get(i);
            path = rolePO.getPath();
            if(StringUtils.isNotEmpty(path)){
                strs = path.split("-");
                if(strs != null){
                    for (int j = 1; j < strs.length; j++){
                        set.add(Long.valueOf(strs[j]));
                    }
                }
            }
        }
        List<RolePO> rolePOList = new ArrayList<>();
        for(int i = 0; i < list.size(); i++){
            if(!set.contains(list.get(i).getId())){
                rolePOList.add(list.get(i));
            }
        }
        this.topRolePOS = rolePOList;
        return this.topRolePOS;
    }


    public MenuPO getUserMenu(String path){
        Iterator<MenuPO> menuPOIterator = this.userMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getPath().equals(path)){
                return menuPO;
            }
        }
        return null;
    }

    public MenuPO getUserMenu(Long id){
        Iterator<MenuPO> menuPOIterator = this.userMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getId().equals(id)){
                return menuPO;
            }
        }
        return null;
    }

    public MenuPO getAdminMenu(String path){
        Iterator<MenuPO> menuPOIterator = this.adminMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getPath().equals(path)){
                return menuPO;
            }
        }
        return null;
    }

    public MenuPO getAdminMenu(Long id){
        Iterator<MenuPO> menuPOIterator = this.adminMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getId().equals(id)){
                return menuPO;
            }
        }
        return null;
    }


    public MenuPO getGeneralMenu(String path){
        Iterator<MenuPO> menuPOIterator = this.generalMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getPath().equals(path)){
                return menuPO;
            }
        }
        return null;
    }

    public MenuPO getGeneralMenu(Long id){
        Iterator<MenuPO> menuPOIterator = this.generalMenuPOS.iterator();
        MenuPO menuPO = null;
        while (menuPOIterator.hasNext()){
            menuPO = menuPOIterator.next();
            if(menuPO.getId().equals(id)){
                return menuPO;
            }
        }
        return null;
    }

    public List<Long> getGeneralCompanyId(Long id){
        if(this.getGeneralCompanyPOMap().isEmpty()){
            return null;
        }
        List<Long> longs = new ArrayList<>();
        Iterator<Map.Entry<Long,HashSet<Long>>> iterator = this.getGeneralCompanyPOMap().entrySet().iterator();
        Map.Entry<Long,HashSet<Long>> entry = null;
        Iterator<Long> longIterator = null;
        HashSet<Long> longHashSet = null;
        Long menuId = null;
        while (iterator.hasNext()){
            entry = iterator.next();
            longHashSet = entry.getValue();
            if(longHashSet == null || longHashSet.isEmpty()){
                continue;
            }
            longIterator = longHashSet.iterator();
            k:while (longIterator.hasNext()){
                menuId = longIterator.next();
                if(menuId.equals(id)){
                    longs.add(entry.getKey());
                    break k;
                }
            }
        }
        return longs;
    }
}
