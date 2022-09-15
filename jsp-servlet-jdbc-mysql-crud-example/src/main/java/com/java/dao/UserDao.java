package com.java.dao;

import com.java.web.*;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.jsp.JspWriter;

import com.java.bean.User;

public class UserDao {
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbName", "userName", "password");

		} catch (Exception e) {
			System.out.println(e);
		}
		return connection;
	}

	public static int saveGroceryData(User u) {
		int status = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"insert into tableName (ItemNo, ItemName, PurchaseDate, Quantity) values(?,?,?,?)");

			preparedStatement.setString(1, u.getItemNo());
			preparedStatement.setString(2, u.getItemName());
			preparedStatement.setString(3, u.getPurchaseDate());
			preparedStatement.setString(4, u.getQuantity());

			status = preparedStatement.executeUpdate();
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int updateGroceryData(User u) {
		int status = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement(
					"update tableName set ItemNo=?, ItemName=?, PurchaseDate=?, Quantity=? where ID=?");

			preparedStatement.setString(1, u.getItemNo());
			preparedStatement.setString(2, u.getItemName());
			preparedStatement.setString(3, u.getPurchaseDate());
			preparedStatement.setString(4, u.getQuantity());
			preparedStatement.setInt(5, u.getId());

			status = preparedStatement.executeUpdate();
		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static int deleteGroceryData(User u) {
		int status = 0;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("delete from tableName where Id=?");

			preparedStatement.setInt(1, u.getId());

			status = preparedStatement.executeUpdate();
			connection.close();

		} catch (Exception e) {
			System.out.println(e);
		}
		return status;
	}

	public static List<User> getGroceryRecord() {
		List<User> list = new ArrayList<User>();
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from tableName");
			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				User user = new User();

				user.setId(resultSet.getInt("Id"));
				user.setItemNo(resultSet.getString("itemNo"));
				user.setItemName(resultSet.getString("itemName"));
				user.setPurchaseDate(resultSet.getString("purchaseDate"));
				user.setQuantity(resultSet.getString("quantity"));

				list.add(user);
			}
			connection.close();
		} catch (Exception e) {
			System.out.println(e);
		}
		return list;
	}

	public static User getGroceryRecordByID(int id) {
		User user = null;
		try {
			Connection connection = getConnection();
			PreparedStatement preparedStatement = connection.prepareStatement("select * from tableName where Id=?");
			preparedStatement.setInt(1, id);

			ResultSet resultSet = preparedStatement.executeQuery();

			while (resultSet.next()) {
				user = new User();

				user.setId(resultSet.getInt("Id"));
				user.setItemNo(resultSet.getString("itemNo"));
				user.setItemName(resultSet.getString("itemName"));
				user.setPurchaseDate(resultSet.getString("purchaseDate"));
				user.setQuantity(resultSet.getString("quantity"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return user;
	}
}
