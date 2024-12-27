@extends('frontend.layouts.main')

@section('main-container')
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css">
  <div class="page-wrapper">
    <!-- Page header -->
    <div class="page-header d-print-none">
      <div class="container-xl">
        <div class="row g-2 align-items-center">
          <div class="col">
            <div class="page-pretitle">
              Overview
            </div>
            <h2 class="page-title">
              Activity
            </h2>
          </div>
          <div class="col-auto ms-auto d-print-none">
            <div class="btn-list">
              <span class="d-none d-sm-inline">
                <a href="#" class="btn">
                  New view
                </a>
              </span>
              <a href="#" class="btn btn-primary d-none d-sm-inline-block" data-bs-toggle="modal" data-bs-target="#modal-report">
                Create new report
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Page body -->
    <div class="page-body">
      <div class="container-xl">
        <div class="row row-deck row-cards">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Tasks</h3>
              </div>
              <div class="card-body border-bottom py-3">
                <div class="page-body">
                  <div class="container-xl">
                    <div class="card">
                      <div class="card-body">
                        <div id="progressBaar" class="progress" style="display:none;">
                          <div class="progress-bar progress-bar-indeterminate bg-blue"></div>
                        </div>
                        <div id="table-default" class="table-responsive">
                          <!-- Table to Display Tasks -->
                          <table id="taskList2" class="table table-bordered table-striped">
                            <!-- Table content will be populated here -->
                          </table>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

    {{--  --}}
    <div class="modal fade" id="editTaskModal2" tabindex="-1" aria-labelledby="editTaskModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-lg">
          <div class="modal-content">
              <div class="modal-header">
                  <h5 class="modal-title" id="taskModalLabel">Update Task</h5>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="updateTaskForm">
                  <input type="text" id="taskId" name="id">
                  <div class="row">
                      <!-- 1st Column: Task Title, Task Description, Assign to -->
                      <div class="col-4" >
                          <div class="mb-3">
                              <label class="form-label">Task Title</label>
                              <input class="form-control" name="title" placeholder="Enter Task Title" data-validetta="required">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Task Description</label>
                              <textarea class="form-control" name="task_description" rows="4" placeholder="Content..." data-validetta="required"></textarea>
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Assign to</label>
                              <select class="form-select" id="assign_to" name="assign_to[]" data-validetta="required">
                                  
                              </select>
                          </div>
                      </div>

                      <!-- 2nd Column: Start Date, End Date, Flag -->
                      <div class="col-4">
                          <div class="mb-3">
                              <label class="form-label">Start Date</label>
                              <input class="form-control" type="date" name="start_date" placeholder="Select a date" data-validetta="required,date">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">End Date</label>
                              <input class="form-control" type="date" name="end_date" placeholder="Select a date" data-validetta="required,date">
                          </div>
                          <div class="mb-3">
                              <label class="form-label">Flag</label>
                              <input class="form-control" type="text" name="flag" placeholder="Enter Flag" data-validetta="required">
                          </div>
                      </div>

                      <!-- 3rd Column: Priority -->
                      <div class="col-4" >
                          <div class="mb-3">
                              <label class="form-label">Priority</label>
                              <select class="form-select" name="priority" data-validetta="required">
                                  <option value="low">Low</option>
                                  <option value="medium">Medium</option>
                                  <option value="high">High</option>
                                  <option value="critical">Critical</option>
                              </select>
                          </div>
                      </div>
                  </div>

              </div>
              <div class="modal-footer text-end">
                <button type="submit" id="update-task-button" class="btn btn-primary">
                  Update Task
              </button>
              </div>

            </form>
          </div>
      </div>
    </div>
    {{--  --}}

    {{-- DELETE TASK MODAL --}}
    {{-- <div class="modal fade" id="deleteTaskModal" tabindex="-1" aria-labelledby="deleteTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteTaskModalLabel">Confirm Delete</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Are you sure you want to delete this task?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" id="confirmDeleteTask" class="btn btn-danger">Delete</button>
                </div>
            </div>
        </div>
    </div>  --}}
    {{-- DELETE TASK MODAL --}}
  </div>
@endsection

    <!-- jQuery --> 

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

    <!-- Select2 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>


 
    

<script type="text/javascript">
 
      $(document).ready(function() { 
          taskList();

 
          $(document).on('click', '.edit-task2', function () {
    const taskId = $(this).data('id');

    // Fetch task details using AJAX
    $.ajax({
        url: "{{ route('getTaskDetails') }}", // Define this route in your Laravel backend
        type: "GET",
        data: { id: taskId },
        success: function (response) {
            if (response.status === 'success') {
                const task = response.data;

                // Populate modal fields
                $('#taskId').val(task.id);
                $('input[name="title"]').val(task.title);
                $('textarea[name="task_description"]').val(task.task_description);
                $('#assign_to').val(task.assign_to).trigger('change'); // Trigger Select2 update
                $('input[name="start_date"]').val(task.start_date);
                $('input[name="end_date"]').val(task.end_date);
                $('input[name="flag"]').val(task.flag);
                $('select[name="priority"]').val(task.priority);

                // Open modal
                $('#editTaskModal2').modal('show');
            } else {
                alert('Failed to fetch task details.');
            }
        },
        error: function () {
            alert('Error fetching task details.');
        }
    });
});

 
});

      async function taskList(searchTerm = '') {
          try {  
              const columns = @php echo json_encode($columns); @endphp;
              const tableID = 'taskList2'; 

              const params = {
                  // Add any dynamic parameters here if needed in the future
              };

              // Send CSRF token with the AJAX request
              $.ajaxSetup({
                  headers: {
                      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                  }
              });

              ajaxGrid(tableID, "{{ route('getTasksList') }}", params, columns);
          } catch (error) {
              console.error('Error fetching tasks:', error);
          }
      }

      // Common AJAX Grid Function
      function ajaxGrid(tableID, url, params, columnsData) {
          $('#progressBaar').show();

          if ($.fn.DataTable.isDataTable('#' + tableID)) {
              $('#' + tableID).DataTable().destroy();
          }

          var result = $('#' + tableID).DataTable({
              serverSide: true,
              ajax: {
                  url: url,
                  type: 'POST',
                  data: params,
                  beforeSend: function () {
                      $('#progressBaar').show();
                  },
                  complete: function () {
                      $('#progressBaar').hide();
                  },
                  error: function (error) {
                      console.error('Error fetching data:', error);
                  },
              },
              columns: columnsData,
              order: [[0, 'desc']],
              pageLength: 10,  
              lengthMenu: [10, 25, 50, 100], 
              pagingType: "full_numbers",  
              searching: false,
              ordering: false,
              responsive: true, // Enable responsive plugin
          });

          return result;
      }

</script>












 
