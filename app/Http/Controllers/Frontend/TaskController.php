<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use App\Models\Task;   
use App\Http\Controllers\Controller;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;

class TaskController extends Controller
{
  
    public function index()
    {
        return view('frontend.task');
    }

 
    public function store(Request $request)
    {
        try {
            $validated = $request->validate([
                'title' => 'required|string|max:255',
                'task_description' => 'required|string',
                'assign_to' => 'required|array',
                'start_date' => 'required|date',
                'end_date' => 'required|date',
                'flag' => 'required|string|max:255',
                'priority' => 'required|string',
            ]);
    
            $task = Task::create([
                'title' => $validated['title'],
                'task_description' => $validated['task_description'],
                'assign_to' => implode(',', $validated['assign_to']),
                'task_created_by' => Auth::id(),
                'start_date' => $validated['start_date'],
                'end_date' => $validated['end_date'],
                'flag' => $validated['flag'],
                'priority' => $validated['priority'],
                'user_id' => Auth::id(),
            ]);
    
            return response()->json([
                'status' => 'success',
                'message' => 'Task created successfully!',
                'redirect_url' => route('display')
            ]);
        } catch (\Illuminate\Validation\ValidationException $e) {
            $response['status'] = 'failed';
            $response['message'] = 'All Fields Required';
            $response['errors'] = $e->errors();  
            return response()->json($response, 422);  
        } catch (\Exception $e) {
            $response['message'] = 'An error occurred while creating the task. Please try again later.';
            $response['status'] = "failed";
            $response['act'] = "TERMINATE";
            return response()->json($response);
        }
    }
    

    
 
    public function getUsers(Request $request)
    {
        $search = $request->get('q');  

        $users = User::where('name', 'LIKE', "%{$search}%")
                     ->orWhere('user_type', 'LIKE', "%{$search}%")
                     ->select('id', 'name', 'user_type')  
                     ->take(10)  
                     ->get();

        return response()->json($users);
    }
    

// LIST AND DISPLAY 
    public function getTasksList(Request $request)
    {
        $start  = $request->input('start', 0); 
        $length = $request->input('length', 10); 
        $page   = ($start / $length) + 1;  
    
        $query = Task::query()
            ->leftJoin('users as assign_to_user', 'tasks.assign_to', '=', 'assign_to_user.id')  
            ->leftJoin('users as created_by_user', 'tasks.task_created_by', '=', 'created_by_user.id') 
            ->select([
                'tasks.id',
                'tasks.title',
                'tasks.task_description',
                'assign_to_user.name as assign_to_name', 
                'created_by_user.name as task_created_by_name',  
                'tasks.start_date',
                'tasks.end_date',
                'tasks.flag',
                'tasks.priority',
                'tasks.status'
            ]); 
    
        $data = $query->paginate($length, ['*'], 'page', $page); 
    
        $tableData = $data->map(function ($item) {
            // Determine the buttons based on task status
            $buttons = '<div class="btn-group" role="group">
                            <button class="btn btn-sm btn-primary edit-task d-inline-block"
                                data-id="' . $item->id . '"
                                data-bs-toggle="modal"
                                data-bs-target="#editTaskModal">
                            Edit
                            </button>';
    
            // Show delete button if status is not 'deleted'
            if ($item->status !== 'deleted') {
                $buttons .= '<button class="btn btn-sm btn-danger delete-task d-inline-block" 
                                data-id="' . $item->id . '">
                                Delete
                            </button>';
            } else {
                // Show restore button if status is 'deleted'
                $buttons .= '<button class="btn btn-sm btn-success restore-task d-inline-block" 
                                data-id="' . $item->id . '">
                                Restore
                            </button>';
            }
    
            $buttons .= '</div>';

        // Add "View Details" button
        $viewDetailsButton = ' <button class="mb-2 btn btn-sm btn-info view-task d-inline-block" 
                                data-id="' . $item->id . '"
                                data-bs-toggle="modal"
                                data-bs-target="#viewTaskModal">
                                View Task
                            </button>';

    
            return [
                $item->id,
                $item->title,
                $item->task_description,
                $item->assign_to_name,
                $item->task_created_by_name,  
                $item->start_date,
                $item->end_date,
                $item->flag,
                $item->priority,
                $item->status,
                $viewDetailsButton . ' ' . $buttons,  
            ];
        });
    
        // Prepare the response
        $response = [
            'recordsTotal' => Task::count(),  // Total number of records
            'recordsFiltered' => $data->total(),  // Total number of filtered records
            'data' => $tableData,  // The data to display in the table
            'status' => 'success',
        ];
    
        return response()->json($response);
    }



    public function display()
    {
         
        $columns = [
            ['title' => '#ID', 'data' => 0], 
            ['title' => 'Title', 'data' => 1],
            ['title' => 'Task Description', 'data' => 2],
            ['title' => 'Assign To', 'data' => 3],
            ['title' => 'Task Created By ', 'data' => 4],
            ['title' => 'Start Date', 'data' => 5],
            ['title' => 'End Date', 'data' => 6],
            ['title' => 'Flag', 'data' => 7],
            ['title' => 'Priority', 'data' => 8],
            ['title' => 'Status', 'data' => 9],
            ['title' => 'Actions', 'data' => 10],
        ];
 
        $users = User::select('id', 'name', 'user_type')->get();
     
        return view('frontend.task-table', compact('columns', 'users'));
    }
    
    
// LIST AND DISPLAY 
    

// GET AND UPDATE
    public function getTaskById($id)
    { 
        $task = Task::with('user')->findOrFail($id);
        // dd($task); 
        return response()->json([
            'data' => $task
        ]);
    }
    
