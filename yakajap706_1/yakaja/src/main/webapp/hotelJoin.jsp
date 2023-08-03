<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="top.jsp"%>

    	<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
                <h3 class="bg-white text-center text-primary px-3">Hotel Join</h3>
                <h1 class="mb-5">호텔등록</h1>
        </div>
        <div class="container">
		  <div class="row justify-content-center">
		    <div class="col-lg-6">
				<form action="hotelJoin.do" method="post" id="form">
					<table class="table table-bordered">
			          <tr>   
						<td>
						    <h5 align="center" class="text-primary">
						    	<span style="flex-grow: 1;">호텔이름</span>
							</h5>
						</td>
						<td>
							<span style="flex-grow: 1;">
								<input type="text" name="hotel_name" class="form-control" required>
							</span>
						</td>
			          </tr>
			          <tr>   
						<td>
						    <h5 align="center" class="text-primary">
						    	<span style="flex-grow: 1;">호텔주소</span>
							</h5>
						</td>
			            <td><input type="text" name="hotel_address" class="form-control" required></td>
			          </tr>
			          <tr>   
						<td>
						    <h5 align="center" class="text-primary">
						    	<span style="flex-grow: 1;">디럭스 가격</span>
							</h5>
						</td>
			            <td><input type="text" name="room_aprice" class="form-control" required></td>
			          </tr>
			          <tr>   
						<td>
						    <h5 align="center" class="text-primary">
						    	<span style="flex-grow: 1;">스탠다드 가격</span>
							</h5>
						</td >
			            <td><input type="text" name="room_bprice" class="form-control" required></td>
			          </tr>
			          <tr>   
						<td>
						    <h5 align="center" class="text-primary">
						    	<span style="flex-grow: 1;">싱글 가격</span>
							</h5>
						</td>
			            <td><input type="text" name="room_cprice" class="form-control" required></td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">와이파이 유무</span>
								<input type="checkbox" name="hotel_wifi" value="hotel_wifi"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">반려동물 수용유무</span>
								<input type="checkbox" name="hotel_pet" value="hotel_pet"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">조식 제공 여부</span>
								<input type="checkbox" name="hotel_bf" value="hotel_bf"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">룸서비스 여부</span>
								<input type="checkbox" name="hotel_rs" value="hotel_rs"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">흡연가능 여부</span>
								<input type="checkbox" name="hotel_ciga" value="hotel_ciga"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>   
			            <td colspan="2">
			            	<div align="center" class="text-primary">
								<span style = "flex-grow: 1;">휠체어</span>
								<input type="checkbox" name="hotel_wc" value="hotel_wc"><br>
			            	</div>
			            </td>
			          </tr>
			          <tr>
			            <td colspan="2" align="center">
			            	<input type="submit" value="호텔 등록" class="btn btn-primary">
			            	<input type="button" value="메인으로" onclick="location.href='main.do'" class="btn btn-primary">
			            </td>
			          </tr>
		        </table>
		      </form>
		    </div>
		  </div>
		</div>

<%@ include file="bottom.jsp"%>