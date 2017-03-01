package com.istar.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.istar.services.CreateService;
import com.istar.services.DeleteService;

@WebServlet("/create_update_personaldetail")
public class CreateOrUpdatePersonalDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CreateOrUpdatePersonalDetail() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		for (Object key : request.getParameterMap().keySet()) {
			String paramName = key.toString();
			Object paramValue = request.getParameter(key.toString());
			System.out.println("Param -> " + paramName + " : Value ->" + paramValue);
		}

		/**
		 * This block gets all the data to edit particular entry in the database
		 */
		if (request.getParameterMap().containsKey("newData")
				&& request.getParameter("newData").equalsIgnoreCase("false")) {

			int editId = Integer.parseInt(request.getParameter("editId"));
			DeleteService csvdel = new DeleteService();
			csvdel.deleteData(editId);

			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String nickname = request.getParameter("nickname");
			Long telno = Long.parseLong(request.getParameter("telno") != "" ? request.getParameter("telno") : "0");
			String dob = request.getParameter("dob");
			String relationship = request.getParameter("relationship");
			String url = request.getParameter("url") != null ? request.getParameter("url") : "-";
			String cname = request.getParameter("cname") != null ? request.getParameter("cname") : "-";
			Long landlineno = Long.parseLong(request.getParameter("landlineno") != null ? request.getParameter("landlineno") : "0");
			String radio1 = request.getParameter("radio1");

			/**
			 * editPersonalData is the method of CreateService class which is
			 * used to create entry in database which take parameters like
			 * editId,name, telno, address, nickname, dob, radio1, relationship.
			 */
			System.out.println("To edit a data" + name);
			
			CreateService createService = new CreateService();
			if (name != "" && address != "" && nickname != "" && dob != "" && radio1 != "" && relationship != "") {
				createService.editPersonalData(editId, name, telno, address, nickname, dob, radio1, relationship, url,
						cname, landlineno);
			}
			/**
			 * This block is to create new entry in the database
			 */
		}
		if (request.getParameterMap().containsKey("newData")
				&& request.getParameter("newData").equalsIgnoreCase("true")) {

			String name = request.getParameter("name");
			String address = request.getParameter("address");
			String nickname = request.getParameter("nickname");
			Long telno = Long.parseLong(request.getParameter("telno") != "" ? request.getParameter("telno") : "0");
			String dob = request.getParameter("dob");
			String relationship = request.getParameter("relationship");
			String url = request.getParameter("url") != "" ? request.getParameter("url") : "-";
			String cname = request.getParameter("cname") != "" ? request.getParameter("cname") : "-";
			Long landlineno = Long.parseLong(request.getParameter("landlineno") != "" ? request.getParameter("landlineno") : "0");
			String radio1 = request.getParameter("radio1");

			/**
			 * mapping.getCourse().getCourseName() != null ?
			 * mapping.getCourse().getCourseName() :"NO COURSE ASSIGNED"
			 * writePersonalData is the method of CreateService class which is
			 * used to create entry in database which take parameters like name,
			 * telno, address, nickname, dob, radio1, relationship.
			 */
			CreateService createService = new CreateService();
			if (name != "" && address != "" && nickname != "" && dob != "" && radio1 != "" && relationship != "") {
				createService.writePersonalData(name, telno, address, nickname, dob, radio1, relationship, url, cname,
						landlineno);
			}
			/**
			 * This block is to delete particular entry in the database
			 */
		}
		if (request.getParameterMap().containsKey("delData")
				&& request.getParameter("delData").equalsIgnoreCase("true")) {

			int delData = Integer.parseInt(request.getParameter("deleteId"));

			/**
			 * deletePersonalData is the method of DeleteService class which is
			 * used to delete entry in database which take parameters like id.
			 */
			DeleteService deletePersonalData = new DeleteService();
			deletePersonalData.deleteData(delData);
		}

		response.sendRedirect("/ContactBook/address_book.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
