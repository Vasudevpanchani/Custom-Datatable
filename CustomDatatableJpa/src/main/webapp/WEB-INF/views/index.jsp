<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="ISO-8859-1" />
        <title>Home Page</title>
        <link rel="shortcut icon" href="C:\Users\vasudevpanchani\Downloads\favicon.jpg" type="image/x-icon">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
        <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css" />
        <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/favicon.ico" type="image/x-icon">

        <style>
            .dataTables_wrapper {
                background-color: #f0f0f0;
                border-radius: 10px;
                padding: 10px;
            }

            #employeesTable thead th {
                font-size: 16px;
                color: black;
                text-align: center;
            }

            #employeesTable tbody td {
                font-size: 14px;
                color: black;
                text-align: center;
            }

            #employeesTable tfoot th {
                font-size: 14px;
                color: black;
                text-align: center;
            }

            #employeesTable {
                border: 2px solid #ccc;
                border-radius: 5px;
            }

            #employeesTable tbody tr:hover {
                background-color: #e0e0e0;
                cursor: pointer;
            }

            .dataTables_wrapper .dataTables_filter input[type="search"] {
                width: 300px;
                padding: 8px;
                margin-bottom: 10px;
                margin-right: 7px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .dataTables_length label {
                font-weight: bold;
                margin-left: 8px;
            }

            .dataTables_length select {
                width: 70px;
                padding: 8px;
                margin-bottom: 10px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .dataTables_paginate {
                margin-top: 10px;
                margin-right: 2px;
            }

            .dataTables_paginate .paginate_button {
                padding: 6px 12px;
                margin-right: 5px;
                border: 1px solid #ccc;
                border-radius: 4px;
                background-color: #fff;
                color: #333;
                cursor: pointer;
            }

            #addbtn {
                margin-left: 19px;
                border-style: none;
            } 

            .dataTables_wrapper .dataTables_info {
                margin-left: 6px;
            }

        </style>
    </head>

    <body>
        <div class="container-fluid">
                <h1>Employees Table</h1>
                <div class="dataTables_wrapper">
                <button type="button" id="addbtn" class="btn btn-success" data-toggle="modal" data-target="#addEmployeeModal">
                    Add Employee
                </button>
                <table id="employeesTable" class="table table-striped table-hover" style="
                box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
                color: black;">
                    <!-- Header Table -->
                    <thead style="background-color: #849188">
                        <tr>
                            <th>Id</th>
                            <th>Name</th>
                            <th>Last Name</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Salary</th>
                            <th>Active</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <!-- Footer Table -->
                    <tfoot>
                        <tr>
                            <th colspan="5"></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>

        <!-- View Employee Modal -->
        <div class="modal fade" id="viewEmployeeModal" tabindex="-1" aria-labelledby="viewEmployeeModalLabel"
            aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="viewEmployeeModalLabel">
                            Employee Details
                        </h5>
                    </div>
                    <div class="modal-body">
                        <div class="mb-3">
                            <label class="form-label">Name:</label>
                            <span id="viewEmployeeName"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Last Name:</label>
                            <span id="viewEmployeeLastname"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Email:</label>
                            <span id="viewEmployeeEmail"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Phone:</label>
                            <span id="viewEmployeePhone"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Salary:</label>
                            <span id="viewEmployeeSalary"></span>
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Active:</label>
                            <span id="viewEmployeeActive"></span>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="closeViewModal" class="btn btn-default" data-bs-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Edit Employee Modal -->
        <div class="modal fade" id="editEmployeeModal" tabindex="-1" role="dialog"
            aria-labelledby="editEmployeeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="editEmployeeModalLabel">
                            Edit Employee
                        </h4>
                    </div>
                    <div class="modal-body">
                        <form id="editEmployeeForm">
                            <input type="hidden" id="editEmployeeId" name="editEmployeeId" />
                            <div class="form-group">
                                <label for="editEmployeeName">Name</label>
                                <input type="text" class="form-control" id="editEmployeeName" name="editEmployeeName"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="editEmployeeLastname">Last Name</label>
                                <input type="text" class="form-control" id="editEmployeeLastname"
                                    name="editEmployeeLastname" required />
                            </div>
                            <div class="form-group">
                                <label for="editEmployeeEmail">Email</label>
                                <input type="email" class="form-control" id="editEmployeeEmail" name="editEmployeeEmail"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="editEmployeePhone">Phone</label>
                                <input type="number" class="form-control" id="editEmployeePhone"
                                    name="editEmployeePhone" required />
                            </div>
                            <div class="form-group">
                                <label for="editEmployeeSalary">Salary</label>
                                <input type="number" class="form-control" id="editEmployeeSalary"
                                    name="editEmployeeSalary" required />
                            </div>
                            <div class="form-group">
                                <label for="editEmployeeActive">Active</label>
                                <input type="text" class="form-control" id="editEmployeeActive"
                                    name="editEmployeeActive" required />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type=" button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-primary" id="saveEditEmployee">
                            Save changes
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Employee Modal -->
        <div class="modal fade" id="addEmployeeModal" tabindex="-1" role="dialog"
            aria-labelledby="addEmployeeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h4 class="modal-title" id="addEmployeeModalLabel">Add Employee</h4>
                    </div>
                    <div class="modal-body">
                        <form id="addEmployeeForm">
                            <div class="form-group">
                                <label for="addEmployeeName">Name</label>
                                <input type="text" class="form-control" id="addEmployeeName" name="addEmployeeName"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="addEmployeeLastname">Last Name</label>
                                <input type="text" class="form-control" id="addEmployeeLastname"
                                    name="addEmployeeLastname" required />
                            </div>
                            <div class="form-group">
                                <label for="addEmployeeEmail">Email</label>
                                <input type="email" class="form-control" id="addEmployeeEmail" name="addEmployeeEmail"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="addEmployeePhone">Phone</label>
                                <input type="number" class="form-control" id="addEmployeePhone" name="addEmployeePhone"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="addEmployeeSalary">Salary</label>
                                <input type="text" class="form-control" id="addEmployeeSalary" name="addEmployeeSalary"
                                    required />
                            </div>
                            <div class="form-group">
                                <label for="addEmployeeActive">Active</label>
                                <input type="text" class="form-control" id="addEmployeeActive" name="addEmployeeActive"
                                    required />
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">
                            Close
                        </button>
                        <button type="button" class="btn btn-primary" id="saveAddEmployee">
                            Add Employee
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Delete Employee Confirmation Modal -->
        <!-- <div class="modal fade" id="deleteEmployeeModal" tabindex="-1" role="dialog"
            aria-labelledby="deleteEmployeeModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="deleteEmployeeModalLabel">Confirm Delete</h4>
                    </div>
                    <div class="modal-body">
                        <p>Are you sure you want to delete this Employee?</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                        <button type="button" class="btn btn-danger" id="confirmDeleteEmployee">Delete</button>
                    </div>
                </div>
            </div>
        </div> -->

        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>

        <script>
            const Toast = Swal.mixin({
                toast: true,
                position: "top-end",
                showConfirmButton: false,
                timer: 3000,
                timerProgressBar: true,
                didOpen: (toast) => {
                    toast.onmouseenter = Swal.stopTimer;
                    toast.onmouseleave = Swal.resumeTimer;
                },
            });

            function areAllFieldNotNull(obj) {
                for (let key in obj) {
                    if (obj[key] === null || obj[key] == "") {
                        return false;
                    }
                }
                return true;
            }

            function editEmployee(id) {
                $.ajax({
                    type: "GET",
                    url: "/employee/" + id,
                    success: function (employee) {
                        $("#editEmployeeId").val(employee.id);
                        $("#editEmployeeName").val(employee.name);
                        $("#editEmployeeLastname").val(employee.lastName);
                        $("#editEmployeeEmail").val(employee.email);
                        $("#editEmployeePhone").val(employee.phone);
                        $("#editEmployeeSalary").val(employee.salary);
                        $("#editEmployeeActive").val(employee.active);
                    },
                    error: function (xhr, status, error) {
                        console.error(error);
                    },
                });
                $("#editEmployeeModal .modal-content");
                $("#editEmployeeModal").modal("show");
            }

            $(document).ready(function () {
                var drawDatatable = {
                    init: function () {
                        datatable = $("#employeesTable").DataTable({
                            sAjaxDataProp: "",
                            order: true,
                            responsive: !0,
                            pageLength: 10,
                            searchDelay: 500,
                            lengthMenu: [
                                [10, 25, 50, 100, -1],
                                [10, 25, 50, 100, "All"],
                            ],
                            processing: !0,
                            ajax: {
                                url: "<%=request.getContextPath()%>/employees",
                                type: "GET",
                                data: function (d) {
                                    // Add parameters for pagination
                                },
                            },
                            columns: [
                                { data: "id" },
                                { data: "name" },
                                { data: "lastName" },
                                { data: "email" },
                                { data: "phone" },
                                { data: "salary" },
                                { data: "active" },
                                {
                                    data: null,
                                    render: function (data, type, row) {
                                        return (
                                            '<div class="dropdown">' +
                                            '<button class="btn btn-light dropdown-toggle" type="button" id="actionDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">' +
                                            '<i class="fas fa-ellipsis-v"></i>' +
                                            "</button>" +
                                            '<div class="dropdown-menu dropdown-menu-right" aria-labelledby="actionDropdown">' +
                                            '<button type="button" class="btn btn-primary btn-edit" style="border-radius: 50%; margin:0px 18px;margin-right:3px; border-style: none; " onclick="editEmployee(' +
                                            data.id +
                                            ')"><i class="fas fa-pencil-alt"></i></button>' +
                                            '<button type="button" class="btn btn-danger btn-delete" style="border-radius: 50%; margin-right:3px; border-style: none;"  data-id="' +
                                            data.id +
                                            '"><i class="fas fa-trash-alt"></i></button>' +
                                            '<button type="button" class="btn btn-info btn-view" style="border-radius: 50%; margin-right:3px; border-style: none;" data-id="' +
                                            data.id +
                                            '"><i class="fas fa-eye"></i></button>' +
                                            "</div>" +
                                            "</div>"
                                        );
                                    },
                                },
                            ],
                            columnDefs: [
                                {
                                    targets: [0, 1, 2, 3, 4, 5, 6],
                                    orderable: 1,
                                },
                            ],
                            footerCallback: function (row, data, start, end, display) {
                                var api = this.api();

                                // Calculate the total price
                                var totalSalary = api
                                    .column(5, { page: "current" })
                                    .data()
                                    .reduce(function (acc, val) {
                                        return acc + parseFloat(val);
                                    }, 0);

                                // Update the footer
                                $(api.column(5).footer()).html("Total : " + totalSalary.toFixed(0));
                            },
                        });

                        // Handle delete button click
                        $("#employeesTable").on("click", ".btn-delete", function () {
                            var employeeId = $(this).attr("data-id");
                            const swalWithBootstrapButtons = Swal.mixin({
                                customClass: {
                                    confirmButton: "btn btn-success",
                                    cancelButton: "btn btn-danger",
                                },
                                buttonsStyling: false,
                            });
                            swalWithBootstrapButtons
                                .fire({
                                    title: "Are you sure?",
                                    text: "You won't be able to revert this!",
                                    icon: "warning",
                                    showCancelButton: true,
                                    confirmButtonText: "Delete",
                                    cancelButtonText: "Cancel",
                                    reverseButtons: true,
                                })
                                .then((result) => {
                                    if (result.isConfirmed) {
                                        $.ajax({
                                            type: "DELETE",
                                            url: "/deleteEmployee/" + employeeId,
                                            success: function (response) {
                                                swalWithBootstrapButtons
                                                    .fire(
                                                        "Deleted!",
                                                        "Your employee has been deleted.",
                                                        "success"
                                                    )
                                                    .then(() => {
                                                        table.ajax.reload();
                                                    });
                                            },
                                            error: function (error) {
                                                console.error("error", error);
                                                swalWithBootstrapButtons
                                                    .fire("Not deleted", "Something went wrong.", "error")
                                                    .then(() => {
                                                        table.ajax.reload();
                                                    });
                                            },
                                        });
                                    } else if (result.dismiss === Swal.DismissReason.cancel) {
                                        swalWithBootstrapButtons.fire(
                                            "Cancelled",
                                            "Your employee is safe :)",
                                            "error"
                                        );
                                    }
                                });
                            // $('#deleteEmployeeModal').modal('show');
                        });

                        //Handle View close button click
                        $("#closeViewModal").click(function () {
                            $("#viewEmployeeModal").modal("hide");
                        });

                        // Handle view button click
                        $("#employeesTable").on("click", ".btn-view", function () {
                            var employeeId = $(this).data("id");

                            // Fetch Employee details by ID
                            $.ajax({
                                type: "GET",
                                url: "/employee/" + employeeId,
                                success: function (employee) {
                                    // Populate the modal with Employee details
                                    $("#viewEmployeeName").text(employee.name);
                                    $("#viewEmployeeLastname").text(employee.lastName);
                                    $("#viewEmployeeEmail").text(employee.email);
                                    $("#viewEmployeePhone").text(employee.phone);
                                    $("#viewEmployeeSalary").text(employee.salary);
                                    $("#viewEmployeeActive").text(employee.active);

                                    // Show the modal
                                    $("#viewEmployeeModal").modal("show");
                                },
                                error: function (xhr, status, error) {
                                    console.error(error);
                                },
                            });
                        });

                        // Handle add Employee form submission
                        $("#saveAddEmployee").click(function () {
                            var employeeName = $("#addEmployeeName").val();
                            var employeeLastname = $("#addEmployeeLastname").val();
                            var employeeEmail = $("#addEmployeeEmail").val();
                            var employeePhone = $("#addEmployeePhone").val();
                            var employeeSalary = $("#addEmployeeSalary").val();
                            var employeeActive = $("#addEmployeeActive").val();
                            var employeeData = {
                                name: employeeName,
                                lastName: employeeLastname,
                                email: employeeEmail,
                                phone: employeePhone,
                                salary: employeeSalary,
                                active: employeeActive,
                            };
                            if (areAllFieldNotNull(employeeData)) {
                                $.ajax({
                                    type: "POST",
                                    url: "/employee/add",
                                    contentType: "application/json",
                                    data: JSON.stringify(employeeData),
                                    success: function (response) {
                                        $("#addEmployeeModal").modal("hide");
                                        $("#addEmployeeName").val("");
                                        $("#addEmployeeLastname").val("");
                                        $("#addEmployeeEmail").val("");
                                        $("#addEmployeePhone").val("");
                                        $("#addEmployeeSalary").val("");
                                        $("#addEmployeeActive").val("");
                                        const Toast = Swal.mixin({
                                            toast: true,
                                            position: "top-end",
                                            showConfirmButton: false,
                                            timer: 3000,
                                            timerProgressBar: true,
                                            didOpen: (toast) => {
                                                toast.onmouseenter = Swal.stopTimer;
                                                toast.onmouseleave = Swal.resumeTimer;
                                            },
                                        });
                                        Toast.fire({
                                            icon: "success",
                                            title: "Employee added successfully",
                                        });
                                        datatable.ajax.reload();
                                    },
                                    error: function (xhr, status, error) {
                                        console.error(error);
                                    },
                                });
                            } else {
                                Toast.fire({
                                    icon: "error",
                                    title: "Fields must not be empty!",
                                });
                            }
                        });

                        // Handle edit Employee form submission
                        $("#saveEditEmployee").click(function () {
                            var employeeId = $("#editEmployeeId").val();
                            var employeeName = $("#editEmployeeName").val();
                            var employeeLastname = $("#editEmployeeLastname").val();
                            var employeeEmail = $("#editEmployeeEmail").val();
                            var employeePhone = $("#editEmployeePhone").val();
                            var employeeSalary = $("#editEmployeeSalary").val();
                            var employeeActive = $("#editEmployeeActive").val();
                            var employeeData = {
                                id: employeeId,
                                name: employeeName,
                                lastName: employeeLastname,
                                email: employeeEmail,
                                phone: employeePhone,
                                salary: employeeSalary,
                                active: employeeActive,
                            };
                            $.ajax({
                                type: "PUT",
                                url: "/editEmployee",
                                contentType: "application/json",
                                data: JSON.stringify(employeeData),
                                success: function (response) {
                                    $("#editEmployeeModal").modal("hide");
                                    const Toast = Swal.mixin({
                                        toast: true,
                                        position: "top-end",
                                        showConfirmButton: false,
                                        timer: 3000,
                                        timerProgressBar: true,
                                        didOpen: (toast) => {
                                            toast.onmouseenter = Swal.stopTimer;
                                            toast.onmouseleave = Swal.resumeTimer;
                                        },
                                    });
                                    Toast.fire({
                                        icon: "success",
                                        title: "Employee edited successfully",
                                    });
                                    datatable.ajax.reload();
                                },
                                error: function (xhr, status, error) {
                                    console.error(error);
                                },
                            });
                        });

                        // Handle delete Employee confirmation
                        // $('#confirmDeleteEmployee').click(function () {
                        //     var employeeId = deleteId;

                        //     $.ajax({
                        //         type: 'DELETE',
                        //         url: '/deleteEmployee/' + employeeId,
                        //         success: function (response) {
                        //             $('#deleteEmployeeModal').modal('hide');
                        //             datatable.ajax.reload();
                        //         },
                        //         error: function (xhr, status, error) {
                        //             console.error(error);
                        //         }
                        //     });
                        // });
                    },
                };

                drawDatatable.init();
            });
        </script>
    </body>

    </html>