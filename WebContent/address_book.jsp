<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.istar.services.ReadService"%>
<%@page import="com.istar.services.CoreService"%>
<%@page import="com.istar.pojo.PersonalDetails"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String url = request.getRequestURL().toString();
	String baseURL = url.substring(0, url.length() - request.getRequestURI().length())
			+ request.getContextPath() + "/";
%>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>PhoneBook | Form</title>
<link href="<%=baseURL%>css/bootstrap.min.css" rel="stylesheet">
<link href="<%=baseURL%>font-awesome/css/font-awesome.css"
	rel="stylesheet">
<link href="<%=baseURL%>css/animate.css" rel="stylesheet">
<link href="<%=baseURL%>css/style.css" rel="stylesheet">

<link href="css/plugins/dataTables/datatables.min.css" rel="stylesheet">

<%
	boolean newData = true;
	ReadService rs = new ReadService();
	int id = 0;
	PersonalDetails pdetails = new PersonalDetails();
	if (request.getParameterMap().containsKey("editId")) {
		id = Integer.parseInt(request.getParameter("editId"));
		pdetails = rs.readData(id);
		newData = false;
	}
%>

</head>
<body>
	<div id="wrapper">
		<div id="page-wrapper" class="gray-bg"
			style="min-height: 418px; margin-left: auto;">
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Phone Book</h5>

						</div>
						<div class="ibox-content">
							<form class="form-horizontal" method="POST"
								action="<%=baseURL%>create_update_personaldetail">
								<p>Sign in today for more experience.</p>
								<div class="form-group">
									<label class="col-lg-2 control-label">Name</label> <input
										type="hidden" name="newData" value="<%=newData%>"> <input
										type="hidden" name="editId" value="<%=id%>">
									<div class="col-lg-4">
										<input type="text" placeholder="Name" name="name"
											value="<%=!newData ? pdetails.getName() : ""%>"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Tel No</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" name="telno"
											value="<%=!newData ? pdetails.getTelno() : ""%>"
											data-mask="9999999999" placeholder=""> <span
											class="help-block">9999999999</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-sm-2 control-label">DOB</label>
									<div class="col-sm-4">
										<input type="text" class="form-control" data-mask="99/99/9999"
											value="<%=!newData ? pdetails.getDob() : ""%>" name="dob"
											placeholder=""> <span class="help-block">dd/mm/yyyy</span>
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Address</label>

									<div class="col-lg-6">
										<input type="text" placeholder="Address" name="address"
											value="<%=!newData ? pdetails.getAddress() : ""%>"
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Nick Name</label>

									<div class="col-lg-4">
										<input type="text" placeholder="NickName" name="nickname"
											value="<%=!newData ? pdetails.getNickname() : ""%>"
											class="form-control">
									</div>
								</div>
								<div class="form-group">
									<label class="col-lg-2 control-label">Relationship</label>

									<div class="col-lg-4">
										<input type="text" placeholder="Relationship"
											value="<%=!newData ? pdetails.getRelationship() : ""%>"
											name="relationship" class="form-control">
									</div>
								</div>
								<div id="set_visible" style="display: none">
									<div class="form-group">
										<label class="col-lg-2 control-label">Website</label>

										<div class="col-lg-4">
											<input type="text" placeholder="Url"
												value="<%=!newData ? pdetails.getWebsite() : ""%>"
												name="url" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Company Name</label>

										<div class="col-lg-4">
											<input type="text" placeholder="company name"
												value="<%=!newData ? pdetails.getCompanyname() : ""%>"
												name="cname" class="form-control">
										</div>
									</div>

									<div class="form-group">
										<label class="col-lg-2 control-label">Landline No</label>

										<div class="col-lg-4">
											<input type="number" placeholder="landlineno"
												value="<%=!newData ? pdetails.getLandlineno() : ""%>"
												name="landlineno" class="form-control">
										</div>
									</div>
								</div>



								<div class="form-group">


									<div class="col-lg-10" style="margin-left: 261px;">
										<div class="col-md-10">
											<fieldset>

												<div class="row">
													<div class="col-sm-10">
														<div class="radio">
															<input type="radio" name="radio1" id="radio1"
																value="personal" checked="checked"> <label
																for="radio1"> Add- personal </label>
														</div>
														<div class="radio">
															<input type="radio" name="radio1" id="radio2"
																value="business"> <label for="radio2">
																Add- Business </label>
														</div>
													</div>

												</div>

											</fieldset>
										</div>
									</div>
								</div>



								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-sm btn-white" type="submit">Add</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>List Display</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>
											<th>Nick Name</th>
											<th>Type</th>
											<th>Relationship</th>
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											List<PersonalDetails> allPersonalDetailsList = CoreService.readPersonalDetails();

											for (PersonalDetails pd : allPersonalDetailsList) {
										%>
										<tr class="gradeX">
											<td><%=pd.getName()%></td>
											<td><%=pd.getTelno()%></td>
											<td><%=pd.getDob()%></td>
											<td class="center"><%=pd.getAddress()%></td>
											<td class="center"><%=pd.getNickname()%></td>
											<td class="center"><%=pd.getType()%></td>
											<td class="center"><%=pd.getRelationship()%></td>
											<td class="center"><%=pd.getWebsite() != "null" ? pd.getWebsite() : "-"%></td>
											<td class="center"><%=pd.getCompanyname() != "null" ? pd.getCompanyname() : "-"%></td>
											<td class="center"><%=pd.getLandlineno() + "" != "0" ? pd.getLandlineno() : "-"%></td>
											<th><a
												href="<%=baseURL%>address_book.jsp?editId=<%=pd.getId()%>"
												id="<%=pd.getId()%>" class="btn btn-primary btn-xs">Edit</a></th>
											<th><a
												href="<%=baseURL%>create_update_personaldetail?deleteId=<%=pd.getId()%>&delData=true"
												id="<%=pd.getId()%>" class="btn btn-primary btn-xs">Delete</a></th>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>HashMap Display</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>
											<th>Nick Name</th>
											<th>Type</th>
											<th>Relationship</th>
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											HashMap<Integer, PersonalDetails> allPersonalDetailsHashMap = CoreService.readPersonalDetailsHashmapValue();

											for (Integer input : allPersonalDetailsHashMap.keySet()) {
										%>
										<tr class="gradeX">
											<td><%=allPersonalDetailsHashMap.get(input).getName()%></td>
											<td><%=allPersonalDetailsHashMap.get(input).getTelno()%></td>
											<td><%=allPersonalDetailsHashMap.get(input).getDob()%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getAddress()%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getNickname()%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getType()%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getRelationship()%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getWebsite() != "null"
						? allPersonalDetailsHashMap.get(input).getWebsite()
						: "-"%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getCompanyname() != "null"
						? allPersonalDetailsHashMap.get(input).getCompanyname()
						: "-"%></td>
											<td class="center"><%=allPersonalDetailsHashMap.get(input).getLandlineno() + "" != "0"
						? allPersonalDetailsHashMap.get(input).getLandlineno()
						: "-"%></td>
											<th><a
												href="<%=baseURL%>address_book.jsp?editId=<%=allPersonalDetailsHashMap.get(input).getId()%>"
												id="<%=allPersonalDetailsHashMap.get(input).getId()%>"
												class="btn btn-primary btn-xs">Edit</a></th>
											<th><a
												href="<%=baseURL%>create_update_personaldetail?deleteId=<%=allPersonalDetailsHashMap.get(input).getId()%>&delData=true"
												id="<%=allPersonalDetailsHashMap.get(input).getId()%>"
												class="btn btn-primary btn-xs">Delete</a></th>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>

			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>HashSet Display</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>
											<th>Nick Name</th>
											<th>Type</th>
											<th>Relationship</th>
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>
											<th>Edit</th>
											<th>Delete</th>
										</tr>
									</thead>
									<tbody>
										<%
											HashSet<PersonalDetails> allPersonalDetailsHashSet = CoreService.readPersonalDetailsHashSetValue();

											for (PersonalDetails pd1 : allPersonalDetailsList) {
										%>
										<tr class="gradeX">
											<td><%=pd1.getName()%></td>
											<td><%=pd1.getTelno()%></td>
											<td><%=pd1.getDob()%></td>
											<td class="center"><%=pd1.getAddress()%></td>
											<td class="center"><%=pd1.getNickname()%></td>
											<td class="center"><%=pd1.getType()%></td>
											<td class="center"><%=pd1.getRelationship()%></td>
											<td class="center"><%=pd1.getWebsite() != "null" ? pd1.getWebsite() : "-"%></td>
											<td class="center"><%=pd1.getCompanyname() != "null" ? pd1.getCompanyname() : "-"%></td>
											<td class="center"><%=pd1.getLandlineno() + "" != "0" ? pd1.getLandlineno() : "-"%></td>
											<th><a
												href="<%=baseURL%>address_book.jsp?editId=<%=pd1.getId()%>"
												id="<%=pd1.getId()%>" class="btn btn-primary btn-xs">Edit</a></th>
											<th><a
												href="<%=baseURL%>create_update_personaldetail?deleteId=<%=pd1.getId()%>&delData=true"
												id="<%=pd1.getId()%>" class="btn btn-primary btn-xs">Delete</a></th>
										</tr>

										<%
											}
										%>
									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Phone Book</h5>
						</div>
						<div class="ibox-content">
							<form class="form-horizontal" method="POST"
								action="<%=baseURL%>search_personal_details">
								<p>Search.</p>
								<div class="form-group">
									<label class="col-lg-2 control-label">Name</label>
									<div class="col-lg-4">
										<input type="text" placeholder="Name" name="name" value=""
											class="form-control">
									</div>
								</div>

								<div class="form-group">
									<label class="col-lg-2 control-label">Tel No</label>
									<div class="col-lg-4">
										<input type="text" class="form-control" name="telno" value=""
											data-mask="9999999999" placeholder=""> <span
											class="help-block">9999999999</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-lg-offset-2 col-lg-10">
										<button class="btn btn-sm btn-white" type="submit">Search</button>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>


			<%
			List<PersonalDetails> searchpdetails = new ArrayList();
			searchpdetails = (List<PersonalDetails>)request.getAttribute("allPersonalDetails");
			if(searchpdetails != null){			
			%>
			<div class="row">
				<div class="col-lg-12">
					<div class="ibox float-e-margins">
						<div class="ibox-title">
							<h5>Search</h5>

						</div>
						<div class="ibox-content">

							<div class="table-responsive">
								<table
									class="table table-striped table-bordered table-hover dataTables-example">
									<thead>
										<tr>
											<th>Name</th>
											<th>Tel No</th>
											<th>DOB</th>
											<th>Address</th>
											<th>Nick Name</th>
											<th>Type</th>
											<th>Relationship</th>
											<th>WebSite</th>
											<th>Company Name</th>
											<th>Landline No</th>

										</tr>
									</thead>
									<tbody>
										<% for(PersonalDetails pd :searchpdetails){ %>
										<tr class="gradeX">
											<td><%=pd.getName()%></td>
											<td><%=pd.getTelno()%></td>
											<td><%=pd.getDob()%></td>
											<td class="center"><%=pd.getAddress()%></td>
											<td class="center"><%=pd.getNickname()%></td>
											<td class="center"><%=pd.getType()%></td>
											<td class="center"><%=pd.getRelationship()%></td>
											<td class="center"><%=pd.getWebsite() != "null" ? pd.getWebsite() : "-"%></td>
											<td class="center"><%=pd.getCompanyname() != "null" ? pd.getCompanyname() : "-"%></td>
											<td class="center"><%=pd.getLandlineno() + "" != "0" ? pd.getLandlineno() : "-"%></td>

										</tr>
										<%} %>

									</tbody>
								</table>
							</div>



						</div>


					</div>
				</div>
			</div>
			<%} %>

		</div>
	</div>

	<!-- Mainly scripts -->
	<script src="<%=baseURL%>js/jquery-2.1.1.js"></script>
	<script src="<%=baseURL%>js/bootstrap.min.js"></script>

	<!-- Custom and plugin javascript -->
	<script src="<%=baseURL%>js/inspinia.js"></script>
	<script src="<%=baseURL%>js/plugins/pace/pace.min.js"></script>
	<script
		src="<%=baseURL%>js/plugins/slimscroll/jquery.slimscroll.min.js"></script>

	<!-- MENU -->
	<script src="<%=baseURL%>js/plugins/metisMenu/jquery.metisMenu.js"></script>


	<!-- Input Mask-->
	<script src="<%=baseURL%>js/plugins/jasny/jasny-bootstrap.min.js"></script>

	<script src="js/plugins/dataTables/datatables.min.js"></script>


	<script>
		$(document)
				.ready(
						function() {

							$(':radio')
									.change(
											function(event) {

												if ($("#set_visible").css(
														"display") === 'none') {

													$("#set_visible").css(
															"display", "block");
												} else {
													$("#set_visible").css(
															"display", "none");
												}

											});

							$('.dataTables-example')
									.DataTable(
											{
												pageLength : 25,
												responsive : true,
												dom : '<"html5buttons"B>lTfgitp',
												buttons : [
														{
															extend : 'copy'
														},
														{
															extend : 'csv'
														},
														{
															extend : 'excel',
															title : 'ExampleFile'
														},
														{
															extend : 'pdf',
															title : 'ExampleFile'
														},

														{
															extend : 'print',
															customize : function(
																	win) {
																$(
																		win.document.body)
																		.addClass(
																				'white-bg');
																$(
																		win.document.body)
																		.css(
																				'font-size',
																				'10px');

																$(
																		win.document.body)
																		.find(
																				'table')
																		.addClass(
																				'compact')
																		.css(
																				'font-size',
																				'inherit');
															}
														} ]

											});

						});
	</script>
</body>
</html>