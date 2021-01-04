package com.ruoyi.web.model;

import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */

public class Users extends ToString {
    private Long id;
    private String email;
    private String password;
    private String username;
    private String lastName;
    private int active;
    private String userId;

    public Users() {
    }


    public Users(Users users) {
        this.active = users.getActive();
        this.email = users.getEmail();
        this.username = users.getUsername();
        this.lastName = users.getLastName();
        this.id = users.getId();
        this.password = users.getPassword();
        this.userId = users.getUserId();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public int getActive() {
        return active;
    }

    public void setActive(int active) {
        this.active = active;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
}
