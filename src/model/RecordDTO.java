package model;

public class RecordDTO {
	
	double rentLatitude;
	double rentLongitude;
	double returnLatitude;
	double returnLongitude;
	int count;
	
	public RecordDTO() {}
	public RecordDTO(double rentLatitude, double rentLongitude, double returnLatitude, double returnLongitude, int count) {
		this.rentLatitude = rentLatitude;
		this.rentLongitude = rentLongitude;
		this.returnLatitude = returnLatitude;
		this.returnLongitude = returnLongitude;
		this.count = count;
	}
	public double getRentLatitude() {
		return rentLatitude;
	}
	public void setRentLatitude(double rentLatitude) {
		this.rentLatitude = rentLatitude;
	}
	public double getRentLongitude() {
		return rentLongitude;
	}
	public void setRentLongitude(double rentLongitude) {
		this.rentLongitude = rentLongitude;
	}
	public double getReturnLatitude() {
		return returnLatitude;
	}
	public void setReturnLatitude(double returnLatitude) {
		this.returnLatitude = returnLatitude;
	}
	public double getReturnLongitude() {
		return returnLongitude;
	}
	public void setReturnLongitude(double returnLongitude) {
		this.returnLongitude = returnLongitude;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RecordDTO [rentLatitude=");
		builder.append(rentLatitude);
		builder.append(", rentLongitude=");
		builder.append(rentLongitude);
		builder.append(", returnLatitude=");
		builder.append(returnLatitude);
		builder.append(", returnLongitude=");
		builder.append(returnLongitude);
		builder.append(", count=");
		builder.append(count);
		builder.append("]");
		return builder.toString();
	}
	
	
}
