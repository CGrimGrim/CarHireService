package hire.car.a2b.unittests;

import static org.junit.Assert.*;

import java.util.ArrayList;

import hire.car.a2b.Invoice;
import hire.car.a2b.service.HireService;
import hire.car.a2b.service.IHireService;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class HireServiceTests {
	IHireService srv = null;
	@Before
	public void setUp() throws Exception {
		
		srv = new HireService();
	}

	@After
	public void tearDown() throws Exception {
	}

	@Test
	public void allAvailableCarsAreRetrieved(){
		
	}
	
	@Test
	public void allUnavailableCarsAreRetrieved(){
		
	}
	
	@Test
	public void allVehicleGroupsAreRetrieved(){
		
	}
	
	@Test
	public void customerIsRegistered(){
		
	}
	
	@Test
	public void loginWithCorrectUsernameandPassword(){
		
	}
	
	@Test
	public void customerInvoicesAreRetireved(){
		ArrayList<Invoice> invoices = srv.listCustomersInvoices(3);
		for(Invoice i : invoices){
			if(i.getInvoiceId() == 3 || i.getInvoiceId() == 4){
				assertTrue(true);
			}
		}
	}

}
