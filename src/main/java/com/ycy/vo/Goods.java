package com.ycy.vo;

public class Goods {
    private Integer gid;
    private String name;
    private Integer num1;
    private Integer num2;

    public Goods() {
    }

    public Goods(Integer gid, String name, Integer num1, Integer num2) {
        this.gid = gid;
        this.name = name;
        this.num1 = num1;
        this.num2 = num2;
    }

    public Integer getGid() {
        return gid;
    }

    public void setGid(Integer gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getNum1() {
        return num1;
    }

    public void setNum1(Integer num1) {
        this.num1 = num1;
    }

    public Integer getNum2() {
        return num2;
    }

    public void setNum2(Integer num2) {
        this.num2 = num2;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "gid=" + gid +
                ", name='" + name + '\'' +
                ", num1=" + num1 +
                ", num2=" + num2 +
                '}';
    }
}
