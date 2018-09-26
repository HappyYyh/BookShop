package com.yyh.bookshop.pojo;

public class BigCategory {

    private Integer id;
    private String  bname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBname() {
        return bname;
    }

    public void setBname(String bname) {
        this.bname = bname;
    }

    @Override
    public String toString() {
        return "BigCategory{" +
                "id=" + id +
                ", bname='" + bname + '\'' +
                '}';
    }
}
