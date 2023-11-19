
package com.learn.mycart.helper;

import java.util.HashMap;
import java.util.Map;
import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.query.Query;

public class Helper {
    
    public static String  get10Words(String desc){
        
        String[] strs  = desc.split(" ");
        
        if(strs.length>12){
            String res = " ";
            for(int i=0; i<12; i++){
                res=res+strs[i]+" ";
            }
            
            return ( res +" ...");
            
        }else{
            
            return (desc+" ... ");
        }
   
    }
    
    
    public static Map<String,Long> getCounts(SessionFactory factory){
        
        Session session = factory.openSession();
        String q1 = "select count(*) from User";
        String q2 = "select count(*) from Product";
        
        Query query1 = session.createQuery(q1);
        Query query2 = session.createQuery(q2);
        
        Long userCout =(Long) query1.list().get(0);
        Long productCount = (Long) query2.list().get(0);
        
        Map<String,Long> map = new HashMap<>();
        
        map.put("userCount", userCout);
        map.put("productCount", productCount);
        
        session.clear();
        
        return map;
        
    }
    
}
