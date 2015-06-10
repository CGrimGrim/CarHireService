/* Delete Payment */
Delimiter //
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_payment`(payid int(5))
BEGIN
	DELETE FROM payment_info
    WHERE payid=payment_info.id;
END//

/* Get Invoice */

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_invoice`(in invoice_id int(10))
BEGIN
	SELECT * FROM invoices 
    WHERE invoice.id = invoice_id;
END//

/* Get Vehicle details */

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_vehicle_details`(regnum char(8))
BEGIN
	SELECT vehicles.registration_num, vehicles.make, vehicles.model , vehicles.fuel_type, vehicles.engine_size, vehicle_groups.group_name FROM vehicles
    inner join vehicle_groups
    on vehicle.group_id=vehicle_group.id
    WHERE vehicles.registration_num=regnum;
END//

/* Shows a list of customer invoices */

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_customer_invoices`(cusid int(5))
BEGIN
	SELECT * FROM invoices 
    WHERE cusid = invoices.customer_id;
END//

/* List all vehicle groups */

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_vehicle_groups`()
BEGIN
	
	SELECT id,group_name FROM vehicle_groups;
END//

/* List all available vehicles */

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_vehicles_available`()
BEGIN
	SELECT vehicles.registration_num, vehicles.make, vehicles.model, vehicles.fuel_type, vehicles.engine_size, vehicle_groups.group_name FROM vehicles
    inner join vehicle_groups
    on vehicles.group_id = vehicle_groups.id
    WHERE is_on_hire=false;
END//

/* List all cars currently on hire */

CREATE DEFINER=`root`@`localhost` PROCEDURE `list_vehicles_on_hire`()
BEGIN
	SELECT * FROM vehicles WHERE is_on_hire= true;
	
END//

/* Updates a vehicle from hired to not hired */

CREATE DEFINER=`root`@`localhost` PROCEDURE `update_to_not_on_hire`(regnum char(8))
BEGIN
	UPDATE vehicles
    SET is_on_hire=false
    WHERE vehicles.registration_num=regnum;
END//



