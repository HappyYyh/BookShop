package com.yyh.bookshop.pojo;

import java.util.Date;

public class Book {
    private Integer id;
    private String  superType;    //大类
    private String  subType;      //小类
    private String  name;         //书名
    private String  isbn;         //isbn编号
    private String  introduce;    //简介
    private Double  price;        //原价
    private Double  nowPrice;     //现价
    private String  photo;        //缩略图
    private Integer pages;        //页数
    private String  publisher;    //出版社
    private String  author;       //作者
    private Boolean newBook;      //是否新书
    private Boolean saleBook;     //是否热卖
    private Boolean specialBook;  //是否特价
    private Boolean recommendBook;//是否特别推荐
    private Date    addDate;      //上架日期

    //查询使用
    private Double  startPrice;
    private Double  endPrice;

    public Book(Integer id, String superType, String subType, String name, String isbn, String introduce, Double price, Double nowPrice, String photo, Integer pages, String publisher, String author, Boolean newBook, Boolean saleBook, Boolean specialBook, Boolean recommendBook, Date addDate) {
        this.id = id;
        this.superType = superType;
        this.subType = subType;
        this.name = name;
        this.isbn = isbn;
        this.introduce = introduce;
        this.price = price;
        this.nowPrice = nowPrice;
        this.photo = photo;
        this.pages = pages;
        this.publisher = publisher;
        this.author = author;
        this.newBook = newBook;
        this.saleBook = saleBook;
        this.specialBook = specialBook;
        this.recommendBook = recommendBook;
        this.addDate = addDate;
    }

    public Book() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSuperType() {
        return superType;
    }

    public void setSuperType(String superType) {
        this.superType = superType;
    }

    public String getSubType() {
        return subType;
    }

    public void setSubType(String subType) {
        this.subType = subType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public Double getNowPrice() {
        return nowPrice;
    }

    public void setNowPrice(Double nowPrice) {
        this.nowPrice = nowPrice;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Integer getPages() {
        return pages;
    }

    public void setPages(Integer pages) {
        this.pages = pages;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public Boolean getNewBook() {
        return newBook;
    }

    public void setNewBook(Boolean newBook) {
        this.newBook = newBook;
    }

    public Boolean getSaleBook() {
        return saleBook;
    }

    public void setSaleBook(Boolean saleBook) {
        this.saleBook = saleBook;
    }

    public Boolean getSpecialBook() {
        return specialBook;
    }

    public void setSpecialBook(Boolean specialBook) {
        this.specialBook = specialBook;
    }

    public Boolean getRecommendBook() {
        return recommendBook;
    }

    public void setRecommendBook(Boolean recommendBook) {
        this.recommendBook = recommendBook;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Double getStartPrice() {
        return startPrice;
    }

    public void setStartPrice(Double startPrice) {
        this.startPrice = startPrice;
    }

    public Double getEndPrice() {
        return endPrice;
    }

    public void setEndPrice(Double endPrice) {
        this.endPrice = endPrice;
    }

    @Override
    public String toString() {
        return "Book{" +
                "id=" + id +
                ", superType='" + superType + '\'' +
                ", subType='" + subType + '\'' +
                ", name='" + name + '\'' +
                ", isbn='" + isbn + '\'' +
                ", introduce='" + introduce + '\'' +
                ", price=" + price +
                ", nowPrice=" + nowPrice +
                ", photo='" + photo + '\'' +
                ", pages=" + pages +
                ", publisher='" + publisher + '\'' +
                ", author='" + author + '\'' +
                ", newBook=" + newBook +
                ", saleBook=" + saleBook +
                ", specialBook=" + specialBook +
                ", recommendBook=" + recommendBook +
                ", addDate=" + addDate +
                '}';
    }
}
