package com.ruoyi.web.model;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
public class Users extends ToString {
    private int id;
    private String email;
    private String password;
    private String name;
    private String lastName;
    private int active;

    public Users() {
    }


    public Users(Users users) {
        this.active = users.getActive();
        this.email = users.getEmail();
        this.name = users.getName();
        this.lastName = users.getLastName();
        this.id = users.getId();
        this.password = users.getPassword();
    }
}
