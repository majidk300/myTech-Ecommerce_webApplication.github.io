
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import com.learn.mycart.entities.category;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class categoryDao {
    
    private SessionFactory factory;

    public categoryDao(SessionFactory factory) {
        this.factory = factory;
    }
    
    public int saveCategory(category cat){
        
       Session session =  this.factory.openSession();
        Transaction tx =  session.beginTransaction();
        
        int catId = (int)session.save(cat);
       
       tx.commit();
       session.close();
       return catId;
    }
    
    public List<category> getCategory(){
        
        Session session = this.factory.openSession();
        
        Query query =  session.createQuery("from category");
        List<category> list = query.list();
        return list;
    }
    
    public category getCategorybyId (int cid){
        
        category cat = null;
        
        try{
            
            Session session = this.factory.openSession();
            
           cat = session.get(category.class, cid);
            
            session.close();
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return cat;
    }

}
