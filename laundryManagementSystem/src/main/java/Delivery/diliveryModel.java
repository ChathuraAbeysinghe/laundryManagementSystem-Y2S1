package Delivery;

public class diliveryModel {
	
	private int orderId;
    private int customerId;
    private String deliveryAddress;
    private String deliveryStatus;
    private String estimatedDateOfDelivery;
    private String estimatedTimeOfDelivery;
    
	public diliveryModel(int orderId, int customerId, String deliveryAddress, String deliveryStatus, String estimatedDateOfDelivery, String estimatedTimeOfDelivery) {
		
		super();
		this.orderId = orderId;
		this.customerId = customerId;
		this.deliveryAddress = deliveryAddress;
		this.deliveryStatus = deliveryStatus;
		this.estimatedDateOfDelivery = estimatedDateOfDelivery;
		this.estimatedTimeOfDelivery = estimatedTimeOfDelivery;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getDeliveryAddress() {
		return deliveryAddress;
	}

	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}

	public String getDeliveryStatus() {
		return deliveryStatus;
	}

	public void setDeliveryStatus(String deliveryStatus) {
		this.deliveryStatus = deliveryStatus;
	}

	public String getEstimatedDateOfDelivery() {
		return estimatedDateOfDelivery;
	}

	public void setEstimatedDateOfDelivery(String estimatedDateOfDelivery) {
		this.estimatedDateOfDelivery = estimatedDateOfDelivery;
	}

	public String getEstimatedTimeOfDelivery() {
		return estimatedTimeOfDelivery;
	}

	public void setEstimatedTimeOfDelivery(String estimatedTimeOfDelivery) {
		this.estimatedTimeOfDelivery = estimatedTimeOfDelivery;
	}


    
}