    public function updateTask(Request $request)
    {
        try { 
            $task = Task::findOrFail($request->input('id'));
 
            if ($task->task_created_by != Auth::id()) {
                return response()->json(['status' => 'error', 'message' => 'You are not authorized to update this task']);
            }
 
            $task->title = $request->input('title');
            $task->task_description = $request->input('task_description');
            $task->assign_to = $request->input('assign_to');
            $task->start_date = $request->input('start_date');
            $task->end_date = $request->input('end_date');
            $task->flag = $request->input('flag');
            $task->priority = $request->input('priority');
    
            $task->save();
    
            return response()->json(['status' => 'success', 'message' => 'Task updated successfully']);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Failed to update task']);
        }
    }
    

// GET AND UPDATE


// DELETE AND RESTORE 
    public function deleteTask($id)
    {
        try { 
            $task = Task::findOrFail($id); 
            if ($task->task_created_by != Auth::id()) {
                return response()->json([
                    'status' => 'error', 
                    'message' => 'You are not authorized to delete this task'
                ]);
            }
            if ($task->status === 'deleted') {
                return response()->json(['status' => 'error', 'message' => 'Task is already deleted']);
            }
            $task->status = 'deleted';
            $task->save();
    
            return response()->json(['status' => 'success', 'message' => 'Task status updated to deleted']);
        } catch (\Exception $e) {
            // Log the error for debugging purposes
            \Log::error('Error updating task status to deleted', ['error' => $e->getMessage()]);
    
            return response()->json(['status' => 'error', 'message' => 'Failed to update task status']);
        }
    }


    public function restoreTask($id)
    {
        try {
            
            $task = Task::findOrFail($id);
    
           
            if ($task->task_created_by != Auth::id()) {
                return response()->json(['status' => 'error', 'message' => 'You are not authorized to restore this task']);
            }
    
            
            $task->status = 'active';
            $task->save();
    
            return response()->json(['status' => 'success', 'message' => 'Task restored successfully']);
        } catch (\Exception $e) {
            return response()->json(['status' => 'error', 'message' => 'Failed to restore task']);
        }
    }
        
//  DELETE AND RESTORE
    

    


    




    //GET FEEDBACK ENTRIES #LIST ------CONTROLLER
    // public function getFeedbackEntriesList($feedbackId, Request $request)
    // {
    //     try {
    //         $start  = $request->input('start', 0); 
    //         $length = $request->input('length', 10); 
    //         $search = $request->input('search');             
    //         $page   = ($start / $length) + 1;

    //         //SEARCH
    //         $query = UserFeedback::with(['user', 'feedback', 'feedbackQuestion'])
    //                 ->where('feedback_id', $feedbackId)
    //                 ->orderBy('id', 'desc');

    //         if (!empty($search)) {
    //             $query->where(function ($q) use ($search) {
    //                 $q->where('id', 'like', "%$search%")
    //                     ->orWhereHas('user', function ($q2) use ($search) {
    //                         $q2->where('name', 'like', "%$search%");
    //                     })
    //                     ->orWhereHas('feedback', function ($q3) use ($search) {
    //                         $q3->where('title', 'like', "%$search%");
    //                     })
    //                     ->orWhereHas('feedbackQuestion', function ($q4) use ($search) {
    //                         $q4->where('label', 'like', "%$search%");
    //                     })
    //                     ->orWhere('answer', 'like', "%$search%");
    //             });
    //         }

    //         $data = $query->paginate($length, ['*'], 'page', $page);
    //         //END

    //         $tableData=array();

    //         $tableData = $data->map(function ($item) {
    //             return [
    //                 $item->id,
    //                 $item->user ? $item->user->name : '', 
    //                 $item->feedback ? $item->feedback->title : '', 
    //                 $item->feedbackQuestion ? $item->feedbackQuestion->label : '', 
    //                 $item->feedbackQuestion->type == "rating" ? str_repeat('★', min($item->answer, 5)) : $item->answer,
    //                 isset($item->created_at) ? Carbon::parse($item->created_at)->format('d-m-Y') : 'N/A',
    //             ];
    //         });

    //         $response = [
    //             'recordsTotal' => UserFeedback::where('feedback_id', $feedbackId)->count(), 
    //             'recordsFiltered' => $data->total(), 
    //             'data' => $tableData,
    //             'status' => 'success',
    //         ];

    //         return response()->json($response);
    //     } catch (\Exception $e) {
    //         return response()->json([
    //             'status' => 'failed',
    //             'message' => 'An error occurred while fetching data. Please try again later.'
    //         ]);
    //     }
    // }
    
 
    





















  






    
    

    
 

}



