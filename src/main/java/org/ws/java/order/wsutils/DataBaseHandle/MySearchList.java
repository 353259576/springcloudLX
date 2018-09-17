package org.ws.java.order.wsutils.DataBaseHandle;

import org.ws.java.order.constants.DataBaseConstant;
import org.ws.java.order.constants.SystemConstants;
import org.ws.java.order.model.vo.PageVO;

import java.io.Serializable;
import java.util.*;

public class MySearchList implements Serializable{
    private List<MySearch> mySearches = new ArrayList<>();

    private PageVO pageVO;

    public MySearchList() {

    }

    public static MySearchList newMySearchList(){
        return new MySearchList();
    }

    public MySearchList(List<MySearch> mySearches){
        this.mySearches = mySearches;
    }

    public static MySearchList newMySearchList(List<MySearch> mySearches){
        return new MySearchList(mySearches);
    }



    public boolean add(MySearch mySearch){
        return mySearches.add(mySearch);
    }

    public boolean add(String fieldName, JpaDataHandle.Operator operator,Object value){
        return mySearches.add(new MySearch(fieldName,operator,value));
    }

    public MySearch get(int i){
        return mySearches.get(i);
    }

    public List<MySearch> getAll(){
        return mySearches;
    }

    public boolean isEmpty(){
        return mySearches.isEmpty();
    }

    public Iterator<MySearch> iterator(){
        return mySearches.iterator();
    }


    public MySearch remove(String name){
        MySearch mySearch = null;
        for(int i = 0; i < mySearches.size(); i++){
            mySearch = mySearches.get(i);
            if(mySearch.getFieldName().equals(name)){
                mySearches.remove(i);
                return mySearch;
            }
        }
        return null;
    }

    public PageVO getPageVO() {
        return pageVO;
    }

    public void setPageVO(PageVO pageVO) {
        this.pageVO = pageVO;
    }

    public Map createMybaitsMap(){
        Map map = new HashMap();
        for (MySearch m1: mySearches) {
            map.put(m1.getFieldName(),m1.getValue());
        }
        if(pageVO != null){
            map.put(DataBaseConstant.PAGE,pageVO);
        }
        return map;
    }


    public Map createMybaitsMapNoPage(){
        Map map = new HashMap();
        for (MySearch m1: mySearches) {
            map.put(m1.getFieldName(),m1.getValue());
        }
        return map;
    }


    public MySearch get(String value){
        for (MySearch m:mySearches) {
            if(m.getFieldName().equals(value)){
                return m;
            }
        }
        return null;
    }
}
