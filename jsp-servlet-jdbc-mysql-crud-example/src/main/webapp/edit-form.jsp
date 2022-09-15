<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crud Operation</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<script>
	function ItemNo() {
		var itemNo = document.forms.AddGroceryForm1.itemNo.value;

		if (itemNo == "") {
			document.getElementById("errNumber").innerHTML = "* Please enter ItemNo.";
		} else {
			document.getElementById("errNumber").innerHTML = "";
		}
	}

	function ItemName() {
		var itemName = document.forms.AddGroceryForm1.itemName.value;

		if (itemName == "") {
			document.getElementById("errName").innerHTML = "* Please enter ItemName.";
		} else {
			document.getElementById("errName").innerHTML = "";
		}
	}

	function PurchaseDate() {
		var purchaseDate = document.forms.AddGroceryForm1.purchaseDate.value;

		if (purchaseDate == "") {
			document.getElementById("errDate").innerHTML = "* Please enter PurchaseDate.";
		} else {
			document.getElementById("errDate").innerHTML = "";
		}
	}

	function Quantity() {
		var quantity = document.forms.AddGroceryForm1.quantity.value;

		if (quantity == "") {
			document.getElementById("errQue").innerHTML = "* Please enter Quantity.";
		} else {
			document.getElementById("errQue").innerHTML = "";
		}
	}
	function AllValidate() {
		ItemNo();
		ItemName();
		PurchaseDate();
		Quantity();
	}
</script>

</head>
<body>
	<%@page import="com.java.bean.User"%>
	<%@page import="com.java.dao.UserDao"%>
	<%@page import="com.java.web.saveGrocery"%>
	<%@page import="com.java.web.deleteGrocery"%>
	<%@page import="com.java.web.updateGrocery"%>
	<%@page import="com.java.dao.UserDao,com.java.bean.*,java.util.*"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m"%>

	

	<%
	String id = request.getParameter("id");
	User u = UserDao.getGroceryRecordByID(Integer.parseInt(id));
	%>
	
	
	
	<p class="fs-1 text-center fw-bold">Grocery Management</p>

	<form class="container  col-lg-10" action="updateGrocery"
		method="post"  name="AddGroceryForm1" id="formData">

		<input type="hidden" name="id" value="<%=u.getId()%>" />
		<div class=" row mx-auto  d-flex justify-content-center pt-3">
			<label for="inputNumber" class="col-sm-2 col-form-label fs-5">Item
				No:</label>
			<div class="col-sm-4">
				<input type="number" class="form-control mt-2 shadow bg-white"
					min="1" id="inputNumber" name="itemNo" value="<%=u.getItemNo()%>"
					>
			</div>
			<span id="errNumber" class="text-danger" style="margin-left: 1040px" onblur="ItemNo()">${messages.itemNumber}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="inputName" class="col-sm-2 col-form-label fs-5">Item
				Name:</label>
			<div class="col-sm-4">
				<input type="text" class="form-control mt-2 shadow bg-white"
					id="inputName" name="itemName" value="<%=u.getItemName()%>"
					>
			</div>
			<span id="errName" class="text-danger" style="margin-left: 1040px" onblur="ItemName()">${messages.itemName}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="inputDate" class="col-sm-2 col-form-label fs-5">Purchase
				Date:</label>
			<div class="col-sm-4">
				<input type="date" class="form-control mt-2 shadow bg-white"
					id="inputDate" name="purchaseDate" value="<%=u.getPurchaseDate()%>"
					>
			</div>
			<span id="errDate" class="text-danger" style="margin-left: 1040px" onblur="PurchaseDate()">${messages.purchaseDate}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="Quantity" class="col-sm-2 col-form-label fs-5">Quantity:</label>
			<div class="col-sm-4">
				<select class="form-control mt-2 shadow bg-white" id="quantity"
					name="quantity" value="<%=u.getQuantity()%>" >
					<option selected value="">Select Quantity</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="3">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
			</div>
			<span id="errQue" class="text-danger" style="margin-left: 1040px;" onblur="Quantity()">${messages.quantity}</span>
		</div>


		<div class="row " style="margin-left: 20px">
			<div
				class="col-sm-10 col-xl-5 col-lg-6 col-md-8 mx-auto text-center form p-4">
				
				<input type="submit"
					class="btn btn-success col-sm-2 mt-2 px-1 fs-5 mx-2 shadow bg-green"
					value="Update" onclick="return AllValidate()"> <a href="index.jsp"
					class="btn btn-success col-sm-2 mt-2 px-1 fs-5 mx-1 shadow bg-green">Back</a>

			</div>
		</div>
	</form>
</body>
</html>