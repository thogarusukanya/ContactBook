package com.istar.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istar.pojo.PersonalDetails;
import com.istar.services.ReadService;

@WebServlet("/search_personal_details")
public class SearchPersonalDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchPersonalDetails() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		for (Object key : request.getParameterMap().keySet()) {
			String paramName = key.toString();
			Object paramValue = request.getParameter(key.toString());
			System.out.println("Param -> " + paramName + " : Value ->" + paramValue);

		}
			String searchdata;
			List<PersonalDetails> allPersonalDetails = null;
			if (!request.getParameter("name").equalsIgnoreCase("")) {
				
				 searchdata = request.getParameter("name");				 
				allPersonalDetails = ReadService.searchByName(searchdata);
								 
			} else if (!request.getParameter("telno").equalsIgnoreCase("")) {				
				 searchdata = request.getParameter("telno");

				 allPersonalDetails = ReadService.searchByTelNo(searchdata);
			}

			//request.setAttribute("allPersonalDetails", allPersonalDetails);
			//response.sendRedirect("/MyPhoneBook/address_book.jsp?allPersonalDetails="+allPersonalDetails);
			
			request.setAttribute("allPersonalDetails", allPersonalDetails);
			request.getRequestDispatcher("/address_book.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
