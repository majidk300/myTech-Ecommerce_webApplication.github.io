
package com.learn.mycart.dao;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import com.learn.mycart.entities.Product;
import java.util.List;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

public class productDao {
    
    private SessionFactory factory;
    
    public productDao(SessionFactory factory){
        this.factory=factory;
    }
    
    public boolean saveProduct(Product product){
        boolean f = false;
        try{
            
            Session session  = this.factory.openSession();
            Transaction tx = session.beginTransaction();
            
            session.save(product);
            
            tx.commit();
            session.close();
            
            f=true;
            
        }catch (Exception e){
            e.printStackTrace();
        }
        
        return f;
    }
    
    //get all  products
    public List<Product> getallProducts(){
        
        Session session  = this.factory.openSession();
        
        Query q = session.createQuery("from Product order by pId desc");
       
//        q.setMaxResults(36);
        
        List<Product> list = q.list();
      
        return list;
    }
        
    //get get all products by id
    public List<Product> getallProductById(int cid){
         
        Session session  = this.factory.openSession();
        Query query = session.createQuery("from Product as p where p.category.categoryId=:id order by pId desc");
        query.setParameter("id", cid);
        
        List<Product> list = query.list();
        return list;
    }
    
}
