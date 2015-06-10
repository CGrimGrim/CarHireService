package hire.car.a2b;

public class Car {

	private String registrationNumber;
	private String make;
	private String model;
	private char fuelType;
	private double engineSize;
	private boolean hiredOut;
	private double dailyRate;
	private int groupId;
	private String groupName;

	public String getRegistrationNumber() {
		return registrationNumber;
	}

	public void setRegistrationNumber(String registrationNumber) {
		this.registrationNumber = registrationNumber;
	}

	public String getMake() {
		return make;
	}

	public void setMake(String make) {
		this.make = make;
	}

	public String getModel() {
		return model;
	}

	public void setModel(String model) {
		this.model = model;
	}

	public char getFuelType() {
		return fuelType;
	}

	public void setFuelType(char fuelType) {
		this.fuelType = fuelType;
	}

	public double getEngineSize() {
		return engineSize;
	}

	public void setEngineSize(double engineSize) {
		this.engineSize = engineSize;
	}

	public boolean isHiredOut() {
		return hiredOut;
	}

	public void setHiredOut(boolean hiredOut) {
		this.hiredOut = hiredOut;
	}

	public double getDailyRate() {
		return dailyRate;
	}

	public void setDailyRate(double dailyRate) {
		this.dailyRate = dailyRate;
	}

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Car(String registrationNumber, String make, String model,
			char fuelType, double engineSize, boolean hiredOut,
			double dailyRate, int groupId, String groupName) {
		super();
		this.registrationNumber = registrationNumber;
		this.make = make;
		this.model = model;
		this.fuelType = fuelType;
		this.engineSize = engineSize;
		this.hiredOut = hiredOut;
		this.dailyRate = dailyRate;
		this.groupId = groupId;
		this.groupName = groupName;
	}
	
	public Car(String registrationNumber, String make, String model,
			char fuelType, double engineSize, String groupName, double dailyRate){
		super();
		this.registrationNumber = registrationNumber;
		this.make = make;
		this.model = model;
		this.fuelType = fuelType;
		this.engineSize = engineSize;
		this.groupName = groupName;
		this.dailyRate = dailyRate;
	}

	public Car() {
		super();
	}

}
