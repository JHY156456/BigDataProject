package model;

public class RentalReturnDTO {
	
	double latitude;
	double longitude;
	int rentalNum;
	int returnNum;
	
	public RentalReturnDTO() {}
	public RentalReturnDTO(double latitude, double longitude, int rentalNum, int returnNum) {
		super();
		this.latitude = latitude;
		this.longitude = longitude;
		this.rentalNum = rentalNum;
		this.returnNum = returnNum;
	}
	public double getLatitude() {
		return latitude;
	}
	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}
	public double getLongitude() {
		return longitude;
	}
	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}
	public int getRentalNum() {
		return rentalNum;
	}
	public void setRentalNum(int rentalNum) {
		this.rentalNum = rentalNum;
	}
	public int getReturnNum() {
		return returnNum;
	}
	public void setReturnNum(int returnNum) {
		this.returnNum = returnNum;
	}
	
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("RentalReturnDTO [latitude=");
		builder.append(latitude);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append(", rentalNum=");
		builder.append(rentalNum);
		builder.append(", returnNum=");
		builder.append(returnNum);
		builder.append("]");
		return builder.toString();
	}
	
}
