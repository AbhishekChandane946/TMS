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
                          <table id="taskList" class="table table-bordered table-striped">
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

    {{-- EDIT TASK MODAL --}} 
        <div class="modal fade bd-example-modal-xl"  id="editTaskModal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-xl">
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
               
                                    {{-- <select id="assignTo" class="form-control select2" name="assign_to" style="width: 100%;">
                                        <!-- Options will be loaded dynamically -->
                                    </select> --}}
                                    <select id="assignTo" class="form-control select2" name="assign_to" style="width: 100%;">
                                        <option value="">Select User</option>
                                        @foreach($users as $user)
                                            <option value="{{ $user->id }}">{{ $user->name }} ({{ $user->user_type }})</option>
                                        @endforeach
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
    {{-- EDIT TASK MODAL --}}

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

    {{-- VIEW TASK MODAL --}}     
    <div class="modal fade" id="viewTaskModal" tabindex="-1" aria-labelledby="viewTaskModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
            <h5 class="modal-title" id="viewTaskModalLabel">Task Details</h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
            <!-- Tabs -->
            <ul class="nav nav-tabs" id="taskTabs" role="tablist">
                <li class="nav-item">
                <a class="nav-link active" id="comments-tab" data-bs-toggle="tab" href="#comments" role="tab" aria-controls="comments" aria-selected="true">Comments</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" id="files-tab" data-bs-toggle="tab" href="#files" role="tab" aria-controls="files" aria-selected="false">Files</a>
                </li>
                <li class="nav-item">
                <a class="nav-link" id="activities-tab" data-bs-toggle="tab" href="#activities" role="tab" aria-controls="activities" aria-selected="false">Activities</a>
                </li>
            </ul>
    
            <!-- Tab Content -->
            <div class="tab-content mt-3" id="taskTabsContent">
                <!-- Comments Tab -->
                <div class="tab-pane fade show active" id="comments" role="tabpanel" aria-labelledby="comments-tab">
                <div class="comments-section">
                    <h6>Leave a Comment</h6>
                    <form id="commentForm">
                     <input type="text" id="task_id" name="task_id" >   
                    <textarea class="form-control" id="commentInput" name="taskComments" rows="3" placeholder="Type something here..."></textarea>
                    <button type="submit" class="btn btn-primary mt-2">Add Comment</button>
                    </form>
                    <hr>
                    <div id="commentsList">
                    <!-- Comments will be loaded dynamically here -->
                    <p>No comments yet...</p>
                    </div>
                </div>
                </div>
    
                <!-- Files Tab -->
                <div class="tab-pane fade" id="files" role="tabpanel" aria-labelledby="files-tab">
                <p>Files functionality goes here...</p>
                </div>
    
                <!-- Activities Tab -->
                <div class="tab-pane fade" id="activities" role="tabpanel" aria-labelledby="activities-tab">
                <p>Activities functionality goes here...</p>
                </div>
            </div>
            </div>
        </div>
        </div>
    </div> 
    {{-- VIEW TASK MODAL --}}
  </div>
