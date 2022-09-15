package com.java.web;

import com.java.bean.*;
import com.java.dao.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/updateGrocery")
public class updateGrocery extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unused")
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Map<String, String> messages = new HashMap<String, String>();
		request.setAttribute("messages", messages);

		response.setContentType("text/html");
		PrintWriter pWriter = response.getWriter();

		String itemNumber = request.getParameter("itemNo").trim();
		String itemName = request.getParameter("itemName").trim();
		String purchaseDate = request.getParameter("purchaseDate").trim();
		String quantity = request.getParameter("quantity").trim();

		if ((itemNumber != "") && (itemName != "") && (purchaseDate != "") && (quantity != "")) {
			int id = Integer.parseInt(request.getParameter("id"));

			User user = new User(id, itemNumber, itemName, purchaseDate, quantity);
			UserDao.updateGroceryData(user);
			response.sendRedirect("index.jsp");

		} else {
			if (itemNumber == "" && itemNumber.isEmpty()) {
				messages.put("itemNumber", "* Please enter ItemNo.");
			} else {
				messages.put("itemNumber", " ");
			}

			if (itemName == "" && itemName.isEmpty()) {
				messages.put("itemName", "* Please enter ItemName.");
			} else {
				messages.put("itemName", " ");
			}

			if (purchaseDate == "" && purchaseDate.isEmpty()) {
				messages.put("purchaseDate", "* Please enter PurchaseDate.");
			} else {
				messages.put("purchaseDate", " ");
			}
			if (quantity == "" && quantity.isEmpty()) {
				messages.put("quantity", "* Please enter Quantity.");
			} else {
				messages.put("quantity", " ");
			}

			if (messages.size() != 0) {
				pWriter.println(messages);
				request.getRequestDispatcher("edit-form.jsp").forward(request, response);
			}
			pWriter.close();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
