package Delivery;

public class customerModel {

	private int id;
	private String address;
	private String name;
	
	public customerModel(int id, String address, String name) {
		super();
		this.id = id;
		this.address = address;
		this.name = name;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
