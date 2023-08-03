package com.yakaja.vo;

public class SearchVO {
	
	
	public String hotel_id;
	public String hotel_name;
	public String hotel_address;
	public int hotel_wifi;
	public int hotel_pet;
	public int hotel_bf;
	public int hotel_rs;
	public int hotel_ciga;
	public int hotel_wc;
	public String ravg;
	public String room_imsi;
	public int rank1;
	
	public SearchVO(String hotel_id, String hotel_name, String hotel_address, String ravg, String room_imsi) {
		this.hotel_id=hotel_id;
		this.hotel_name=hotel_name;
		this.hotel_address=hotel_address;
		this.ravg=ravg;
		this.room_imsi=room_imsi;
	}
	public SearchVO(int rank1, String hotel_name, String ravg, String hotel_id) {
		this.rank1=rank1;
		this.hotel_name=hotel_name;
		this.ravg=ravg;
		this.hotel_id=hotel_id;
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
	public String getHotel_address() {
		return hotel_address;
	}
	public void setHotel_address(String hotel_address) {
		this.hotel_address = hotel_address;
	}
	public int getHotel_wifi() {
		return hotel_wifi;
	}
	public void setHotel_wifi(int hotel_wifi) {
		this.hotel_wifi = hotel_wifi;
	}
	public int getHotel_pet() {
		return hotel_pet;
	}
	public void setHotel_pet(int hotel_pet) {
		this.hotel_pet = hotel_pet;
	}
	public int getHotel_bf() {
		return hotel_bf;
	}
	public void setHotel_bf(int hotel_bf) {
		this.hotel_bf = hotel_bf;
	}
	public int getHotel_rs() {
		return hotel_rs;
	}
	public void setHotel_rs(int hotel_rs) {
		this.hotel_rs = hotel_rs;
	}
	public int getHotel_ciga() {
		return hotel_ciga;
	}
	public void setHotel_ciga(int hotel_ciga) {
		this.hotel_ciga = hotel_ciga;
	}
	public int getHotel_wc() {
		return hotel_wc;
	}
	public void setHotel_wc(int hotel_wc) {
		this.hotel_wc = hotel_wc;
	}
	public String getRavg() {
		return ravg;
	}
	public void setRavg(String ravg) {
		this.ravg = ravg;
	}
	public String getRoom_imsi() {
		return room_imsi;
	}
	public void setRoom_imsi(String room_imsi) {
		this.room_imsi = room_imsi;
	}
	public int getRank1() {
		return rank1;
	}
	public void setRank1(int rank1) {
		this.rank1 = rank1;
	}
}
