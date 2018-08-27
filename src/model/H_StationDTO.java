package model;

public class H_StationDTO {
	
	String stationID;
	String stationName;
	String district;
	int holdNum;
	int boardNum;
	double latitude;
	double longitude;
	
	public H_StationDTO() {}

	public H_StationDTO(String stationID, String stationName, String district, int holdNum, int boardNum,
			double latitude, double longitude) {
		super();
		this.stationID = stationID;
		this.stationName = stationName;
		this.district = district;
		this.holdNum = holdNum;
		this.boardNum = boardNum;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public String getStationID() {
		return stationID;
	}

	public void setStationID(String stationID) {
		this.stationID = stationID;
	}

	public String getStationName() {
		return stationName;
	}

	public void setStationName(String stationName) {
		this.stationName = stationName;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}

	public int getHoldNum() {
		return holdNum;
	}

	public void setHoldNum(int holdNum) {
		this.holdNum = holdNum;
	}

	public int getBoardNum() {
		return boardNum;
	}

	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("H_StationDTO [stationID=");
		builder.append(stationID);
		builder.append(", stationName=");
		builder.append(stationName);
		builder.append(", district=");
		builder.append(district);
		builder.append(", holdNum=");
		builder.append(holdNum);
		builder.append(", boardNum=");
		builder.append(boardNum);
		builder.append(", latitude=");
		builder.append(latitude);
		builder.append(", longitude=");
		builder.append(longitude);
		builder.append("]");
		return builder.toString();
	}
	
}
