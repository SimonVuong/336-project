package com.amzi.servlet;  

import java.io.IOException;  
import java.io.InputStream;  
import java.sql.Connection;  
import java.sql.PreparedStatement;  
import java.sql.SQLException;  
  
import javax.servlet.ServletException;  
import javax.servlet.annotation.MultipartConfig;  
import javax.servlet.annotation.WebServlet;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.Part; 

import com.amzi.util.DbUtil; 

@WebServlet("/upload")  
@MultipartConfig

public class UploadServlet extends HttpServlet  {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Connection conn;  
  
    public UploadServlet() {  
        conn = DbUtil.getConnection();  
    }  
  
    protected void doPost(HttpServletRequest request,  
            HttpServletResponse response) throws ServletException, IOException {  
          
        // gets values of text fields  
    	String interest = "";
    	
    	if(request.getParameter("carsInterest") != null){
    		interest = request.getParameter("carsInterest");
    	}
    	
    	if(request.getParameter("socksInterest") != null){
    		interest = request.getParameter("socksInterest");
    	}
    	
    	if(request.getParameter("horsesInterest") != null){
    		interest = request.getParameter("horsesInterest");
    	}
  
        InputStream inputStream = null;  
        String message = "nothing works!"; // message will be sent back to client  
        // obtains the upload file part in this multipart request  
    	Part filePart = request.getPart("file"); 
        if (filePart != null) {  
            // debug messages  
            System.out.println(filePart.getName());  
            System.out.println(filePart.getSize());  
            System.out.println(filePart.getContentType());  
  
            // obtains input stream of the upload file  
            inputStream = filePart.getInputStream();  
            message="get part works";
        }  
  
        
  
        try {  
            // constructs SQL statement  
            String sql = "INSERT INTO Advertisement(interest, image) values (?,?,?) ";  
            PreparedStatement stmt = conn.prepareStatement(sql);  
        	stmt.setString(1, interest);
        	
        	message="get part works" + "interest added";
            if (inputStream != null) {  
                // fetches input stream of the upload file for the blob column  
            	stmt.setBlob(2, inputStream);  
            	message="get part works" + "interest added" + "blob set";
            }  
  
            // sends the statement to the database server  
            int row = stmt.executeUpdate();  
            if (row > 0) {  
                message = "Ad Added";  
            }  
        } catch (SQLException ex) {  
            message = "ERROR: " + ex.getMessage();  
            ex.printStackTrace();  
        }  
        // sets the message in request scope  
        request.setAttribute("Message", message);  
  
        // forwards to the message page  
        getServletContext().getRequestDispatcher("/addAdVerify.jsp").forward(  
                request, response);  
    }  
}
