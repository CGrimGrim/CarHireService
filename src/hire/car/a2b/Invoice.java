package hire.car.a2b;

import java.time.LocalDate;

public class Invoice {

	private int invoiceId;
	private LocalDate dateOut;
	private LocalDate dateIn;
	private Car carHired;
	private Customer customer;
	private int numberOfDays;
	private double costPerDay;
	private double totalCost;

	public int getInvoiceId() {
		return invoiceId;
	}

	public void setInvoiceId(int invoiceId) {
		this.invoiceId = invoiceId;
	}

	public LocalDate getDateOut() {
		return dateOut;
	}

	public void setDateOut(LocalDate dateOut) {
		this.dateOut = dateOut;
	}

	public LocalDate getDateIn() {
		return dateIn;
	}

	public void setDateIn(LocalDate dateIn) {
		this.dateIn = dateIn;
	}

	public Car getCarHired() {
		return carHired;
	}

	public void setCarHired(Car carHired) {
		this.carHired = carHired;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public int getNumberOfDays() {
		return numberOfDays;
	}

	public void setNumberOfDays(int numberOfDays) {
		this.numberOfDays = numberOfDays;
	}

	public double getCostPerDay() {
		return costPerDay;
	}

	public void setCostPerDay(double costPerDay) {
		this.costPerDay = costPerDay;
	}

	public double getTotalCost() {
		return totalCost;
	}

	public void setTotalCost(double totalCost) {
		this.totalCost = totalCost;
	}

	public Invoice(int invoiceId, LocalDate dateOut, LocalDate dateIn,
			Car carHired, Customer customer, int numberOfDays,
			double costPerDay, double totalCost) {
		super();
		this.invoiceId = invoiceId;
		this.dateOut = dateOut;
		this.dateIn = dateIn;
		this.carHired = carHired;
		this.customer = customer;
		this.numberOfDays = numberOfDays;
		this.costPerDay = costPerDay;
		this.totalCost = totalCost;
	}

	public Invoice() {
		super();
	}

}
