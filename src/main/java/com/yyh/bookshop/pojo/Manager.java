package com.yyh.bookshop.pojo;

/**
 * 管理员
 */
public class Manager {

    private Integer id;//主键

    private String username;//用户名

    private String password;//密码

    public Manager(Integer id, String username, String password) {
        this.id = id;
        this.username = username;
        this.password = password;
    }

    public Manager() {
    }

    public Manager(String username, String password) {
        this.username = username;
        this.password = password;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "Manager{" +
                "id=" + id +
                ", username='" + username + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
