package hire.car.a2b.service;

import hire.car.a2b.Car;
import hire.car.a2b.Customer;
import hire.car.a2b.Group;
import hire.car.a2b.Invoice;
import hire.car.a2b.dao.*;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;

public class HireService implements IHireService {
	
	IDataLink dl = null;
	public HireService(){
		dl = new DataLink();
	}
	
	@Override
	public void registerCustomer(String username, String password, String name,
			LocalDate DOB, String[] address, int contactNumber) {
		
		Date dob = Date.valueOf(DOB);
		dl.insertCustomerDetails(username, password, name, dob, address, contactNumber);
	}

	@Override
	public ArrayList<Invoice> listCustomersInvoices(int customerID) {
		ArrayList<Invoice> invoiceList = new ArrayList<>();
		
		try{
			ResultSet rs = dl.getAllCustomerInvoices(customerID);
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				while(rs.next()){
					Invoice i = new Invoice();
					invoiceList.add(i);
				}
			}
			
			return invoiceList;
		}
		catch(Exception e){
			
		}
		
		return null;
	}

	@Override
	public ArrayList<Car> listAllAvailableCars() {
		ArrayList<Car> carList = new ArrayList<>();
		
		try{
			ResultSet rs = dl.getAllAvailableCars();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				while(rs.next()){
					Car car = new Car(rs.getString(1),rs.getString(2),rs.getString(3),
							rs.getString(4).charAt(0),rs.getDouble(5),false,rs.getDouble(6),rs.getInt(7),
							rs.getString(8));
					carList.add(car);
				}
			}
			return carList;
		}
		catch(SQLException e){}
		
		return null;
	}

	@Override
	public ArrayList<Car> listAllCarsOnHire() {
		ArrayList<Car> carList = new ArrayList<>();
		
		try{
			ResultSet rs = dl.getAllCarsOnHire();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				while(rs.next()){
					Car car = new Car(rs.getString(1),rs.getString(2),rs.getString(3),
							rs.getString(4).charAt(0),rs.getDouble(5),true,rs.getDouble(6),rs.getInt(7),
							rs.getString(8));
					carList.add(car);
				}
			}
			return carList;
		}
		catch(SQLException e){}
		
		return null;
	}

	@Override
	public ArrayList<Group> getVehicleGroups() {
		ArrayList<Group> groupList = new ArrayList<>();
		
		try{
			ResultSet rs = dl.getVehicleGroups();
			if(!rs.isBeforeFirst()){
				return null;
			}
			else{
				while(rs.next()){
					Group g = new Group(rs.getInt(1),rs.getString(2));
					groupList.add(g);
				}
			}
			return groupList;
		}
		catch(SQLException e){}
		
		return null;
	}

	@Override
	public Customer validateCustomer(String username, String passwordEntered) {
		try{
			ResultSet rs = dl.getUserInfo(username);
        
			if(!rs.isBeforeFirst()){
				return new Customer(username,passwordEntered,false);
			}
			else{
				rs.next();
				if(passwordEntered.equals(rs.getString(3))){
					String[] address = {rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7)};
					return new Customer(rs.getInt(1),rs.getString(2),rs.getString(3),address,rs.getString(8),rs.getDate(9).toLocalDate(),rs.getString(10)+" "+rs.getString(11), true);
				}
			}
			
		}
		catch(SQLException e){
			System.out.println("Exception : " + e.getMessage());
		}
		
		return new Customer(username,passwordEntered,false);
	}
	
	

}
