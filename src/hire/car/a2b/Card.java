package hire.car.a2b;

public class Card {

	private int cardNum;
	private String expireDate;
	private int typeId;
	private String type;
	private int securityCode;

	public int getCardNum() {
		return cardNum;
	}

	public void setCardNum(int cardNum) {
		this.cardNum = cardNum;
	}

	public String getExpireDate() {
		return expireDate;
	}

	public void setExpireDate(String expireDate) {
		this.expireDate = expireDate;
	}

	public int getTypeId() {
		return typeId;
	}

	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getSecurityCode() {
		return securityCode;
	}

	public void setSecurityCode(int securityCode) {
		this.securityCode = securityCode;
	}

	public Card(int cardNum, String expireDate, int typeId, String type,
			int securityCode) {
		super();
		this.cardNum = cardNum;
		this.expireDate = expireDate;
		this.typeId = typeId;
		this.type = type;
		this.securityCode = securityCode;
	}

	public Card() {
		super();
	}

}
