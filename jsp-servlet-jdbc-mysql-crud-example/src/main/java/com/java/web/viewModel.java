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

import org.json.JSONObject;

@WebServlet("/viewModel")
public class viewModel extends HttpServlet {
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

		int id = Integer.parseInt(request.getParameter("id"));
		User user = UserDao.getGroceryRecordByID(id);

		String itemNumber = user.getItemNo();
		String itemName = user.getItemName();
		String purchaseDate = user.getPurchaseDate();
		String quantity = user.getQuantity();

		messages.put("itemNumber", itemNumber);
		messages.put("itemName", itemName);
		messages.put("purchaseDate", purchaseDate);
		messages.put("quantity", quantity);

		response.setContentType("application/json");
		response.getWriter().write((new JSONObject(messages)).toString());
		pWriter.close();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
