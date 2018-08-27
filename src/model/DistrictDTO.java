package model;

public class DistrictDTO {
	
	String stationNo;
	String stationName;
	int s_holdNum;
	int s_bikeNum;
	int h_holdNum;
	int h_boardNum;
	public DistrictDTO() {}
	public DistrictDTO(String stationNo, String stationName, int s_holdNum, int s_bikeNum, int h_holdNum,
			int h_boardNum) {
		super();
		this.stationNo = stationNo;
		this.stationName = stationName;
		this.s_holdNum = s_holdNum;
		this.s_bikeNum = s_bikeNum;
		this.h_holdNum = h_holdNum;
		this.h_boardNum = h_boardNum;
	}
	public String getStationNo() {
		return stationNo;
	}
	public void setStationNo(String stationNo) {
		this.stationNo = stationNo;
	}
	public String getStationName() {
		return stationName;
	}
	public void setStationName(String stationName) {
		this.stationName = stationName;
	}
	public int getS_holdNum() {
		return s_holdNum;
	}
	public void setS_holdNum(int s_holdNum) {
		this.s_holdNum = s_holdNum;
	}
	public int getS_bikeNum() {
		return s_bikeNum;
	}
	public void setS_bikeNum(int s_bikeNum) {
		this.s_bikeNum = s_bikeNum;
	}
	public int getH_holdNum() {
		return h_holdNum;
	}
	public void setH_holdNum(int h_holdNum) {
		this.h_holdNum = h_holdNum;
	}
	public int getH_boardNum() {
		return h_boardNum;
	}
	public void setH_boardNum(int h_boardNum) {
		this.h_boardNum = h_boardNum;
	}
	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("DistrictDTO [stationNo=");
		builder.append(stationNo);
		builder.append(", stationName=");
		builder.append(stationName);
		builder.append(", s_holdNum=");
		builder.append(s_holdNum);
		builder.append(", s_bikeNum=");
		builder.append(s_bikeNum);
		builder.append(", h_holdNum=");
		builder.append(h_holdNum);
		builder.append(", h_boardNum=");
		builder.append(h_boardNum);
		builder.append("]");
		return builder.toString();
	}
	
	
}
