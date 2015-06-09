package hire.car.a2b.dao;

import java.sql.*;
import java.time.LocalDate;

public class DataLink implements IDataLink {
	
	public DataLink(){
		
	}

	@Override
	public void insertCustomerDetails(String username, String password, String name,
			LocalDate DOB, String[] address, int contactNumber) {
		// TODO Auto-generated method stub

	}

	@Override
	public ResultSet getVehicleGroups() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet getAllCarsOnHire() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ResultSet getAllAvailableCars() {
		// TODO Auto-generated method stub
		return null;
	}


	@Override
	public ResultSet getAllCustomerInvoices(int customerID) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public ResultSet getUserInfo(String username){
		return null;
	}

}
