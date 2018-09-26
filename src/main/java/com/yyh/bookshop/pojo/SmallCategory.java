package com.yyh.bookshop.pojo;

public class SmallCategory {

    private Integer id;
    private Integer bid;
    private String  sname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getBid() {
        return bid;
    }

    public void setBid(Integer bid) {
        this.bid = bid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    @Override
    public String toString() {
        return "SmallCategory{" +
                "id=" + id +
                ", bid=" + bid +
                ", sname='" + sname + '\'' +
                '}';
    }
}
