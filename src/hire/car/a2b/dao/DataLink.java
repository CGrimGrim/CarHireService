package hire.car.a2b.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataLink implements IDataLink {

	Connection connection = null;

	public DataLink() {
		try {
			Class.forName("com.mysql.JDBC.Driver");
		} catch (Exception e) {
		}
	}

	@Override
	public void insertCustomerDetails(String username, String password,
			String name, Date DOB, String[] address,
			int contactNumber) {
		try {

			PreparedStatement statement = connection
					.prepareStatement("call insert_customer(?,?,?,?,?,?,?,?,?)");
			statement.setString(1, username);
			statement.setString(2, password);
			statement.setString(3, name);
			statement.setDate(4, DOB);
			statement.setString(5, address[0]);
			statement.setString(6, address[1]);
			statement.setString(7, address[2]);
			statement.setString(8, address[3]);
			statement.setInt(9, contactNumber);
			statement.execute();
		} catch (SQLException e) {
		}
	}

	@Override
	public ResultSet getVehicleGroups() {
		ResultSet rs = null;
		try {
			PreparedStatement statement = connection
					.prepareStatement("call list_vehicle_groups();");
			rs = statement.executeQuery();
		} catch (SQLException e) {
		}

		return rs;

	}

	@Override
	public ResultSet getAllCarsOnHire() {
		ResultSet rs = null;
		try {
			return connection.prepareStatement(
					"SELECT * FROM vehicles WHERE is_on_hire= true")
					.executeQuery();
		} catch (SQLException e) {
		}
		return rs;
	}

	@Override
	public ResultSet getAllAvailableCars() {
		ResultSet rs = null;
		try {
			return connection.prepareStatement(
					"select * from cars_currently_available;").executeQuery();

		} catch (SQLException e) {
		}
		return rs;

	}

	@Override
	public ResultSet getAllCustomerInvoices(int customerID) {
		ResultSet rs = null;
		try {
			PreparedStatement statement = connection
					.prepareStatement("call list_customer_invoices(?);");
			statement.setInt(1, customerID);
			rs = statement.executeQuery();
		} catch (SQLException e) {
		}

		return rs;
	}

	@Override
	public ResultSet getUserInfo(String username) {
		ResultSet rs = null;
		try {
			PreparedStatement statement = connection
					.prepareStatement("SELECT * FROM customer WHERE uname=?");
			statement.setString(1, username);
			rs = statement.executeQuery();

		} catch (SQLException e) {
		}

		return rs;
	}

}
