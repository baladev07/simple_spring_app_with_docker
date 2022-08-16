package com.spring_app;

import java.sql.SQLException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class controller
{
	@Autowired
	private JdbcTemplate jdbcTemplate;

	@GetMapping(path="/start")
	public static String method()
	{
        return "Hello demo application";
	}

	@GetMapping(path="/branch")
	public static String branch()
	{
		return "Hello from branch_2";
	}


	@GetMapping(path="/post")
	public String insertCustomer() throws SQLException
	{
		try
		{
			String name = String.valueOf(System.currentTimeMillis());
			String sql = "INSERT INTO customer_table (customer_name,customer_product) VALUES (?,?)";
			int result = jdbcTemplate.update(sql, name, "testing");
			if(result > 0)
			{
				return "Data Added";
			}
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return "Nothing Added";
	}
}
