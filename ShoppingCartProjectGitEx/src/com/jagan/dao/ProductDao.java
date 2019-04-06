package com.jagan.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Collection;

import com.jagan.bean.ProductBean;
import com.jagan.dbconnection.DriverConnection;

public class ProductDao {
/*this method willreturn the Product Collection object*/
	public Collection<ProductBean> getProducts() {
		try {
			Connection connection = DriverConnection.getConnection();
			/* fetch product from database */
			PreparedStatement ps = connection.prepareStatement("select * from product17");
			ResultSet rs = ps.executeQuery();
			/* create the ArrayList object that hold the product details */
			ArrayList<ProductBean> productList = new ArrayList<>();

			while (rs.next()) {
				ProductBean product = new ProductBean();
				product.setPcode(rs.getString(1));
				product.setPname(rs.getString(2));
				product.setPqty(rs.getInt(3));
				product.setPprice(rs.getDouble(4));
				productList.add(product);
			}
			return productList;

		} catch (Exception e) {
			e.getMessage();
		}
		return null;
	}
}
