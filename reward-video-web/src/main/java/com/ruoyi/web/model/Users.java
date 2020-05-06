package com.ruoyi.web.model;

import lombok.Data;
import org.near.toolkit.model.ToString;

/**
 * @author sunflower
 */
@Data
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
    }
}
