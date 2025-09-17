package Delivery;



public class CardPaymentModel {
    private int paymentID; // auto-increment, not set during insert
    private String name;
    private double amount;
    private String cardNumber;
    private String expiryDate;
    private String cvv;
    private String date;
    private String status;
    private String userID;

    // Default constructor
    public CardPaymentModel() {}

    // Constructor without paymentID (used for inserting)
    public CardPaymentModel(String name, double amount, String cardNumber, String expiryDate, String cvv, String date, String status) {
        this.name = name;
        this.amount = amount;
        this.cardNumber = cardNumber;
        this.expiryDate = expiryDate;
        this.cvv = cvv;
        this.date = date;
        this.status = status;
    }

    // Getter only (if needed to retrieve generated key later)
    public int getPaymentID() {
        return paymentID;
    }

    public void setPaymentID(int paymentID) {
        this.paymentID = paymentID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public String getCvv() {
        return cvv;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
}