@endsection

    <!-- jQuery --> 

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>


    <!-- Select2 CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

    <!-- Select2 JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

    {{-- <script src="{{ asset('dist/js/select2_and_edit_task.js') }}"></script> --}}

    <script>
        $(document).ready(function () {
    
            // Handle view task button click
            $(document).on('click', '.view-task', function () {
                const taskId = $(this).data('id');
                console.log('Task ID:', taskId);
                $('#commentForm').find('input[name="task_id"]').val(taskId);
                $('#commentsTab').tab('show');
                fetchComments(taskId);
            });
    
            // Fetch comments for the task
            function fetchComments(taskId) {
                $.ajax({
                    url: '{{ route("tasks.getComments", ["task" => "taskId"]) }}'.replace('taskId', taskId), // Adjust route as needed
                    method: 'GET',
                    success: function (response) {
                        if (response.status === 'success') {
                            $('#commentsList').empty();
    
                            response.data.forEach(comment => {
                                const commentItem = `
                                    <div class="comment-item d-flex justify-content-between align-items-start" id="comment-${comment.id}">
                                        <div>
                                            <strong>${comment.user_name}</strong>
                                            <p>${comment.comment}</p>
                                            <small class="text-muted">${comment.created_at}</small>
                                        </div>
                                        <div class="dropdown">
                                            <button class="btn btn-link dropdown-toggle" type="button" id="dropdownMenuButton-${comment.id}" data-bs-toggle="dropdown" aria-expanded="false">
                                                <i class="bi bi-three-dots-vertical"></i>
                                            </button>
                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="dropdownMenuButton-${comment.id}">
                                                <li><a class="dropdown-item edit-comment" href="#" data-comment-id="${comment.id}" data-comment-text="${comment.comment}">Edit Comment</a></li>
                                                <li><a class="dropdown-item delete-comment" href="#" data-comment-id="${comment.id}">Delete Comment</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <hr>
                                `;
                                $('#commentsList').append(commentItem);
                            });
                        } else {
                            console.error('Failed to load comments:', response.message);
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error fetching comments:', error);
                    }
                });
            }
    
            // Handle Add Comment button click
            $('#commentForm').on('submit', function (e) {
                e.preventDefault();
    
                const comment = $('#commentInput').val().trim();
                const taskId = $('#commentForm').find('input[name="task_id"]').val();
    
                if (!comment) {
                    Swal.fire({
                        icon: 'warning',
                        title: 'Blank Comment Not Allowed!',
                        showConfirmButton: true
                    });
                    return;
                }
    
                $.ajax({
                    url: '{{ route("tasks.comments") }}', // Adjust route as needed
                    method: 'POST',
                    headers: {
                        'X-CSRF-TOKEN': '{{ csrf_token() }}',
                    },
                    data: {
                        task_id: taskId,
                        comment: comment
                    },
                    success: function (response) {
                        if (response.status === 'success') {
                            Swal.fire({
                                icon: 'success',
                                title: response.message,
                                showConfirmButton: false,
                                timer: 2000
                            });
    
                            fetchComments(taskId); // Refresh comments
                            $('#commentInput').val('');
                        }
                    },
                    error: function (xhr, status, error) {
                        console.error('Error submitting comment:', error);
                        Swal.fire({
                            icon: 'error',
                            title: 'Error!',
                            text: 'Failed to submit the comment. Please try again.',
                            showConfirmButton: true
                        });
                    }
                });
            });
    
            // Handle Edit Comment
            $(document).on('click', '.edit-comment', function (e) {
                e.preventDefault();
                const commentId = $(this).data('comment-id');
                const commentText = $(this).data('comment-text');
                $('#commentInput').val(commentText);
                $('#commentForm').find('input[name="comment_id"]').val(commentId);
            });
    
            // Handle Delete Comment
            $(document).on('click', '.delete-comment', function (e) {
                e.preventDefault();
    
                const commentId = $(this).data('comment-id');
                const taskId = $('#commentForm').find('input[name="task_id"]').val();
    
                Swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $.ajax({
                            url: `/comments/${commentId}`, // Adjust route as needed
                            method: 'DELETE',
                            headers: {
                                'X-CSRF-TOKEN': '{{ csrf_token() }}',
                            },
                            success: function (response) {
                                if (response.status === 'success') {
                                    Swal.fire({
                                        icon: 'success',
                                        title: 'Deleted!',
                                        text: response.message,
                                        showConfirmButton: false,
                                        timer: 2000
                                    });
    
                                    // Refresh the comments list
                                    fetchComments(taskId);
                                } else if (response.status === 'error' && response.message === 'Unauthorized') {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Unauthorized!',
                                        text: 'You are not authorized to delete this comment.',
                                        showConfirmButton: true
                                    });
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error('Error deleting comment:', error);
    
                                if (xhr.status === 403) {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Unauthorized!',
                                        text: 'You are not authorized to delete this comment.',
                                        showConfirmButton: true
                                    });
                                } else {
                                    Swal.fire({
                                        icon: 'error',
                                        title: 'Error!',
                                        text: 'Failed to delete the comment. Please try again.',
                                        showConfirmButton: true
                                    });
                                }
                            }
                        });
                    }
                });
            });
    
        });
    </script>
    







    <script type="text/javascript">  
        $(document).ready(function() { 
            taskList();  


 
            $(document).on('click', '.edit-task', function () {
            var taskId = $(this).data('id');
 
            $.ajax({
                url: '/tasks/' + taskId,
                method: 'GET',
                success: function (response) {
                    
                    $('#taskId').val(response.data.id);
                    $('input[name="title"]').val(response.data.title);
                    $('textarea[name="task_description"]').val(response.data.task_description);
                    $('input[name="start_date"]').val(response.data.start_date);
                    $('input[name="end_date"]').val(response.data.end_date);
                    $('input[name="flag"]').val(response.data.flag);
                    $('select[name="priority"]').val(response.data.priority); 

                    var assignTo = response.data.assign_to;  
                    $('#assignTo').val(assignTo).trigger('change');  

 
                },
                error: function (xhr, status, error) {
                    console.error('Error fetching task data:', error);
                }
            });
         });











              // update task cha code || 2. form submit zalyanantar chi process
              $('#update-task-button').click(function () {
                    var $updateTaskButton = $(this); // Button target for loader processing
                    var $form = $('#updateTaskForm'); // Form ID target
                    var formData = $form.serialize(); // Serialize form data

                    // Add loader and disable the button
                    $updateTaskButton.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Updating...')
                                    .prop('disabled', true);

                    $.ajax({
                        url: '/tasks/update',  
                        method: 'POST',
                        data: formData,
                        success: function (response) {
                            if (response.status === 'success') {
                                $('#editTaskModal').modal('hide');  

                                
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Task updated successfully!',
                                    showConfirmButton: false,
                                    timer: 2000
                                });
                                taskList();  
                            } else if (response.status === 'error' && response.message === 'You are not authorized to update this task') {
                                 
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Unauthorized!',
                                    text: 'You are not authorized to update this task.',
                                    showConfirmButton: true
                                });
                            } else {
                               
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Failed to update task',
                                    showConfirmButton: true
                                });
                            }

                             
                            $updateTaskButton.html('Update Task').prop('disabled', false);
                        },
                        error: function (xhr, status, error) {
                            console.log('Error updating task: ', error);

                           
                            Swal.fire({
                                icon: 'error',
                                title: 'Error!',
                                text: 'Something went wrong. Please try again.',
                                showConfirmButton: true
                            });

                             
                            $updateTaskButton.html('Update Task').prop('disabled', false);
                        }
                    });
              });

 
    
              $(document).on('click', '.delete-task', function () {
                  const taskId = $(this).data('id');
   
                  Swal.fire({
                      title: 'Are you sure?',
                      text: 'You are about to delete this task!',
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonText: 'Yes, delete it!',
                      cancelButtonText: 'Cancel',
                      reverseButtons: true
                  }).then((result) => {
                      if (result.isConfirmed) {
                          $.ajax({
                              url: `/tasks/${taskId}/delete`,
                              method: 'POST',
                              headers: {
                                  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                              },
                              success: function (response) {
                                  if (response.status === 'success') {
                                      Swal.fire(
                                          'Deleted!',
                                          'Task status updated to deleted.',
                                          'success'
                                      );
                                      taskList();  
                                  } else if (response.status === 'error' && response.message === 'You are not authorized to delete this task') {
                                      Swal.fire(
                                          'Unauthorized!',
                                          'You are not authorized to delete this task.',
                                          'error'
                                      );
                                  } else if (response.status === 'error' && response.message === 'Task is already deleted') {
                                      Swal.fire(
                                          'Already Deleted!',
                                          'This task has already been deleted.',
                                          'warning'
                                      );
                                  } else {
                                      Swal.fire(
                                          'Failed!',
                                          'Failed to update task status.',
                                          'error'
                                      );
                                  }
                              },
                              error: function (error) {
                                  console.error('Error updating task status:', error);
                                  Swal.fire(
                                      'Error!',
                                      'Something went wrong. Please try again.',
                                      'error'
                                  );
                              }
                          });
                      }
                  });
              });
  
  
              $(document).on('click', '.restore-task', function () {
                  const taskId = $(this).data('id');
  
                  Swal.fire({
                      title: 'Are you sure?',
                      text: 'You are about to restore this task!',
                      icon: 'warning',
                      showCancelButton: true,
                      confirmButtonText: 'Yes, restore it!',
                      cancelButtonText: 'Cancel',
                      reverseButtons: true
                  }).then((result) => {
                      if (result.isConfirmed) {
                          $.ajax({
                              url: `/tasks/${taskId}/restore`,
                              method: 'POST',
                              headers: {
                                  'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                              },
                              success: function (response) {
                                  if (response.status === 'success') {
                                      Swal.fire(
                                          'Restored!',
                                          'Task has been restored successfully.',
                                          'success'
                                      );
                                      taskList(); // Refresh the task list
                                  } else if (response.status === 'error' && response.message === 'You are not authorized to restore this task') {
                                      Swal.fire(
                                          'Unauthorized!',
                                          'You are not authorized to restore this task.',
                                          'error'
                                      );
                                  } else {
                                      Swal.fire(
                                          'Failed!',
                                          'Failed to restore task.',
                                          'error'
                                      );
                                  }
                              },
                              error: function (error) {
                                  console.error('Error restoring task:', error);
                                  Swal.fire(
                                      'Error!',
                                      'Something went wrong. Please try again.',
                                      'error'
                                  );
                              }
                          });
                      }
                  });
              });
  
   
  });
  
        async function taskList(searchTerm = '') {
            try {  
                const columns = @php echo json_encode($columns); @endphp;
                const tableID = 'taskList'; 
  
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
  












 
