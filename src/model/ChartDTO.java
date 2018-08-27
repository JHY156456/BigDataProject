package model;

public class ChartDTO {
	String rentalDate;
	String stationNo;
	String rentalCode;
	String gender;
	String age;
	long useCount;
	long momentum;
	long carbon;
	
	public ChartDTO() {}
	
	public ChartDTO(String rentalDate, String stationNo, String rentalCode, String gender, String age, long useCount,
			long momentum, long carbon) {
		super();
		this.rentalDate = rentalDate;
		this.stationNo = stationNo;
		this.rentalCode = rentalCode;
		this.gender = gender;
		this.age = age;
		this.useCount = useCount;
		this.momentum = momentum;
		this.carbon = carbon;
	}
	public String getRentalDate() {
		return rentalDate;
	}
	public void setRentalDate(String rentalDate) {
		this.rentalDate = rentalDate;
	}
	public String getStationNo() {
		return stationNo;
	}
	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}
	public String getRentalCode() {
		return rentalCode;
	}
	public void setRentalCode(String rentalCode) {
		this.rentalCode = rentalCode;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public long getUseCount() {
		return useCount;
	}
	public void setUseCount(long useCount) {
		this.useCount = useCount;
	}
	public long getMomentum() {
		return momentum;
	}
	public void setMomentum(long momentum) {
		this.momentum = momentum;
	}
	public long getCarbon() {
		return carbon;
	}
	public void setCarbon(long carbon) {
		this.carbon = carbon;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ChartDTO [rentalDate=");
		builder.append(rentalDate);
		builder.append(", stationNo=");
		builder.append(stationNo);
		builder.append(", rentalCode=");
		builder.append(rentalCode);
		builder.append(", gender=");
		builder.append(gender);
		builder.append(", age=");
		builder.append(age);
		builder.append(", useCount=");
		builder.append(useCount);
		builder.append(", momentum=");
		builder.append(momentum);
		builder.append(", carbon=");
		builder.append(carbon);
		builder.append("]");
		return builder.toString();
	}
	
	
}
