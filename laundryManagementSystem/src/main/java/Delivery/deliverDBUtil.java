package Delivery;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class deliverDBUtil {
	
	private static Connection con = null;
	private static Statement stmt = null;
	private static ResultSet rs = null;

	//Insert
	
	public static boolean insertDeliver(int customerId, String deliveryAddress, String deliveryStatus, String estimatedDateOfDelivery, String estimatedTimeOfDelivery) {
		
		boolean isSuccess = false;
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "insert into new_orders values(0,'"+customerId+"', '"+deliveryAddress+"', '"+deliveryStatus+"', '"+estimatedDateOfDelivery+"', '"+estimatedTimeOfDelivery+"')";
			int i = stmt.executeUpdate(sql);
			
			if(i > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	//Display using id one
	
	
	public static List<diliveryModel> getById (String id){
		
		int convertedID = Integer.parseInt(id);
		
		ArrayList <diliveryModel> delivery = new ArrayList<>();
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "SELECT * FROM new_orders WHERE id '"+convertedID+"'";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int OrderId = rs.getInt(1);
			    int CustomerId = rs.getInt(2);
			    String DeliveryAddress = rs.getString(3);
			    String DeliveryStatus = rs.getString(4);
			    String EstimatedDateOfDelivery = rs.getString(5);
			    String EstimatedTimeOfDelivery = rs.getString(6);
			    
			    diliveryModel dm = new diliveryModel(OrderId, CustomerId, DeliveryAddress, DeliveryStatus, EstimatedDateOfDelivery, EstimatedTimeOfDelivery);
			    delivery.add(dm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return delivery;
	}
	
	
	
	//display all
	
	public static List<diliveryModel> getAll(){
		
		ArrayList <diliveryModel> deliverice = new ArrayList<>();
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select * from new_orders";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int OrderId = rs.getInt(1);
			    int CustomerId = rs.getInt(2);
			    String DeliveryAddress = rs.getString(3);
			    String DeliveryStatus = rs.getString(4);
			    String EstimatedDateOfDelivery = rs.getString(5);
			    String EstimatedTimeOfDelivery = rs.getString(6);
			    
			    diliveryModel dm = new diliveryModel(OrderId, CustomerId, DeliveryAddress, DeliveryStatus, EstimatedDateOfDelivery, EstimatedTimeOfDelivery);
			    deliverice.add(dm);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return deliverice;
	}
	
	
	
	//pass address using Cid
	
	public static List<customerModel> getAddressbtId(String Cid) {
		
	    ArrayList<customerModel> address = new ArrayList<>();
	    
	    try {
	        con = DBconnect.getConnection();
	        stmt = con.createStatement();
	        
	        String sql = "select * From customer where id = '"+Cid+"'";
	        rs = stmt.executeQuery(sql);
	        
	        while(rs.next()) {
	        	int id = rs.getInt(1);
	        	String Caddress = rs.getString(2);
			    String name = rs.getString(3);
			    
	            customerModel customer = new customerModel(id, Caddress, name);
	            address.add(customer);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return address;
	}
	/*public static customerModel getaddress(String id) {
		
		int convertedID = Integer.parseInt(id);
	    customerModel customer = null;
	    
	    try {
	    	
	        con = DBconnect.getConnection();
	        stmt = con.createStatement();
	        
	        String sql = "select * from customer where id = '"+convertedID+"'";
	        
	        PreparedStatement pstmt = con.prepareStatement(sql);
	        pstmt.setInt(1, Integer.parseInt(id));
	        
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            String address = rs.getString("address");
	            customer = new customerModel(Integer.parseInt(id), address);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return customer;
	}*/

	
	
	
	
	//update
	public static boolean updatedata(String id, String status, String date, String time) {
		
		boolean isSuccess = false;
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "update new_orders set DeliveryStatus = '"+status+"',EstimatedDateOfDelivery = '"+date+"',EstimatedTimeOfDelivery = '"+time+"' where OrderId = '"+id+"'";
			int i = stmt.executeUpdate(sql);
			
			if(i > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	//delete
	public static boolean deletedata(String id) {
		
		int convId = Integer.parseInt(id);
		boolean isSuccess = false;
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "delete from new_orders where OrderId = '"+convId+"'";
			int i = stmt.executeUpdate(sql);
			
			if(i > 0) {
				isSuccess = true;
			}
			else {
				isSuccess = false;
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return isSuccess;
	}
	
	
	
	
	//Count
	public static Map<String, Integer> getOrderStatusCounts() {
		
		Map<String, Integer> count = new HashMap<>();
		
		try {
			con = DBconnect.getConnection();
			stmt = con.createStatement();
			
			String sql = "select DeliveryStatus, count(*) as count from new_orders group by DeliveryStatus";
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				count.put(rs.getString("DeliveryStatus"), rs.getInt("count"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return count;
	}
	
}
