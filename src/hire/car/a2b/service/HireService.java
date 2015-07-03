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
					String[] address = {rs.getString("address_line_1"),rs.getString("address_line_2"), rs.getString("city"),rs.getString("postcode")};
					Customer customer = new Customer(rs.getString("fname")+" "+rs.getString("lname"), address);
					Car car = new Car(rs.getString("registration_num"), rs.getString("make"), rs.getString("model"), rs.getString("fuel_type").charAt(0),rs.getDouble("engine_size"), rs.getString("group_name"), rs.getDouble("daily_rate"));
					Invoice i = new Invoice(rs.getInt("id"),rs.getDate("hire_start").toLocalDate(), rs.getDate("hire_end").toLocalDate(),car,customer,rs.getInt("num_of_days"),rs.getDouble("daily_rate"),rs.getDouble("total_cost"));
					
					invoiceList.add(i);
				}
				
				return invoiceList;
				
			}
			
			
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
					Car car = new Car(rs.getString("registration_num"),rs.getString("make"),rs.getString("model"),
							rs.getString("fuel_type").charAt(0),rs.getDouble("engine_size"),false,
							rs.getDouble("daily_rate"),rs.getInt("group_id"), rs.getString("group_name"));
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
					Car car = new Car(rs.getString("registration_num"),rs.getString("make"),rs.getString("model"),
							rs.getString("fuel_type").charAt(0),rs.getDouble("engine_size"),true,
							rs.getDouble("daily_rate"),rs.getInt("group_id"), rs.getString("group_name"));
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
					Group g = new Group(rs.getInt("id"),rs.getString("group_name"));
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
					String[] address = {rs.getString("address_line_1"),rs.getString("address_line_2"),
							rs.getString("city"),rs.getString("postcode")};
					return new Customer(rs.getInt("id"),rs.getString("uname"),rs.getString("pword"),
							address,rs.getString("driving_licence_number"),
							rs.getDate("date_of_birth").toLocalDate(),rs.getString("fname")+" "+rs.getString("lname"), 
							true);
				}
			}
			
		}
		catch(SQLException e){
			System.out.println("Exception : " + e.getMessage());
		}
		
		return new Customer(username,passwordEntered,false);
	}
	
	public ArrayList<Car> listAllVehiclesAvailableForDates(LocalDate startDate, LocalDate endDate){
		ArrayList<Car> vehicleList = new ArrayList<>();
		ResultSet rs = dl.getAvailableCarsForRental(startDate, endDate);
		try{
			while(rs.next()){
				vehicleList.add(new Car(rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5).charAt(0), rs.getDouble(6), rs.getString(7), rs.getDouble(8)));
			}
		}
		catch(SQLException e){
			System.out.println("Exception Occured: " + e.getMessage());
		}
		
		return vehicleList;
	}
	
	public void HireVehicle(String vehicleRegistration){
		
	}

}
