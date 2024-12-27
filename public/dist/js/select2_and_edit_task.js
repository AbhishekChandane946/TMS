        // Initialize Select2 on the `assign_to` field
        function initializeSelect2() {
            $('#assign_to').select2({
                placeholder: 'Search for a user',
                allowClear: true,
                dropdownParent: $('#editTaskModal'), // Attach dropdown to the modal
                ajax: {
                    url: '{{ route("tasks.getUsers") }}',
                    dataType: 'json',
                    delay: 250,
                    data: function (params) {
                        return {
                            q: params.term // Pass search term
                        };
                    },
                    processResults: function (data) {
                        return {
                            results: data.map(function (user) {
                                return {
                                    id: user.id,
                                    text: user.name + ' (' + user.role_name + ')' // Format user name with role
                                };
                            })
                        };
                    },
                    cache: true
                }
            });
         }

        // Handle Edit Task button click
        // $(document).on('click', '.edit-task', function () {
        //     var taskId = $(this).data('id');

        //     // Fetch task data via AJAX
        //     $.ajax({
        //         url: '/tasks/' + taskId,
        //         method: 'GET',
        //         success: function (response) {
        //             // Populate task details in the modal
        //             $('#taskId').val(response.data.id);
        //             $('input[name="title"]').val(response.data.title);
        //             $('textarea[name="task_description"]').val(response.data.task_description);
        //             $('input[name="start_date"]').val(response.data.start_date);
        //             $('input[name="end_date"]').val(response.data.end_date);
        //             $('input[name="flag"]').val(response.data.flag);
        //             $('select[name="priority"]').val(response.data.priority);

        //             // Clear current selection and set preselected user
        //             var assignToUser = {
        //                 id: response.data.assign_to, // User ID
        //                 text: response.data.user.name + ' (' + response.data.user.user_type + ')' // User Name with Role
        //             };

        //             // Clear previous options and set the preselected user
        //             $('#assign_to').empty(); // Clear previous options
        //             var newOption = new Option(assignToUser.text, assignToUser.id, true, true);
        //             $('#assign_to').append(newOption).trigger('change');

        //             // Reinitialize Select2 for the modal
        //             initializeSelect2();

        //             // Show the modal
        //             $('#editTaskModal').modal('show');
        //         },
        //         error: function (xhr, status, error) {
        //             console.error('Error fetching task data:', error);
        //         }
        //     });
        // });