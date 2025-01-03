<?php

namespace App\Http\Controllers\Frontend;

use App\Http\Controllers\Controller;
use App\Models\Task;
use App\Models\TaskComment;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class TaskCommentController extends Controller
{
    //



    public function show(Task $task)
    {
        return response()->json([
            'task' => $task,
            'comments' => $task->comments()->with('user')->get(),
        ]);
    }


    public function store(Request $request)
    {
        $validated = $request->validate([
            'task_id' => 'required|exists:tasks,id',
            'comment' => 'required|string',
        ]);

        $task = Task::findOrFail($validated['task_id']);
        $task->comments()->create([
            'user_id' =>Auth::id(),
            'comment' => $validated['comment'],
        ]);

        // return redirect()->back()->with('success', 'Comment added successfully.');
        return response()->json([
            'status' => 'success',
            'message' => 'Comment Added Successfully!',
            'redirect_url' => route('display')
        ]);

    }

    public function destroy($id)
    {
        try {
            $comment = TaskComment::findOrFail($id);  

        
            if ($comment->user_id !== Auth::id() ) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'You are not authorized to delete this comment.'
                ], 403); // Forbidden
            }

            $comment->delete(); // Delete the comment

            return response()->json([
                'status' => 'success',
                'message' => 'Comment deleted successfully.'
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to delete the comment. Please try again.'
            ], 500);
        }
    }







    public function getComments($taskId)
    {

        $comments = TaskComment::where('task_id', $taskId)
        ->with('user:id,name') 
        ->orderBy('created_at', 'desc') // Order by newest first
        ->get();

        // $comments = TaskComment::where('task_id', $taskId)->get();
        $formattedComments = $comments->map(function ($comment) {
            return [
                'id' => $comment->id,
                'comment' => $comment->comment,
                'created_at' => $comment->created_at->format('Y-m-d H:i:s'),
                'user_name' => $comment->user ? $comment->user->name : ' ',
            ];
        });

        return response()->json([
            'status' => 'success',
            'data' => $formattedComments
        ]);

    }



  

    public function update(Request $request, $id)
    {
        $request->validate([
            'comment' => 'required|string|max:255',  
        ]);
        try {
            $comment = TaskComment::findOrFail($id); 
            if ($comment->user_id !== Auth::id() ) {
                return response()->json([
                    'status' => 'error',
                    'message' => 'You are not authorized to update this comment.'
                ], 403); // Forbidden
            }
            $comment->update([
                'comment' => $request->comment, 
            ]);
            return response()->json([
                'status' => 'success',
                'message' => 'Comment updated successfully.',
                'data' => $comment
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 'error',
                'message' => 'Failed to update the comment. Please try again.',
                'error' => $e->getMessage()
            ], 500);
        }
    }






}
