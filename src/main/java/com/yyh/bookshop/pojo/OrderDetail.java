package com.yyh.bookshop.pojo;

public class OrderDetail {

    private Integer  id;
    private String   orderId;  //订单号
    private Integer  bookId;   //书籍id
    private Integer  num;      //数量

    //一对一
    private Book book;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getBookId() {
        return bookId;
    }

    public void setBookId(Integer bookId) {
        this.bookId = bookId;
    }

    public Integer getNum() {
        return num;
    }

    public void setNum(Integer num) {
        this.num = num;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "OrderDetail{" +
                "id=" + id +
                ", orderId='" + orderId + '\'' +
                ", bookId=" + bookId +
                ", num=" + num +
                ", book=" + book +
                '}';
    }
}
