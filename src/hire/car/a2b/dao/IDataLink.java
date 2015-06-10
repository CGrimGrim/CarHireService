package hire.car.a2b.dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;

public interface IDataLink {

	/**
	 * Return a all vehicle groups from the database
	 * @return all vehicle groups
	 */
	public abstract ResultSet getVehicleGroups();
	
	/**
	 * Adds a customer to the database
	 */
	public abstract void insertCustomerDetails(String username, String password, String name, Date DOB, String[] address, int contactNumber);
	
	
	/**
	 * Gets all of the cars which are currently marked as hired out in the database
	 * @return all cars currently hired out to customers
	 */
	public abstract ResultSet getAllCarsOnHire();
	
	
	/**
	 * Gets all of the cars which are not hired out
	 * @return all cars currently not hired out to customers
	 */
	public abstract ResultSet getAllAvailableCars();
	
	/**
	 * Gets all of the invoices/rentals that a customer has ever taken out
	 * @return All of the specified customers invoices
	 * @throws SQLException 
	 */
	public abstract ResultSet getAllCustomerInvoices(int customerID) throws SQLException, SQLException;
	
	
	/**
	 * Gets user information where the username exists in the database
	 * @param username supplied username
	 * @return resultset of user info
	 */
	public abstract ResultSet getUserInfo(String username);
	
	
}
