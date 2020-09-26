package com.ycy.vo;

public class Users {
    private Integer uid;
    private String user;
    private String pass;

    public Users() {
    }

    public Users(Integer uid, String user, String pass) {
        this.uid = uid;
        this.user = user;
        this.pass = pass;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

    public String getUser() {
        return user;
    }

    public void setUser(String user) {
        this.user = user;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    @Override
    public String toString() {
        return "Users{" +
                "uid=" + uid +
                ", user='" + user + '\'' +
                ", pass='" + pass + '\'' +
                '}';
    }
}
