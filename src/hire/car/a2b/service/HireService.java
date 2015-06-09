package hire.car.a2b.service;

import hire.car.a2b.Car;
import hire.car.a2b.Customer;
import hire.car.a2b.Group;
import hire.car.a2b.Invoice;

import java.time.LocalDate;
import java.util.ArrayList;

public class HireService implements IHireService {

	@Override
	public void registerCustomer(String username, String password, String name,
			LocalDate DOB, String[] address, int contactNumber) {
		// TODO Auto-generated method stub

	}

	@Override
	public ArrayList<Invoice> listCustomersInvoices(int customerID) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Car> listAllAvailableCars() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Car> listAllCarsOnHire() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ArrayList<Group> getVehicleGroups() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Customer validateCustomer() {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
