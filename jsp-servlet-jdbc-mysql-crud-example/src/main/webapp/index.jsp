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

<style>
.mx-5 {
	margin-right: 3rem !important;
	margin-left: 79rem !important;
}

.mt-2 {
	margin-top: 0.5rem !important;
}
</style>
<script type="text/javascript">

var deleteData;
<!-- Open Model and transfer ID-->
function confirmDeleteGrocery(deleteID){
	// deleteData = deleteID;
	console.log("ID =>" + deleteData);
	$("#deleteModel").modal("toggle");
	
	myDeleteId = document.getElementById("hiddenId");
	myDeleteId.setAttribute('custome-id', deleteID);
}
<!-- Model Delete Button-->
function deleteModel() {
	
	var del = myDeleteId.getAttribute('custome-id');
	
	console.log("Hello =>" + del);
	window.location.href="deleteGrocery?id="+del+"";
}


function confirmViewGrocery(viewID){

	$.ajax({
		type: "get",
		url: "viewModel?id="+viewID+"",
		dataType: "text",
		cache: false,
		success: function(responseText){
			var modelData = JSON.parse(responseText);
			
			$("#viewModel #itemNumber").text(modelData.itemNumber);
			$("#viewModel #itemName").text(modelData.itemName);
			$("#viewModel #purchaseDate").text(modelData.purchaseDate);
			$("#viewModel #quantity").text(modelData.quantity);
			
			$("#viewModel").modal("show");
		}
	});
}

</script>
</head>
<body>


	<%@page import="com.java.bean.User"%>
	<%@page import="com.java.dao.UserDao"%>
	<%@page import="com.java.web.saveGrocery"%>
	<%@page import="com.java.web.deleteGrocery"%>
	<%@page import="com.java.web.updateGrocery"%>
	<%@page import="com.java.web.viewModel"%>
	<%@page import="com.java.dao.UserDao,com.java.bean.*,java.util.*"%>

	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="m"%>


	<%
	UserDao userDao;
	List<User> listUser = UserDao.getGroceryRecord();
	request.setAttribute("listUser", listUser);
	%>




	<a href="index-form.jsp"
		class="btn btn-success col-sm-1 mt-2 px-1 fs-5 mx-5 shadow bg-green"
		id="addUser">Add User</a>
	<div class="container mt-5 col-sm-10">
		<table class="table table-bordered text-center fs-5 col-sm-1"
			id="tableData">
			<thead>
				<tr>
					<th>Item No.</th>
					<th>Item Name</th>
					<th>Purchase Date</th>
					<th>Quantity</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>


				<input type="hidden" id="hiddenId">


				<m:forEach var="user" items="${listUser }">

					<tr>
						<td><m:out value="${user.itemNo }"></m:out></td>
						<td><m:out value="${user.itemName }"></m:out></td>
						<td><m:out value="${user.purchaseDate }"></m:out></td>
						<td><m:out value="${user.quantity }"></m:out></td>
						<!--  <td><m:out value="${user.quantity }"></m:out></td>-->

						<td><a href="edit-form.jsp?id=<m:out value='${user.id }'/>"
							class="btn btn-link mt-2 shadow-none text-primary"><i
								class="fa fa-pencil-square-o fa-2x" aria-hidden="true"></i></a>
							<button class="btn btn-link mt-2 shadow-none text-danger delete"
								onclick="confirmDeleteGrocery('${user.id }')" id="et">
								<i class="fa fa-trash-o fa-2x" aria-hidden="true"></i>
							</button>
							<button class="btn btn-link mt-2 shadow-none text-primary"
								id="view" onclick="confirmViewGrocery('${user.id }')">
								<i class="fa fa-eye fa-2x" aria-hidden="true"></i>
							</button></td>

					</tr>
				</m:forEach>

			</tbody>
		</table>

	</div>


	<!--deleteMessage-->

	<div class="modal fade" id="deleteModel" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">

				<div class="modal-header">
					<h4 class="modal-title fw-bolder" id="exampleModalLabel">Grocery
						Management</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<p class="fs-4">Are you sure to delete this data?</p>
				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">cancel</button>

					<button type="button" class="btn btn-danger"
						id="deleteGroceryButton" data-bs-dismiss="modal"
						onclick="deleteModel()">Delete</button>

				</div>

			</div>
		</div>
	</div>


	<!--viewModel-->

	<div class="modal fade " id="viewModel" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">Grocery Details</h4>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>

				<div class="modal-body">
					<div class="row">
						<div class="col-sm-5 fw-bolder mt-1 fs-4 my-2">Item No:</div>
						<div class="col-sm-7 mx-auto fs-4 my-2" id="itemNumber"></div>
					</div>

					<div class="row">
						<div class="col-sm-5 fw-bolder mt-1 fs-4 my-2">Item Name:</div>
						<div class="col-sm-7 mx-auto fs-4 my-2" id="itemName"></div>
					</div>

					<div class="row">
						<div class="col-sm-5 fw-bolder mt-1 fs-4 my-2">Purchase
							Date:</div>
						<div class="col-sm-7 mx-auto fs-4 my-2" id="purchaseDate"></div>
					</div>

					<div class="row">
						<div class="col-sm-5 fw-bolder mt-1 fs-4 my-2">Quantity:</div>
						<div class="col-sm-7 mx-auto fs-4 my-2" id="quantity"></div>
					</div>

				</div>

				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						data-bs-dismiss="modal">Cancle</button>
				</div>

			</div>

		</div>
	</div>

</body>
</html>