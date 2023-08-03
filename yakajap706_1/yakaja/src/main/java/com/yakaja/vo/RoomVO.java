package com.yakaja.vo;

public class RoomVO {
	
	public String room_imsi;
	public int room_num;
	public String room_rank;
	public int room_bath;
	public int room_bed;
	public int room_kit;
	public int room_size;
	public String hotel_id;
	public String hotel_name;
	
	public RoomVO(String room_imsi,String hotel_id) {
		this.room_imsi=room_imsi;
		this.hotel_id=hotel_id;
	}
	
	public RoomVO(int room_num, String room_rank, int room_bath, int room_bed, int room_kit, int room_size) {
		this.room_num=room_num;
		this.room_rank=room_rank;
		this.room_bath=room_bath;
		this.room_bed=room_bed;
		this.room_kit=room_kit;
		this.room_size=room_size;
	}
	
	public String getRoom_imsi() {
		return room_imsi;
	}
	
	public void setRoom_imsi(String room_imsi) {
		this.room_imsi = room_imsi;
	}
	
	public int getRoom_num() {
		return room_num;
	}
	
	public void setRoom_num(int room_num) {
		this.room_num = room_num;
	}
	
	public String getRoom_rank() {
		return room_rank;
	}
	
	public void setRoom_rank(String room_rank) {
		this.room_rank = room_rank;
	}
	
	public int getRoom_bath() {
		return room_bath;
	}
	
	public void setRoom_bath(int room_bath) {
		this.room_bath = room_bath;
	}
	
	public int getRoom_bed() {
		return room_bed;
	}
	
	public void setRoom_bed(int room_bed) {
		this.room_bed = room_bed;
	}
	
	public int getRoom_kit() {
		return room_kit;
	}
	
	public void setRoom_kit(int room_kit) {
		this.room_kit = room_kit;
	}
	
	public int getRoom_size() {
		return room_size;
	}
	
	public void setRoom_size(int room_size) {
		this.room_size = room_size;
	}
	
	public String getHotel_id() {
		return hotel_id;
	}
	
	public void setHotel_id(String hotel_id) {
		this.hotel_id = hotel_id;
	}
	
	public String getHotel_name() {
		return hotel_name;
	}
	
	public void setHotel_name(String hotel_name) {
		this.hotel_name = hotel_name;
	}

}
