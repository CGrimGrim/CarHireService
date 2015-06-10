package hire.car.a2b;

import java.time.LocalDate;
import java.util.ArrayList;

public class Customer {

	private int id;
	private String username;
	private String password;
	private ArrayList<Card> cards;
	private String[] address;
	private String drivingLicenseNum;
	private LocalDate dateOfBirth;
	private String name;
	private boolean authenticated;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public ArrayList<Card> getCards() {
		return cards;
	}

	public void setCards(ArrayList<Card> cards) {
		this.cards = cards;
	}

	public String[] getAddress() {
		return address;
	}

	public void setAddress(String[] address) {
		this.address = address;
	}

	public String getDrivingLicenseNum() {
		return drivingLicenseNum;
	}

	public void setDrivingLicenseNum(String drivingLicenseNum) {
		this.drivingLicenseNum = drivingLicenseNum;
	}

	public LocalDate getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(LocalDate dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Customer(int id, String username, String password,
			ArrayList<Card> cards, String[] address, String drivingLicenseNum,
			LocalDate dateOfBirth, String name) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.cards = cards;
		this.address = address;
		this.drivingLicenseNum = drivingLicenseNum;
		this.dateOfBirth = dateOfBirth;
		this.name = name;
	}
	
	public Customer(int id, String username, String password,
			String[] address, String drivingLicenseNum,
			LocalDate dateOfBirth, String name) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.address = address;
		this.drivingLicenseNum = drivingLicenseNum;
		this.dateOfBirth = dateOfBirth;
		this.name = name;
	}
	
	public Customer(int id, String username, String password,
			String[] address, String drivingLicenseNum,
			LocalDate dateOfBirth, String name, boolean authenticated) {
		super();
		this.id = id;
		this.username = username;
		this.password = password;
		this.address = address;
		this.drivingLicenseNum = drivingLicenseNum;
		this.dateOfBirth = dateOfBirth;
		this.name = name;
		this.authenticated = authenticated;
	}
	
	public Customer(String username, String password, boolean authenticated){
		super();
		this.username = username;
		this.password = password;
		this.authenticated = authenticated;
	}

	public Customer() {
		super();
	}
	
	public boolean isAuthenticated(){
		return authenticated;
	}
	
	public void setAuthenticated(boolean value){
		authenticated = value;
	}

}
