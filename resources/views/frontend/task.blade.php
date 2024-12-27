@extends('frontend.layouts.main')

@section('main-container')
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
                <h3 class="card-title">Create Tasks</h3>
              </div>
              <div class="card-body border-bottom py-3">

            <!-- Your form remains the same -->
            <form id="task-form" action="{{ route('task.store') }}" method="POST">
              @csrf
              <div class="row">
                  <!-- 1st Column: Task Title, Task Description, Assign to -->
                  <div class="col-4" style="border-right:1px solid rgb(175, 175, 175);">
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
                  <div class="col-4 " >
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
                  <div class="col-4" style="border-left:1px solid rgb(175, 175, 175);">
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

              <div class="card-footer text-end">
                  <button id="create-task-button" type="submit" class="btn btn-primary">Create Task</button>
              </div>
            </form>
 

        
          <!--   jQuery -->
          <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

          <!-- Select2 CSS -->
          <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/css/select2.min.css" rel="stylesheet" />

          <!-- Select2 JS -->
          <script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.13/js/select2.min.js"></script>

          <script>
              $(document).ready(function () {
                
                
                $('#assign_to').select2({
                  placeholder: 'Search for a user',
                  allowClear: true,
                  ajax: {
                      url: '{{ route("tasks.getUsers") }}',  
                      dataType: 'json',
                      delay: 250,
                      data: function (params) {
                          return {
                              q: params.term  
                          };
                      },
                      processResults: function (data) {
                          return {
                              results: data.map(function (user) {
                                  return {
                                      id: user.id,
                                      text: user.name + ' (' + user.user_type + ')'  
                                  };
                              })
                          };
                      },
                      cache: true
                  }
                });


                 
                $('#task-form').submit(function (event) {
                  event.preventDefault();
                  var formData = $(this).serialize();
                  var $submitButton = $('#create-task-button'); // Reference to the submit button

                  // Add loader and disable the button
                  $submitButton.html('<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Processing...')
                      .prop('disabled', true);

                  $.ajax({
                      url: '{{ route("task.store") }}',  
                      type: 'POST',
                      data: formData,
                      success: function (response) {
                          if (response.status === 'success') {
                              // Show success alert
                              Swal.fire({
                                  icon: 'success',
                                  title: response.message,
                                  showConfirmButton: false,
                                  timer: 3000
                              });
 
                              window.location.href = response.redirect_url;
                          }
                      },
                      error: function (xhr) {
                          alert('Error: ' + xhr.responseJSON.message);   
                          $submitButton.html('Create Task').prop('disabled', false);
                      }
                  });
                });

                  $('#task-form').validetta({
                    realTime: true, 
                          bubblePosition: 'bottom', 
                    onValid: function(e) { 
                      return true;
                    },
                    onError: function(e) { 
                      e.preventDefault();
                    }
                    }); 
                   });
          </script> 
 
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
@endsection 

