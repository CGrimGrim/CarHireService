package hire.car.a2b.dao;

public interface IDataLink {

	
	public abstract ResultSet getVehicleGroups();
	
	public abstract void insertCustomerDetails();
	
	public abstract ResultSet getAllCarsOnHire();
	
	public abstract ResultSet getAllAvailableCars();
	
	public abstract ResultSet getAllCustomerInvoices();
	
}
