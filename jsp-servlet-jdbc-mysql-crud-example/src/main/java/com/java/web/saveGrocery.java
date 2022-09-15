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

@WebServlet("/saveGrocery")
public class saveGrocery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	@SuppressWarnings("unused")
	private UserDao userDao;

	public void init() {
		userDao = new UserDao();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
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
			User user = new User();
			user.setItemNo(itemNumber);
			user.setItemName(itemName);
			user.setPurchaseDate(purchaseDate);
			user.setQuantity(quantity);

			int status = UserDao.saveGroceryData(user);
			if (status > 0) {
				pWriter.print("<b>Successfully Added</b>");
				response.sendRedirect("index-form.jsp");
			} else {
				pWriter.print("<b>Enter Another ItemNo.</b>");
			}

		} else {
			if (itemNumber.trim() == "" && itemNumber.isEmpty()) {
				messages.put("itemNumber", "* Please enter ItemNo.");
			} else {
				messages.put("itemNumber1", itemNumber);
				messages.put("itemNumber", " ");
			}

			if (itemName.trim() == "" && itemName.isEmpty()) {
				messages.put("itemName", "* Please enter ItemName.");
			} else {
				messages.put("itemName1", itemName);
				messages.put("itemName", " ");
			}

			if (purchaseDate.trim() == "" && purchaseDate.isEmpty()) {
				messages.put("purchaseDate", "* Please enter PurchaseDate.");
			} else {
				messages.put("purchaseDate1", purchaseDate);
				messages.put("purchaseDate", " ");
			}
			if (quantity.trim() == "" && quantity.isEmpty()) {
				messages.put("quantity", "* Please enter Quantity.");
			} else {
				messages.put("quantity1", quantity);
				messages.put("quantity", " ");
			}

			if (messages.size() != 0) {
				pWriter.println(messages);
				request.getRequestDispatcher("index-form.jsp").forward(request, response);
			}
		}
		pWriter.close();
	}
}
