package Delivery;

import java.util.Date;

public class OrderAz {
    private int id;
    private String orderCode;
    private int userId;
    private int itemCount;
    private Date orderDate;
    private String status;
    
    public OrderAz() {
    }
    public OrderAz(int id, String orderCode, int userId, Date orderDate, String status) {
        this.id = id;
        this.orderCode = orderCode;
        this.userId = userId;
        this.orderDate = orderDate;
        this.status = status;
    }


    // Add a constructor to initialize the Order object
    public OrderAz(int id, String orderCode, int userId, int itemCount, Date orderDate, String status) {
        this.id = id;
        this.orderCode = orderCode;
        this.userId = userId;
        this.itemCount = itemCount;
        this.orderDate = orderDate;
        this.status = status;
    }

    // Getters and setters for each field
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getOrderCode() {
        return orderCode;
    }

    public void setOrderCode(String orderCode) {
        this.orderCode = orderCode;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getItemCount() {
        return itemCount;
    }

    public void setItemCount(int itemCount) {
        this.itemCount = itemCount;
    }

    public Date getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Date orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
