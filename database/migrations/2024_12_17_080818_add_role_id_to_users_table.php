<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->unsignedBigInteger('role_id')->nullable()->after('name'); // Add the role_id column after the 'name' column
            $table->foreign('role_id')->references('id')->on('roles')->onDelete('set null'); // Assuming you have a 'roles' table
        });
    }
    
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign(['role_id']); // Drop tclhe foreign key
            $table->dropColumn('role_id'); // Drop the column
        });
    }
     
};
