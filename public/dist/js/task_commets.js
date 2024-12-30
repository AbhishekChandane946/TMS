        // COMMENTS
        $(document).ready(function () {
            function fetchComments(taskId) {
                $.ajax({
                    url: '{{ route("tasks.getComments", ["task" => "__taskId__"]) }}'.replace('__taskId__', taskId), // Adjust route as needed
                    method: 'GET',
                    success: function (response) {
                        if (response.status === 'success') {
                            // Clear the current comments list
                            $('#commentsList').empty();

                            // Loop through the comments and append them to the list
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
                                        <hr>
                                    </div>`;
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

            // Handle view task button click
            $(document).on('click', '.view-task', function () {
                const taskId = $(this).data('id');
                console.log('Task ID:', taskId);

                // Store the task ID in a hidden input field within the comment form
                $('#commentForm').find('input[name="task_id"]').val(taskId);

                // Activate the Comments tab
                $('#commentsTab').tab('show');

                // Fetch and display existing comments
                fetchComments(taskId);
            });

            // Handle Add Comment button click
            $('#commentForm').on('submit', function (e) {
                e.preventDefault();

                const comment = $('#commentInput').val().trim(); // Get and trim the comment input
                const taskId = $('#commentForm').find('input[name="task_id"]').val(); // Ensure task_id is set

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

                            // Refresh the comments list
                            fetchComments(taskId);

                            // Clear the comment input field
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

                // Populate the comment text in the textarea for editing
                $('#commentInput').val(commentText);

                // Optionally store the comment ID in a hidden field
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
                                }
                            },
                            error: function (xhr, status, error) {
                                console.error('Error deleting comment:', error);
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Error!',
                                    text: 'Failed to delete the comment. Please try again.',
                                    showConfirmButton: true
                                });
                            }
                        });
                    }
                });
            });
        });