package org.ws.java.order.model.po;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigInteger;

@Entity
@Table(name = "d_city")
@Getter
@Setter
public class CityPO implements Serializable,Comparable<CityPO>{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id; //

    @Column(name = "name")
    private String name; //

    @Column(name = "parent_id")
    private Long parentId; //

    @Column(name = "longitude")
    private String longitude; //

    @Column(name = "latitude")
    private String latitude; //

    @Column(name = "code")
    private String code; //

    @Column(name = "deep")
    private Integer deep;

    @Override
    public int compareTo(CityPO o) {
        if(o.getId()>this.getId()){
            return 1;
        }else {
            return 0;
        }
    }

    @Override
    public boolean equals(Object obj) {
        if(obj instanceof CityPO){
            CityPO cityPO = (CityPO)obj;
            if(cityPO.getId().equals(this.getId())) {
                return true;
            }else {
                return false;
            }

        }else {
            return super.equals(obj);
        }

    }
}
