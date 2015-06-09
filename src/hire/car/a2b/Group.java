package hire.car.a2b;

public class Group {
	
	private int id;
	private String name;
	
	public Group(int id, String name){
		this.id = id;
		this.name = name;
	}
	
	public String getName(){
		return name;
	}
	
	public int getId(){
		return id;
	}

}
