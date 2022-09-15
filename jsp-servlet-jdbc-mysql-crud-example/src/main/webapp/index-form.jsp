<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Crud Operation</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
		var itemNo = document.forms.AddGroceryForm.itemNo.value;

		if (itemNo == "") {
			document.getElementById("errNumber").innerHTML = "* Please enter ItemNo.";
		}
	}

	function ItemName() {
		var itemName = document.forms.AddGroceryForm.itemName.value;

		if (itemName == "") {
			document.getElementById("errName").innerHTML = "* Please enter ItemName.";
		} else {
			document.getElementById("errName").innerHTML = "";
		}
	}

	function PurchaseDate() {
		var purchaseDate = document.forms.AddGroceryForm.purchaseDate.value;

		if (purchaseDate == "") {
			document.getElementById("errDate").innerHTML = "* Please enter PurchaseDate.";
		} else {
			document.getElementById("errDate").innerHTML = "";
		}
	}

	function Quantity() {
		var quantity = document.forms.AddGroceryForm.quantity.value;

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

	function ResetValue() {
		var ResetitemNo = document.forms.AddGroceryForm.itemNo.value;
		var ResetitemName = document.forms.AddGroceryForm.itemName.value;
		var ResetpurchaseDate = document.forms.AddGroceryForm.purchaseDate.value;
		var Resetquantity = document.forms.AddGroceryForm.quantity.value;

		if (ResetitemNo != "" || ResetitemName != "" || ResetpurchaseDate != ""
				|| Resetquantity != "") {
			document.getElementById("inputNumber").value = "";
			document.getElementById("inputName").value = "";
			document.getElementById("inputDate").value = "";
			document.getElementById("quantity").value = "";

			document.getElementById('errNumber').innerHTML = "";
			document.getElementById('errName').innerHTML = "";
			document.getElementById('errDate').innerHTML = "";
			document.getElementById('errQue').innerHTML = "";
		}

	}
</script>
</head>
<body>

	<%@page import="com.java.bean.User"%>
	<%@page import="com.java.dao.UserDao"%>
	<%@page import="com.java.web.saveGrocery"%>
	<%@page import="com.java.web.deleteGrocery"%>
	<%@page import="com.java.web.updateGrocery"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m"%>


	<p class="fs-1 text-center fw-bold">Grocery Management</p>

	<form class="container  col-lg-10" action="saveGrocery" method="post"
		name="AddGroceryForm">

		<m:if test="${user != null}">
			<input type="hidden" name="id" />
		</m:if>

		<div class=" row mx-auto  d-flex justify-content-center pt-3">
			<label for="inputNumber" class="col-sm-2 col-form-label fs-5">Item
				No:</label>
			<div class="col-sm-4">
				<input type="number" class="form-control mt-2 shadow bg-white"
					min="1" id="inputNumber" name="itemNo"
					value="<m:out value='${messages.itemNumber1}'/>">
			</div>
			<span id="errNumber" class="text-danger" style="margin-left: 1040px"
				onblur="ItemNo()">${messages.itemNumber}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="inputName" class="col-sm-2 col-form-label fs-5">Item
				Name:</label>
			<div class="col-sm-4">
				<input type="text" class="form-control mt-2 shadow bg-white"
					id="inputName" name="itemName"
					value="<m:out value='${messages.itemName1}'/>">
			</div>
			<span id="errName" class="text-danger" style="margin-left: 1040px"
				onblur="ItemName()">${messages.itemName}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="inputDate" class="col-sm-2 col-form-label fs-5">Purchase
				Date:</label>
			<div class="col-sm-4">
				<input type="date" class="form-control mt-2 shadow bg-white"
					id="inputDate" name="purchaseDate"
					value="<m:out value='${messages.purchaseDate1}'/>">
			</div>
			<span id="errDate" class="text-danger" style="margin-left: 1040px"
				onblur="PurchaseDate()">${messages.purchaseDate}</span>
		</div>

		<div class="row mx-auto d-flex justify-content-center pt-3">
			<label for="Quantity" class="col-sm-2 col-form-label fs-5">Quantity:</label>
			<div class="col-sm-4">
				<select class="form-control mt-2 shadow bg-white" id="quantity"
					name="quantity" value="<m:out value='${messages.quantity1}'/>">
					<option selected value="">Select Quantity</option>
					<option value="1">1</option>
					<option value="2">2</option>
					<option value="2">3</option>
					<option value="4">4</option>
					<option value="5">5</option>
					<option value="6">6</option>
				</select>
			</div>
			<span id="errQue" class="text-danger" style="margin-left: 1040px;"
				onblur="Quantity()">${messages.quantity}</span>
		</div>


		<div class="row " style="margin-left: 20px">
			<div
				class="col-sm-10 col-xl-5 col-lg-6 col-md-8 mx-auto text-center form p-4">

				<button type="submit"
					class="btn btn-success col-sm-2 mt-2 px-1 fs-5 mx-1 shadow bg-green"
					id="saveButton" onclick="return AllValidate()">Save</button>

				<input type="reset"
					class="btn btn-success col-sm-2 mt-2 px-1 fs-5 mx-1 shadow bg-green"
					value="Reset" onclick="ResetValue()"> <a href="index.jsp"
					class="btn btn-success col-sm-2 mt-2 px-1 fs-5 mx-1 shadow bg-green">Back</a>



			</div>
		</div>
	</form>


</body>
</html>
