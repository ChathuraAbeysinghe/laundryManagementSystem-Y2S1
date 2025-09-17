package Delivery;

public class Order {
    private int id, userId, quantity;
    private String category, washType, washNote;
    private String pickupAddress, pickupDate, pickupTime;
    private String deliveryAddress, deliveryDate, deliveryTime;
    private String deliveryNote, paymentMethod, paymentStatus;

    // ✅ Default constructor (for frameworks, empty object, etc.)
    public Order() {
    }

    // ✅ Full constructor
    public Order(int id, int userId, String category, int quantity, String washType,
                 String washNote, String pickupAddress, String pickupDate, String pickupTime,
                 String deliveryAddress, String deliveryDate, String deliveryTime,
                 String deliveryNote, String paymentMethod, String paymentStatus) {
        this.id = id;
        this.userId = userId;
        this.category = category;
        this.quantity = quantity;
        this.washType = washType;
        this.washNote = washNote;
        this.pickupAddress = pickupAddress;
        this.pickupDate = pickupDate;
        this.pickupTime = pickupTime;
        this.deliveryAddress = deliveryAddress;
        this.deliveryDate = deliveryDate;
        this.deliveryTime = deliveryTime;
        this.deliveryNote = deliveryNote;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
    }

    // ✅ Getters
    public int getId() { return id; }
    public int getUserId() { return userId; }
    public String getCategory() { return category; }
    public int getQuantity() { return quantity; }
    public String getWashType() { return washType; }
    public String getWashNote() { return washNote; }
    public String getPickupAddress() { return pickupAddress; }
    public String getPickupDate() { return pickupDate; }
    public String getPickupTime() { return pickupTime; }
    public String getDeliveryAddress() { return deliveryAddress; }
    public String getDeliveryDate() { return deliveryDate; }
    public String getDeliveryTime() { return deliveryTime; }
    public String getDeliveryNote() { return deliveryNote; }
    public String getPaymentMethod() { return paymentMethod; }
    public String getPaymentStatus() { return paymentStatus; }

    // ✅ Setters
    public void setId(int id) { this.id = id; }
    public void setUserId(int userId) { this.userId = userId; }
    public void setCategory(String category) { this.category = category; }
    public void setQuantity(int quantity) { this.quantity = quantity; }
    public void setWashType(String washType) { this.washType = washType; }
    public void setWashNote(String washNote) { this.washNote = washNote; }
    public void setPickupAddress(String pickupAddress) { this.pickupAddress = pickupAddress; }
    public void setPickupDate(String pickupDate) { this.pickupDate = pickupDate; }
    public void setPickupTime(String pickupTime) { this.pickupTime = pickupTime; }
    public void setDeliveryAddress(String deliveryAddress) { this.deliveryAddress = deliveryAddress; }
    public void setDeliveryDate(String deliveryDate) { this.deliveryDate = deliveryDate; }
    public void setDeliveryTime(String deliveryTime) { this.deliveryTime = deliveryTime; }
    public void setDeliveryNote(String deliveryNote) { this.deliveryNote = deliveryNote; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }
}
