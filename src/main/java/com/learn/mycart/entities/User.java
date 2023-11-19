
package com.learn.mycart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

/**
 *
 * @author Majid
 */

@Entity
public class User {
    
    @Id
    @GeneratedValue(strategy =  GenerationType.IDENTITY)
    @Column(length=10,name="user_Id")
    private int userId;
    
    @Column(length=100,name="user_Name")
    private String userName;
    
    @Column(length=100,name="user_Email")
    private String userEmail;
    
    @Column(length=100,name="user_Password")
    private String userPassword;
    
    @Column(length=50,name="user_Phone")
    private String userPhone;
    
    @Column(length=500,name="user_Pic")
    private String uiserPic;
    
    @Column(length=1500, name="user_Address")
    private String userAddress;
    
    @Column(name="user_type")
    private String  userType;

    public User(int userId, String userName, String userEmail, String userPassword, String userPhone, String uiserPic, String userAddress, String userType ) {
        this.userId = userId;
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.uiserPic = uiserPic;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    public User(String userName, String userEmail, String userPassword, String userPhone, String uiserPic, String userAddress, String userType) {
        this.userName = userName;
        this.userEmail = userEmail;
        this.userPassword = userPassword;
        this.userPhone = userPhone;
        this.uiserPic = uiserPic;
        this.userAddress = userAddress;
        this.userType=userType;
    }

    public User() {
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUiserPic() {
        return uiserPic;
    }

    public void setUiserPic(String uiserPic) {
        this.uiserPic = uiserPic;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserType() {
        return userType;
    }

    public void setUserType(String userType) {
        this.userType = userType;
    }
    
    

    @Override
    public String toString() {
        return "User{" + "userId=" + userId + ", userName=" + userName + ", userEmail=" + userEmail + ", userPassword=" + userPassword + ", userPhone=" + userPhone + ", uiserPic=" + uiserPic + ", userAddress=" + userAddress + ", userType=" + userType + '}';
    }

   
    
    
    
}
