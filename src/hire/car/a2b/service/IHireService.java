package hire.car.a2b.service;

import java.time.LocalDate;
import java.util.ArrayList;
import hire.car.a2b.*;

interface IHireService {

	
	public abstract void registerCustomer(String username, String password, String name, LocalDate DOB, String[] address, int contactNumber);
	
	public abstract ArrayList<Invoice> listCustomersInvoices(int customerID);
	
	public abstract ArrayList<Car> listAllAvailableCars();
	
	public abstract ArrayList<Car> listAllCarsOnHire();
	
	public abstract ArrayList<Group> getVehicleGroups();

}
