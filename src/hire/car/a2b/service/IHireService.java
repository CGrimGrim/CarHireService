package hire.car.a2b.service;

import java.time.LocalDate;
import java.util.ArrayList;
import hire.car.a2b.*;

public interface IHireService {

	/**
	 * Registers a customer
	 * @param username desired username
	 * @param password desired password
	 * @param name customers full name
	 * @param DOB customer date of birth
	 * @param address customers address
	 * @param contactNumber customers contact number
	 */
	public abstract void registerCustomer(String username, String password, String name, LocalDate DOB, String[] address, int contactNumber);
	
	/**
	 * list all of the invoices a customer has
	 * @param customerID customer whos invoices are needed
	 * @return all invoices for the specified customer
	 */
	public abstract ArrayList<Invoice> listCustomersInvoices(int customerID);
	
	/**
	 * gets all vehicles immediately available for hire
	 * @return ArrayList of available cars
	 */
	public abstract ArrayList<Car> listAllAvailableCars();
	
	/**
	 * List all cars on hire
	 * @return
	 */
	public abstract ArrayList<Car> listAllCarsOnHire();
	
	public abstract ArrayList<Group> getVehicleGroups();
	
	public abstract Customer validateCustomer();

}
